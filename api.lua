-- SYS4 Achievements
-- by Sys4

-- api

sys4_achievements = {}

-- New Waste Node
minetest.register_node("sys4_achievements:waste",
{
   description = "Déchet",
   tiles = {"waste.png"},
   is_ground_content = false,
   groups = {crumbly=2, flammable=2},
})

function sys4_achievements.write_book(items, prizes)
   local text = ""
   
   if prizes and prizes ~= nil then
      text = text.."Félicitations ! Vous gagnez :\n"
      
      local tt = ""
      for i=1, #prizes do
	 local itemstack = ItemStack(prizes[i])
	 tt = tt..itemstack:get_count().." "..itemstack:get_name().."\n"
      end
      text = text..tt.."\n\n"
   end
   
   if items and items ~= nil then
      text = text.."Vous débloquez les crafts de ces objets :\n"
      
      local tt = ""
      for i=1, #items do
	 tt = tt..items[i].."\n"
      end
      text = text..tt.."\n\n"
   end

   return text
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
      awards.tbv(awards.players[playern].count, mod)
      awards.tbv(awards.players[playern].count[mod], item, 0)
      
      
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
		     awards.players[playern].count[mod][item] = awards.players[playern].count[mod][item] + itemstack:get_count()
		     
		     -- Run callbacks and triggers
		     local crafter = player
		     
		     for i=1, #awards.onCraft do
			local res = nil
			if type(awards.onCraft[i]) == "function" then
			   -- Run trigger callback
			   res = awards.onCraft[i](crafter, data)
			elseif type(awards.onCraft[i]) == "table" then
			   -- Handle table trigger
			   if not awards.onCraft[i].node or not awards.onCraft[i].target or not awards.onCraft[i].award then
			      -- table running failed !
			      print("[ERROR] awards - onCraft trigger "..i.." is invalid !")
			   else
			      -- run the table
			      local tnodeCrafted = string.split(awards.onCraft[i].node, ":")
			      local tmod = tnodeCrafted[1]
			      local titem = tnodeCrafted[2]
			      if tmod == nil or titem == nil or not data.count[tmod] or not data.count[tmod][titem] then
				 -- table running failed
			      elseif data.count[tmod][titem] > awards.onCraft[i].target - 1 then
				 res = awards.onCraft[i].award
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
      
      return wasteItem
      
      
   end)

local awards_give_achievement = awards.give_achievement
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
      
      -- Give book
      if awards.def[award] and awards.def[award].book then
	 
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
	 minetest.chat_send_player(name, "Achievement Unlocked: "..title)
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
				       text = "Achievement Unlocked!",
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
