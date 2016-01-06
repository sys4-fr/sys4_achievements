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
	 sys4_achievements.setCraftMode(true)
	 minetest.chat_send_player(name, "Sys4 craft mode enabled. Please restart the game for changes take effects.")
      else
	 sys4_achievements.setCraftMode(false)
	 minetest.chat_send_player(name, "Sys4 craft mode disabled. Please restart the game for changes take effects.")
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
	    sys4_achievements.setLevel(number)
	    minetest.chat_send_player(name, "Sys4 level changed to "..number..". Please restart the game for changes take effects.")
	 else
	    minetest.chat_send_player(name, "Sys4 level : param error, please type a number !")
	 end
      else
	 minetest.chat_send_player(name, "Sys4 level : no parameter !")
      end
   end
})
