-- SYS4 Achievements
-- by Sys4

local S = sys4_achievements.intllib

-- api
local craftmode = true

-- New Waste Node
minetest.register_node("sys4_achievements:waste",
{
   description = S("Waste"),
   tiles = {"waste.png"},
   is_ground_content = false,
   groups = {crumbly=2, flammable=2},
})

function sys4_achievements.write_book(items, prizes)
   local text = ""
   
   if prizes and prizes ~= nil then
      text = text..S("Amazing ! You win").." :\n"
      
      local tt = ""
      for i=1, #prizes do
	 local itemstack = ItemStack(prizes[i])
	 tt = tt..itemstack:get_count().." "..itemstack:get_name().."\n"
      end
      text = text..tt.."\n"
   end
   
   if items and items ~= nil then
      text = text..S("You unlock these crafts").." :"
      
      local tt = "\n"
      for i=1, #items do
	 tt = tt.."\n"..items[i].." - "..S("Craft table").." :\n\n"
	 tt = tt..sys4_achievements.getCraftRecipes(items[i])
	 tt = tt.."------------]]][[[------------\n"
      end
      text = text..tt.."\n"
   end

   return text
end

function sys4_achievements.getCraftRecipes(itemName)
   local str = ""
   if itemName ~= nil and itemName ~= "" then
      local craftRecipes = minetest.get_all_craft_recipes(itemName)

      if craftRecipes ~= nil then
	 local first = true
	 for i=1, #craftRecipes do
	    if craftRecipes[i].type == "normal" then
	       if not first then
		  str = str.."\n---]] "..S("OR").." [[---\n\n"
	       end
	       
	       first = false
	       local width = craftRecipes[i].width
	       local items = craftRecipes[i].items
	       local maxn = table.maxn(items)
	       local h = 0
	       local g
	       if width == 0 then
		  g = 1
		  while g*g < maxn do g = g + 1 end
		  width = maxn
	       else
		  h = math.ceil(maxn / width)
		  g = width < h and h or width
	       end
	       
	       for y=1, g do
		  str = str..y..": "
		  for x=1, width do
		     local item = items[(y-1) * width + x]
		     if item ~= nil then
			str = str.."'"..item.."' "
		     else
			str = str.."'"..S("empty").."' "
		     end
		     if x == width then
			str = str.."\n"
		     end
		  end
	       end
	    end
	 end
      end
   else
      str = S("No craft for this item").."\n"
   end
   return str
end

function sys4_achievements.getAchievement(onType, name)
   local registeredAchievements

   if onType == "dig" then
      registeredAchievements = awards.onDig
   end

   if onType == "place" then
      registeredAchievements = awards.onPlace
   end

   if onType == "craft" then
      registeredAchievements = awards.onCraft
   end
   
   for i=1, #registeredAchievements do
      if type(registeredAchievements[i]) == "table" and 
      registeredAchievements[i].award == name then
	 return registeredAchievements[i]
      end
   end
end

function sys4_achievements.has_achievement(name, award)
   local data = awards.players[name]
   
   if not data then
      return
   end
   
   if not awards.def[award] then
      return
   end
   
   awards.tbv(data, "unlocked")
   
   if data.unlocked[award] and data.unlocked[award] == award then
      return true
   else
      return false
   end
end

-- run a function when a node is crafted
function sys4_achievements.register_onCraft(func)
	table.insert(awards.onCraft,func)
end


function sys4_achievements.getItemCount(action_type, mod, items, playern, data)
   local count = 0
   if action_type == "craft" then
      awards.tbv(awards.players[playern].craft, mod)
      for i=1, #items do
	 awards.tbv(awards.players[playern].craft[mod], items[i], 0)
	 count = count + data.craft[mod][items[i]]
      end
   else if action_type == "dig" then
	 awards.tbv(awards.players[playern].count, mod)
	 for i=1, #items do
	    awards.tbv(awards.players[playern].count[mod], items[i], 0)
	    count = count + data.count[mod][items[i]]
	 end
	else if action_type == "place" then
	      awards.tbv(awards.players[playern].place, mod)
	      for i=1, #items do
		 awards.tbv(awards.players[playern].place[mod], items[i], 0)
		 count = count + data.place[mod][items[i]]
	      end
	     else
		return
	     end
	end
   end

   return count
end

-- AWARDS redefinitions

-- add new trigger 'craft'
awards.onCraft = {}

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

