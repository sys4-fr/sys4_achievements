-- SYS4 Achievements
-- by Sys4

-- awards.lua
-- This file contains func redefinitions of original awards mod

local S = sys4_achievements.intllib

-- add new trigger 'craft'
awards.onCraft = {}

-- run a function when a node is crafted
awards.register_onCraft = function(func)
   table.insert(awards.onCraft,func)
end

local add_trig = awards._additional_triggers
awards._additional_triggers = function(name, data_table)
   if data_table.trigger.type == "craft" then
      local tmp = {
	 award = name,
	 node = data_table.trigger.node,
	 target = data_table.trigger.target,
      }
      table.insert(awards.onCraft, tmp)
   else
      add_trig(name, data_table)
   end
end

local assertPlayer = awards.assertPlayer
awards.assertPlayer = function(playern)
   assertPlayer(playern)
   awards.tbv(awards.players[playern], "craft")
end

-- Redefinition of awards.give_achievement for add given book
local give_achievement = awards.give_achievement
awards.give_achievement = function (name, award)

   -- Access Player Data
   local data = awards.players[name]
   
   -- Perform checks
   if not data then
      return
   end
   if not awards.def[award] then
      return
   end
   awards.tbv(data,"unlocked")
   
   -- check to see if the player does not already have that achievement
   if not data.unlocked[award] or data.unlocked[award]~=award then
      -- Give book if bookmode enabled
      if sys4_achievements.books and awards.def[award] and awards.def[award].book then
	 
	 -- Create book
	 local itemstack = ItemStack('default:book_written')

	 -- Book metadata
	 local book_data = {}
	 book_data.title = awards.def[award].book.title
	 book_data.text = awards.def[award].book.text
	 book_data.owner = name

	 local data_str = minetest.serialize(book_data)
	 itemstack:set_metadata(data_str)
	 
	 -- Add book to player inventory
	 local receiverref = core.get_player_by_name(name)
	 if receiverref == nil then return end
	 receiverref:get_inventory():add_item("main", itemstack)
      end
   end

   -- exec defaut awards code
   give_achievement(name, award)
end

-- Redefenition of awards.showto
-- This function display related infos of an achievement.
-- When craftmode is enabled, this function will display crafts that achievement unlock.
awards.showto = function(name, to, sid, text)
   if name == "" or name == nil then
      name = to
   end
   if text then
      if not awards.players[name] or not awards.players[name].unlocked  then
	 minetest.chat_send_player(to, "You have not unlocked any awards")
	 return
      end
      minetest.chat_send_player(to, name.."'s awards:")

      for _, str in pairs(awards.players[name].unlocked) do
	 local def = awards.def[str]
	 if def then
	    if def.title then
	       if def.description then				
		  minetest.chat_send_player(to, def.title..": "..def.description)
	       else
		  minetest.chat_send_player(to, def.title)
	       end
	    else
	       minetest.chat_send_player(to, str)
	    end
	 end
      end
   else
      if sid == nil or sid < 1 then
	 sid = 1
      end
      local formspec = "size[15,8]"			
      local listofawards = awards._order_awards(name)
      
      -- Sidebar
      if sid then
	 local item = listofawards[sid+0]
	 local def = awards.def[item.name]
	 if def and def.secret and not item.got then
	    local award_req = ""
	    if def.award_req then
	       award_req = def.award_req
	       local reqTitle = awards.def[award_req].title
	       if sys4_achievements.isAwardGot(award_req, listofawards) then
		  award_req = S("Requiered").." : "..reqTitle.." ("..S("got")..")"
	       else
		  award_req = S("Requiered").." : "..reqTitle
	       end
	       formspec = formspec .. "label[9,3.75;- "..award_req.." -]"
	    end
	    formspec = formspec .. "label[9,2.75;"..S("Secret Award").."]"..
	       "image[9.75,0;3,3;unknown.png]"
	    if def and def.description then
	       formspec = formspec	.. "label[9,3.25;"..S("Unlock this award to find out what it is").."]"				
	    end
	 else
	    local title = item.name
	    if def and def.title then
	       title = def.title
	    end
	    local status = ""
	    if item.got then
	       status = " ("..S("got")..")"
	    end
	    local icon = ""
	    if def and def.icon then
	       icon = def.icon
	    end
	    local award_req = ""
	    if def and def.award_req then
	       award_req = def.award_req
	       local reqTitle = awards.def[award_req].title
	       if sys4_achievements.isAwardGot(award_req, listofawards) then
		  award_req = S("Requiered").." : "..reqTitle.." ("..S("got")..")"
	       else
		  award_req = S("Requiered").." : "..reqTitle
	       end
	       formspec = formspec .. "label[9,3.75;- "..award_req.." -]"
	    end

	    formspec = formspec .. "label[9,3.25;"..title..status.."]"--.."label[9,0;"..item.name.."]"
	       .."image[9.75,0.5;3,3;"..icon.."]"

	    if def and def.description then
	       formspec = formspec	.. "label[8,4.25;"..def.description.."]"				
	    end

	    -- Crafts to unlock when craftmode is on else display content of the book
	    if sys4_achievements.craftmode and def and def.items then
	       local items = def.items
	       local y = 5 -- Position y de départ du label
	       formspec = formspec	.. "label[8,"..y..";"..S("Unlock crafts").." :]"
	       
	       for i=1, #items do
		  local name = ""				      
		  local itemstack = ItemStack(items[i])
		  if itemstack and itemstack ~= nil and itemstack:is_known() then
		     name = itemstack:get_name()
		  else
		     name = "Unknown Item"
		  end
		  y = y + 0.35
		  formspec = formspec .. "label[8,"..y..";- "..S(name).."]"
	       end
	    elseif not sys4_achievements.craftmode and def and def.book and def.book.text then
	       formspec = formspec .. "label[8,5;"..sys4_achievements.formatShowto(def.book.text).."]"
	       
	    end
	 end
      end
      
      -- Create list box
      formspec = formspec .. "textlist[0,0;6.75,8;awards;"		
      local first = true
      for _,award in pairs(listofawards) do
	 local def = awards.def[award.name]
	 if def then
	    if not first then
	       formspec = formspec .. ","
	    end
	    first = false
	    
	    if def.secret and not award.got then
	       if def.award_req then
		  local requieredAward = def.award_req
		  if not sys4_achievements.isAwardGot(requieredAward, listofawards) then
		     formspec = formspec .. "#AC0000"..S("Secret Award")
		  else
		     formspec = formspec .. "#ACAC00"..S("Secret Award")
		  end
	       else
		  formspec = formspec .. "#ACAC00"..S("Secret Award")
	       end
	    else
	       local title = award.name			
	       if def and def.title then
		  title = def.title
	       end			
	       if award.got then
		  formspec = formspec .. "#00AC00".. minetest.formspec_escape(title)
	       else
		  if def.award_req then
		     local requieredAward = def.award_req
		     
		     if not sys4_achievements.isAwardGot(requieredAward, listofawards) then
			formspec = formspec .. "#AC0000".. minetest.formspec_escape(title)
		     else
			formspec = formspec .. "#ACAC00".. minetest.formspec_escape(title)
		     end
		  else
		     formspec = formspec .. "#ACAC00".. minetest.formspec_escape(title)
		  end
	       end
	    end
	 end
      end		
      formspec = formspec .. ";"..sid.."]"

      -- Show formspec to user
      minetest.show_formspec(to,"awards:awards",formspec)
   end
end

-- Add translations for original awards.
for _,award in pairs(awards.def) do
   award.title = S(award.title)
   award.description = S(award.description)
end
