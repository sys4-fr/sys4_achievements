-- Definitions of chat commands --

-- Get achievement artificially
minetest.register_chatcommand("gawd", {
	params = "award name",
	description = "gawd: give award to self",
	func = function(name, param)
		awards.give_achievement(name,param)
	end
})

-- Enable or not craftmode
minetest.register_chatcommand("sys4_craftmode",
{
   params = "on or off",
   description = "sys4_craftmode : enable or not sys4_achievements locked crafts.",
   func = function(name, param)
      if param == "on" then	 
	 sys4_achievements.craftmode = true
	 minetest.chat_send_player(name, "Sys4 craft mode enabled.")
      else
	 sys4_achievements.craftmode = false
	 minetest.chat_send_player(name, "Sys4 craft mode disabled.")
      end
   end
})

-- set level of difficulty
minetest.register_chatcommand("sys4_level",
{
   params = "Integer",
   description = "sys4_level : enable or not sys4_achievements level of difficulty.",
   func = function(name, param)
      local number = nil
      if param and param ~= "" then
	 number = tonumber(param)
	 if number ~= nil and number > 0 then
	    sys4_achievements.level = number
	    minetest.chat_send_player(name, "Sys4 level changed to "..number..". Please restart the game for changes take effects.")
	 else
	    minetest.chat_send_player(name, "Sys4 level : param error, please type a number !")
	 end
      else
	 minetest.chat_send_player(name, "Sys4 level : no parameter !")
      end
   end
})

-- Get achievements list name
minetest.register_chatcommand("sys4_getlist",
{
   params = "none",
   description = "Get available list of achievements to use.",
   func = function(name)
      minetest.chat_send_player(name, "List of achievements that you can use : "..sys4_achievements.getAchievementsList())
   end
})

-- Set achievements list
minetest.register_chatcommand("sys4_setlist",
{
   params = "Name of the achievements list",
   description = "sys4_setlist : set achievements list.",
   func = function(name, param)
      if param and param ~= "" then
	 sys4_achievements.setAchievementsList(param)
	 minetest.chat_send_player(name, "Sys4 achievements list changed to '"..param.."'. Please restart the game for changes take effects.")
      else
	 minetest.chat_send_player(name, "Sys4 achievements : no parameter !")
      end
   end
})

