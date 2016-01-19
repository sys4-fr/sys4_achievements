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
local a = sys4_achievements.getAchievements(ach_list, lvl)

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
	 award_req = a[i].award_req
      })
end

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


-- Routine pour compter les items du meme groupe et retourne l'item si son target est atteint.
local achievements = {
   sys4_achievements.getAchievement("dig", "tree_digger"),
   sys4_achievements.getAchievement("dig", "tree_digger_begins"),
   sys4_achievements.getAchievement("dig", "leave_digger_begins"),
   sys4_achievements.getAchievement("dig", "sand_digger_begins"),
   sys4_achievements.getAchievement("dig", "snow_digger_begins"),
   sys4_achievements.getAchievement("dig", "stone_digger_begins"),
   sys4_achievements.getAchievement("dig", "stone_digger"),
   sys4_achievements.getAchievement("dig", "award_lumberjack"),
   sys4_achievements.getAchievement("dig", "award_lumberjack_semipro"),
   sys4_achievements.getAchievement("dig", "award_lumberjack_professional"),
   sys4_achievements.getAchievement("dig", "award_lumberjack_leet"),
   sys4_achievements.getAchievement("dig", "award_mine2"),
   sys4_achievements.getAchievement("dig", "award_mine3"),
   sys4_achievements.getAchievement("dig", "award_mine4"),
   sys4_achievements.getAchievement("dig", "award_marchand_de_sable"),
}

for _,achievement in pairs(achievements) do

   local name = achievement.award
   local node = achievement.node
   local target = achievement.target
   local mod = ""
   local items = {}
   
   if node == 'default:tree' and (name == "award_lumberjack" 
				     or name == "award_lumberjack_semipro"
				     or name == "award_lumberjack_professional"
				     or name == "award_lumberjack_leet")
   then
      mod = 'default'
      items = {'tree', 'pine_tree', 'acacia_tree'}
   elseif node == 'default:tree' then
      mod = 'default'
      items = {'tree', 'pine_tree', 'acacia_tree', 'jungletree'}
	       end
	       
   if node == 'default:leaves' then
      mod = 'default'
      items = {'leaves', 'jungleleaves', 'pine_needles', 'acacia_leaves'}
   end
   
   if node == 'default:sand' then
      mod = 'default'
      items = {'sand', 'desert_sand'}
   end
   
   if node == 'default:snow' then
      mod = 'default'
      items = {'snow', 'snowblock'}
   end
   
   if node == 'default:stone' then
      mod = 'default'
      items = {'stone', 'desert_stone', 'cobble', 'desert_cobble', 'mossycobble'}
   end
   
   awards.register_onDig(
      function(player, data)
	 local playern = player:get_player_name()
	 
	 if not sys4_achievements.has_achievement(playern, name) 
	 and sys4_achievements.getItemCount("dig", mod, items, playern, data) > target - 1 then
	    return name
	 end
      end)
end

achievements = {
	 sys4_achievements.getAchievement("place", "tree_builder_begins"),
	 sys4_achievements.getAchievement("place", "wood_builder_begins"),
	 sys4_achievements.getAchievement("place", "stone_builder_begins"),
	 sys4_achievements.getAchievement("place", "stonebrick_builder_begins"),
}

for _, achievement in pairs(achievements) do

   local achievement = achievements[i]

   local name = achievement.award
   local node = achievement.node
   local target = achievement.target
   local mod = ""
   local items = {}
   
   if node == 'default:tree' then
      mod = 'default'
      items = {'tree', 'jungletree', 'pine_tree', 'acacia_tree'}
   end
   
   if node == 'default:wood' then
      mod = 'default'
      items = {'wood', 'junglewood', 'pine_wood', 'acacia_wood'}
   end
   
   if node == 'default:cobble' then
      mod = 'default'
      items = {'cobble', 'desert_cobble'}
   end
   
   if node == 'default:stone' then
      mod = 'default'
      items = {'stone', 'desert_stone'}
   end
   
   if node == 'default:stonebrick' then
      mod = 'default'
      items = {'stonebrick', 'desert_stonebrick'}
   end
   
   awards.register_onPlace(
      function(player, data)
	 local playern = player:get_player_name()
	 if not sys4_achievements.has_achievement(playern, name)
	 and sys4_achievements.getItemCount("place", mod, items, playern, data) > target - 1 then	    
	    return name
	 end
      end)
end

achievements = {
   sys4_achievements.getAchievement("craft", "planks_crafter"),
   sys4_achievements.getAchievement("craft", "wood_crafter_begins"),
   sys4_achievements.getAchievement("craft", "dye_crafter_begins"),
   sys4_achievements.getAchievement("craft", "wool_crafter_begins"),
   sys4_achievements.getAchievement("craft", "vessel_crafter_begins"),
   sys4_achievements.getAchievement("craft", "bed_crafter"),
}

for _,achievement in pairs(achievements) do
   local name = achievement.award
   local node = achievement.node
   local target = achievement.target
   local mod = ""
   local items = {}
   
   if node == 'default:wood' then
      mod = 'default'
      items = {'wood', 'junglewood', 'pine_wood', 'acacia_wood'}
   end
   
   if node == 'dye:red' or node == 'dye:black'  then
      mod = "dye"
      items = {'red', 'blue', 'yellow', 'white', 'orange', 'violet', 'black'}
   end
   
   if node == 'wool:red' or node == 'wool:black' then
      mod = 'wool'
      items = {'red', 'blue', 'yellow', 'white', 'orange', 'violet', 'black'}
   end
   
   if node == 'vessels:glass_bottle' then
      mod = 'vessels'
      items = {'glass_bottle', 'steel_bottle', 'drinking_glass', 'glass_fragments'}
   end

   if node == 'beds:bed_bottom' then
      mod = 'beds'
      items = {'bed_bottom', 'fancy_bed_bottom'}
   end
   

   awards.register_onCraft(
      function(player, data)
	 local playern = player:get_player_name()
	 
	 if not sys4_achievements.has_achievement(playern, name) and
	 sys4_achievements.getItemCount("craft", mod, items, playern, data) > target - 1 then
	    return name
	 end
      end)
end