awards.assertPlayer = function(playern)
	awards.tbv(awards.players, playern)
	awards.tbv(awards.players[playern], "name", playern)
	awards.tbv(awards.players[playern], "unlocked")
	awards.tbv(awards.players[playern], "place")
	awards.tbv(awards.players[playern], "craft")
	awards.tbv(awards.players[playern], "count")
	awards.tbv(awards.players[playern], "deaths", 0)
	awards.tbv(awards.players[playern], "joins", 0)
	awards.tbv(awards.players[playern], "chats", 0)
end

-- Redefinition of awards.give_achievement for add given book
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
      -- Set award flag
      data.unlocked[award]=award
      
      -- Give Prizes
      if awards.def[award] and awards.def[award].prizes then
	 for i = 1, #awards.def[award].prizes do
	    local itemstack = ItemStack(awards.def[award].prizes[i])
	    if itemstack:is_empty() or not itemstack:is_known() then
	       return
	    end
	    local receiverref = core.get_player_by_name(name)
	    if receiverref == nil then
	       return
	    end
	    receiverref:get_inventory():add_item("main", itemstack)
	 end
      end
      
      -- Sys4
      -- Give book
      if awards.def[award] and awards.def[award].book and craftmode then
	 
	 local itemstack = ItemStack('default:book_written')
	 local book_data = {}
	 book_data.title = awards.def[award].book.title
	 book_data.text = awards.def[award].book.text
	 book_data.owner = name
	 local data_str = minetest.serialize(book_data)
	 itemstack:set_metadata(data_str)
	 local receiverref = core.get_player_by_name(name)
	 if receiverref == nil then return end
	 receiverref:get_inventory():add_item("main", itemstack)
      end
      
      
      -- Get data from definition tables
      local title = award
      local desc = ""
      local background = ""
      local icon = ""
      local custom_announce = ""
      if awards.def[award].title then
	 title = awards.def[award].title
      end
      if awards.def[award].custom_announce then
	 custom_announce = awards.def[award].custom_announce
      end
      if awards.def[award].background then
	 background = awards.def[award].background
      end
      if awards.def[award].icon then
	 icon = awards.def[award].icon
      end
      if awards.def[award] and awards.def[award].description then
	 desc = awards.def[award].description
      end
      
      -- send the won award message to the player
      if awards.show_mode == "formspec" then
	 -- use a formspec to send it
	 minetest.show_formspec(name, "achievements:unlocked", "size[4,2]"..
				   "image_button_exit[0,0;4,2;"..background..";close1; ]"..
				   "image_button_exit[0.2,0.8;1,1;"..icon..";close2; ]"..
				   "label[1.1,1;"..title.."]"..
				   "label[0.3,0.1;"..custom_announce.."]")
      elseif awards.show_mode == "chat" then
	 -- use the chat console to send it
	 minetest.chat_send_player(name, S("Achievement Unlocked: ")..title)
	 if desc~="" then
	    minetest.chat_send_player(name, desc)
	 end
      else
	 local player = minetest.get_player_by_name(name)
	 local one = player:hud_add({
				       hud_elem_type = "image",
				       name = "award_bg",
				       scale = {x = 1, y = 1},
				       text = background,
				       position = {x = 0.5, y = 0},
				       offset = {x = 0, y = 138},
				       alignment = {x = 0, y = -1}
				    })
	 local two = player:hud_add({
				       hud_elem_type = "text",
				       name = "award_au",
				       number = 0xFFFFFF,
				       scale = {x = 100, y = 20},
				       text = S("Achievement Unlocked!"),
				       position = {x = 0.5, y = 0},
				       offset = {x = 0, y = 40},
				       alignment = {x = 0, y = -1}
				    })			
	 local three = player:hud_add({
					 hud_elem_type = "text",
					 name = "award_title",
					 number = 0xFFFFFF,
					 scale = {x = 100, y = 20},
					 text = title,
					 position = {x = 0.5, y = 0},
					 offset = {x = 30, y = 100},
					 alignment = {x = 0, y = -1}
				      })			
	 local four = player:hud_add({
					hud_elem_type = "image",
					name = "award_icon",
					scale = {x = 4, y = 4},
					text = icon,
					position = {x = 0.5, y = 0},
					offset = {x = -81.5, y = 126},
					alignment = {x = 0, y = -1}
				     })
	 minetest.after(3, function()
			   player:hud_remove(one)
			   player:hud_remove(two)
			   player:hud_remove(three)
			   player:hud_remove(four)
			   end)
      end
      
      -- record this in the log	
      minetest.log("action", name.." has unlocked award "..title)
      
      -- save playertable
      awards.save()
   end
