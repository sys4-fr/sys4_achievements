local S = sys4_achievements.intllib

local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'dig' -- Type of achievement

local awardTmp

-- award_lumberjack
awardTmp = awards.def['award_lumberjack']
awardTmp.items = {'default:wood', 'default:junglewood', 'default:acacia_wood', 'default:pine_wood'}
awardTmp.otherTargets = {'default:tree', 'default:acacia_tree', 'default:pine_tree'}

--award_marchand_de_sable
awardTmp = awards.def['award_marchand_de_sable']
awardTmp.otherTargets = {'default:sand', 'default:desert_sand'}

-- dirt_digger
table.insert(a, mkach(t, "dirt_digger", "Dirt Digger", "default_tool_woodshovel.png", {'default:dirt', 'default:dirt_with_grass', 'default:dirt_with_dry_grass', 'default:dirt_with_snow', 'default:clay', 'default:desert_sand', 'default:sand', 'default:sandstone', 'default:snowblock', 'default:snow'}, 100, nil, {"default:shovel_wood", "default:clay", "default:clay_lump", "default:sand", "default:sandstone", "default:snowblock", "default:snow"}, nil, nil))

-- grass_digger
table.insert(a, mkach(t, "grass_digger", "Grass Digger", "farming_tool_woodhoe.png", {'default:grass_1','default:grass_2','default:grass_3','default:grass_4','default:grass_5','default:grass_6','default:grass_7','default:grass_8', 'default:dry_grass_1', 'default:dry_grass_2', 'default:dry_grass_3', 'default:dry_grass_4', 'default:dry_grass_5', 'default:dry_grass_6', 'default:dry_grass_7', 'default:dry_grass_8', 'default:junglegrass'}, 100, nil, {"farming:hoe_wood"}, nil, nil))

-- wheat_digger
table.insert(a, mkach(t, "wheat_digger", "Wheat Digger", "farming_flour.png", {'farming:wheat_1', 'farming:wheat_2', 'farming:wheat_3', 'farming:wheat_4', 'farming:wheat_5', 'farming:wheat_6', 'farming:wheat_7', 'farming:wheat_8', }, 100, nil, {"farming:flour"}, nil, "grass_digger"))

-- Cotton_digger
table.insert(a, mkach(t, "cotton_digger", "Cotton Digger", "wool_white.png", {'farming:cotton_1', 'farming:cotton_2', 'farming:cotton_3', 'farming:cotton_4', 'farming:cotton_5', 'farming:cotton_6', 'farming:cotton_7', 'farming:cotton_8', }, 100, nil, {"wool:white"}, nil, "grass_digger"))

-- flower_digger
table.insert(a, mkach(t, "flower_digger", "Flower Digger", "flowers_rose.png", {'flowers:rose', 'flowers:tulip', 'flowers:viola', 'flowers:geranium', 'flowers:dandelion_white', 'flowers:dandelion_yellow'}, 100, nil, {'dye:red', 'dye:yellow', 'dye:blue', 'dye:black', 'dye:white', 'dye:violet', 'dye:orange', 'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:green', 'dye:grey', 'dye:magenta', 'dye:pink'},nil, nil))

-- papyrus_digger
table.insert(a, mkach(t, "papyrus_digger", "Papyrus Digger", "default_paper.png", "default:papyrus", 100, nil, {"default:paper"}, nil, nil))

-- award_mine2
awardTmp = awards.def['award_mine2']
awardTmp.items = {'default:furnace', 'default:sword_stone', 'default:axe_stone', 'default:shovel_stone', 'farming:hoe_stone'}
awardTmp.otherTargets = {'default:stone', 'default:desert_stone', 'default:cobble', 'default:desert_cobble', 'default:mossycobble'}
awardTmp.award_req = "tools_crafter"

-- Coal Digger
table.insert(a, mkach(t, "coal_digger", "Coal Digger", "default_coal_lump.png", "default:stone_with_coal", 100, nil, {"default:torch", "default:coal_lump", "default:coalblock", "tnt:gunpowder", "tnt:tnt"}, nil, "tools_crafter"))

if minetest.get_modpath("3d_armor") then
   local items = {'3d_armor:boots_cactus', '3d_armor:chestplate_cactus', '3d_armor:helmet_cactus', '3d_armor:leggings_cactus'}

   if minetest.get_modpath("shields") then
      table.insert(items, 'shields:shield_cactus')
   end

   -- cactus_digger
   table.insert(a, mkach(t, "cactus_digger", "Cactus Digger", "3d_armor_inv_chestplate_cactus.png", "default:cactus", 50, nil, items, nil, "wood_crafter"))

end
