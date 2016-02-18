-- SYS4 Achievements
-- by Sys4

-- achievements.lua file
-- this file contains many achievements

local S = sys4_achievements.intllib

sys4_achievements.achievements = {}
sys4_achievements.achievements['sys4'] = {}

function sys4_achievements.mkach(ach_type, ach_name, ach_title, ach_icon, targetNode, countTarget, prizes, items, book, ach_req)

   local oTargets = {}
   if type(targetNode) == "table" then
      for i=1, #targetNode do
	 table.insert(oTargets, targetNode[i])
      end

      targetNode = targetNode[1]
   elseif targetNode ~= nil then
      oTargets = {targetNode}
   end
   
   local a = {
      name = ach_name,
      title = S(ach_title),
      node = targetNode,
      desc = S(ach_type).." "..countTarget.." "..S(targetNode)..".",
      icon = ach_icon,
      type = ach_type,
      target = countTarget,
      titems = items,
      tprizes = prizes,
      tbook = book,
      award_req = ach_req,
      otherTargets = oTargets
   }

   return a
end

dofile(minetest.get_modpath("sys4_achievements").."/achievements/digger.lua")
dofile(minetest.get_modpath("sys4_achievements").."/achievements/crafter.lua")
dofile(minetest.get_modpath("sys4_achievements").."/achievements/placer.lua")

local achievementsList = {'default', 'sys4', 'sys4_2', 'experimental'}

function sys4_achievements.getAchievementsList()
   return achievementsList[1]..", "..achievementsList[2]..", "..achievementsList[3]..", "..achievementsList[4]
end

function sys4_achievements.setAchievementsList(listName)
   minetest.setting_set("sys4_setlist", listName)
   minetest.setting_save()
end

function sys4_achievements.post_register(ach, otherTargets, trigger)
   if ach and otherTargets and trigger and ach ~= nil and otherTargets ~= nil and trigger ~= nil then
      local award = ach.award
--      local node = ach.node
      local target = ach.target

      if trigger == "dig" then
	 awards.register_onDig(
	    function(player, data)
	       local playern = player:get_player_name()
	       
	       if not sys4_achievements.has_achievement(playern, award) and sys4_achievements.getItemCount("dig", nil, otherTargets, playern, data) > target - 1 then
		  return award
	       end
	    end)
      end

      if trigger == "place" then
	 awards.register_onPlace(
	    function(player, data)
	       local playern = player:get_player_name()
	       
	       if not sys4_achievements.has_achievement(playern, award) and sys4_achievements.getItemCount("place", nil, otherTargets, playern, data) > target - 1 then
		  return award
	       end
	    end)
      end

      if trigger == "craft" then
	 awards.register_onCraft(
	    function(player, data)
	       local playern = player:get_player_name()
	       
	       if not sys4_achievements.has_achievement(playern, award) and sys4_achievements.getItemCount("craft", nil, otherTargets, playern, data) > target - 1 then
		  return award
	       end
	    end)
      end
   end
end