end

-- Redefenition of awards.showto for showing crafts to unlock and arrange display
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
				formspec = formspec .. "label[9,2.75;Secret Award]"..
									"image[9.75,0;3,3;unknown.png]"
				if def and def.description then
					formspec = formspec	.. "label[9,3.25;Unlock this award to find out what it is]"				
				end
			else
				local title = item.name
				if def and def.title then
					title = def.title
				end
				local status = ""
				if item.got then
					status = " (got)"
				end
				local icon = ""
				if def and def.icon then
					icon = def.icon
				end
				formspec = formspec .. "label[9,3.25;"..title..status.."]".."label[9,0;"..item.name.."]"..
									"image[9.75,0.5;3,3;"..icon.."]"
				if def and def.description then
					formspec = formspec	.. "label[8,4.25;"..def.description.."]"				
				end

				-- Sys4
				-- Crafts to unlock
				if def and def.items then
				   local items = def.items
				   local y = 5 -- Position y de départ du label
				   formspec = formspec	.. "label[8,"..y..";"..S("Unlock crafts").." :]"
				   
				   local name = ""
				   for i=1, #items do
				      
				      local itemstack = ItemStack(items[i])
				      if itemstack and itemstack ~= nil and itemstack:is_known() then
					 name = itemstack:get_name()
				      else
					 name = "Unknown Item"
				      end
				      y = y + 0.35
				      formspec = formspec .. "label[8,"..y..";- "..name.."]"
				   end
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
					formspec = formspec .. "#ACACACSecret Award"
				else
					local title = award.name			
					if def and def.title then
						title = def.title
					end			
					if award.got then
						formspec = formspec .. minetest.formspec_escape(title)
					else
						formspec = formspec .. "#ACACAC".. minetest.formspec_escape(title)
					end
				end
			end
		end		
		formspec = formspec .. ";"..sid.."]"

		-- Show formspec to user
		minetest.show_formspec(to,"awards:awards",formspec)
	end
end

-- Register new trigger on "craft"
minetest.register_on_craft(
   function(itemstack, player, old_craft_grid, craft_inv)
      -- Par défaut tout craft qui doit donner quelque chose retournera des déchets inutilisables.
      local wasteItem = "sys4_achievements:waste"
      
      local nodeName = itemstack:get_name()
      local nodeCrafted = string.split(nodeName, ":")
      if #nodeCrafted ~= 2 then
	 --minetest.log("error","Awards mod: "..oldnode.name.." is in wrong format!")
	 return
      end
      
      local mod = nodeCrafted[1]
      local item = nodeCrafted[2]
      local playern = player:get_player_name()
      
      if (not playern or not nodeCrafted or not mod or not item) then
	 return
      end
      awards.assertPlayer(playern)
      awards.tbv(awards.players[playern].craft, mod)
      awards.tbv(awards.players[playern].craft[mod], item, 0)
      
      
      -- Si des awards ont été débloqués, ont les parcours pour en extraire les items qu'ils débloquent
      if awards.player(playern) ~= nil then
	 local data = awards.players[playern]
	 for _, str in pairs(data.unlocked) do
	    local def = awards.def[str]
	    if def and def.items then
	       local items = def.items
	       for i=1, #items do
		  -- Si un item débloqué correspond à l'item demandé par l'utilisateur alors on le prend en compte et on retournera l'item (en retournant nil)
		  if items[i] == nodeName then
		     -- Increment counter
		     awards.players[playern].craft[mod][item] = awards.players[playern].craft[mod][item] + itemstack:get_count()
		     
		     -- Run callbacks and triggers
		     local crafter = player
		     
		     for j=1, #awards.onCraft do
			local res = nil
			if type(awards.onCraft[j]) == "function" then
			   -- Run trigger callback
			   res = awards.onCraft[j](crafter, data)
			elseif type(awards.onCraft[j]) == "table" then
			   -- Handle table trigger
			   if not awards.onCraft[j].node or not awards.onCraft[j].target or not awards.onCraft[j].award then
			      -- table running failed !
			      print("[ERROR] awards - onCraft trigger "..j.." is invalid !")
			   else
			      -- run the table
			      local tnodeCrafted = string.split(awards.onCraft[j].node, ":")
			      local tmod = tnodeCrafted[1]
			      local titem = tnodeCrafted[2]
			      if tmod == nil or titem == nil or not data.craft[tmod] or not data.craft[tmod][titem] then
				 -- table running failed
			      elseif data.craft[tmod][titem] > awards.onCraft[j].target - 1 then
				 res = awards.onCraft[j].award
			      end
			   end
			end
			
			if res then
			   awards.give_achievement(playern,res)
			end
		     end
		     
		     return nil
		  end
	       end
	    end
	 end
      end
      
      if craftmode then
	 return wasteItem
      else
	 return nil
      end
      
   end)


