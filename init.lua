-- SYS4 Achievements
-- by Sys4

dofile(minetest.get_modpath("sys4_achievements").."/api.lua")
dofile(minetest.get_modpath("sys4_achievements").."/achievements.lua")

local S = sys4_achievements.intllib

-- Level of difficulty
local lvl = sys4_achievements.level

-- Name of achievements list
local ach_list = "sys4"

-- get achievements list
local a = sys4_achievements.achievements[ach_list]

-- Register achievements
for i=1, #a do
   local tbook = nil
   tbook = {title = "SYS4 AWARDS : "..a[i].title,
	    text = sys4_achievements.write_book(a[i].tbook, a[i].titems, a[i].tprizes)
   }

   awards.register_achievement(
      a[i].name,
      {
	 title = a[i].title,
	 description = a[i].desc,
	 icon = a[i].icon,
	 trigger = { type = a[i].type, node = a[i].node, target = a[i].target},
	 items = a[i].titems,
	 prizes = a[i].tprizes,
	 book = tbook,
	 award_req = a[i].award_req,
	 otherTargets = a[i].otherTargets
      })

   sys4_achievements.post_register(sys4_achievements.getAchievement(a[i].type, a[i].name), a[i].otherTargets, a[i].type)   
end

-- Post register default achievements from awards original mod
local awardTmp = awards.def['award_lumberjack']
sys4_achievements.post_register(sys4_achievements.getAchievement(awardTmp.trigger.type, 'award_lumberjack'), awardTmp.otherTargets, awardTmp.trigger.type)

awardTmp = awards.def['award_mine2']
sys4_achievements.post_register(sys4_achievements.getAchievement(awardTmp.trigger.type, 'award_mine2'), awardTmp.otherTargets, awardTmp.trigger.type)

-- Register secret achievements
-- Secrets achievements table
local sa = {
   { name = 'secret_stuff',
     title = S("Not only Waste"),
     node = 'sys4_achievements:waste',
     desc = S("Dig ")..(100*lvl).." "..S("sys4_achievements:waste")..".",
     icon ="waste.png",
     type = "dig",
     target = 100*lvl,
     titems = nil,
     tprizes = {'default:axe_diamond', 'default:pick_diamond', 'default:shovel_diamond', 'default:sword_diamond', 'farming:hoe_diamond', 'default:furnace', 'default:chest', 'default:meselamp'},
     tbook = S("Vous ne vous avouez pas vaincu si facilement !\nCes objets sont pour vous afin de récompenser votre acharnement.")
   }
}
    
for i=1, #sa do
   local tbook = nil
   if sa[i].tbook and sa[i].tbook ~= nil then
      tbook = {title = "SYS4 AWARDS : "..sa[i].title,
	       text = sys4_achievements.write_book(sa[i].tbook, sa[i].titems, sa[i].tprizes)
      }
   end
   awards.register_achievement(
      sa[i].name,
      {
	 title = sa[i].title,
	 description = sa[i].desc ,
	 icon = sa[i].icon,
	 trigger = { type = sa[i].type, node = sa[i].node, target = sa[i].target},
	 items = sa[i].titems,
	 prizes = sa[i].tprizes,
	 book = tbook,
	 secret = true
      })
end

-- Modify achievements if other mods are detected
if ach_list == "experimental" then
   if minetest.get_modpath("3d_armor") then
      local items = {'3d_armor:boots_wood', '3d_armor:chestplate_wood', '3d_armor:helmet_wood', '3d_armor:leggings_wood'}
      for i=1, #items do
	 table.insert(awards.def['wood_crafter_begins'].items, items[i])
      end
   end
   
   if minetest.get_modpath("shields") then
      table.insert(awards.def['wood_crafter_begins'].items, 'shields:shield_wood')
   end
end