minetest.register_chatcommand("gawd", {
	params = "award name",
	description = "gawd: give award to self",
	func = function(name, param)
		awards.give_achievement(name,param)
	end
})

minetest.register_chatcommand("craftmode",
{
   params = "on or off",
   description = "craftmode : enable or not sys4_achievements locked crafts.",
   func = function(name, param)
      if param == "on" then	 
	 craftmode = true
	 minetest.chat_send_player(name, "Sys4 craft mode enabled")
      else
	 craftmode = false
	 minetest.chat_send_player(name, "Sys4 craft mode disabled")
      end
   end
})


-- Fonction qui se déclenche quand le joueur place un objet dans son environnement.
-- Cette fonction est normalement déjà définie dans 'awards' : minetest.register_on_place = func(...)
-- Mais elle ne se déclenche pas pour certains objets comme les troncs d'arbres.
-- Ces types d'objets possèdent une propriété on_place = minetest.rotate_node 
-- qu'il faut redéfinir par cette fonction pour nos besoins.
function sys4_achievements.register_onPlace(itemstack, placer, pointed_thing)

   if not placer or not pointed_thing or not itemstack or not placer:get_player_name() or placer:get_player_name()=="" then
      return
   end

   
   -- Code pour le systeme awards
   local nodedug = string.split(itemstack:get_name(), ":")
   if #nodedug ~= 2 then
      --minetest.log("error","Awards mod: "..node.name.." is in wrong format!")
      return
   end
   local mod=nodedug[1]
   local item=nodedug[2]
   local playern = placer:get_player_name()
   
   -- Run checks
   if (not playern or not nodedug or not mod or not item) then
      return
   end
   awards.assertPlayer(playern)
   awards.tbv(awards.players[playern].place, mod)
   awards.tbv(awards.players[playern].place[mod], item, 0)
   
   -- Increment counter
   awards.players[playern].place[mod][item] = awards.players[playern].place[mod][item] + 1
   
   -- Run callbacks and triggers
   local player = placer
   local data = awards.players[playern]
   for i=1,# awards.onPlace do
      local res = nil
      if type(awards.onPlace[i]) == "function" then
	 -- Run trigger callback
	 res = awards.onPlace[i](player,data)
      elseif type(awards.onPlace[i]) == "table" then
	 -- Handle table trigger
	 if not awards.onPlace[i].node or not awards.onPlace[i].target or not awards.onPlace[i].award then
	    print("[ERROR] awards - onPlace trigger "..i.." is invalid!")
	 else
	    -- run the table
	    local tnodedug = string.split(awards.onPlace[i].node, ":")
	    local tmod = tnodedug[1]
	    local titem = tnodedug[2]
	    if tmod==nil or titem==nil or not data.place[tmod] or not data.place[tmod][titem] then
	       -- table running failed!
	    elseif data.place[tmod][titem] > awards.onPlace[i].target-1 then
	       res = awards.onPlace[i].award
	    end
	 end
      end
      
      if res then
	 awards.give_achievement(playern,res)
      end
   end
  
   -- Meme portion de code que dans la fonction core.rotate_node
   core.rotate_and_place(itemstack, placer, pointed_thing,
			 core.setting_getbool("creative_mode"),
			 {invert_wall = placer:get_player_control().sneak})
   return itemstack   
end


-- Redéfinition de la propriété on_place de ces nodes

local nodes = {
   minetest.registered_nodes["default:tree"],
   minetest.registered_nodes["default:jungletree"],
   minetest.registered_nodes["default:acacia_tree"],
   minetest.registered_nodes["default:pine_tree"],
}

for i=1, #nodes do
   nodes[i].on_place = sys4_achievements.register_onPlace
end

