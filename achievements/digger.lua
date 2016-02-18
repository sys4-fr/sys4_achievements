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
table.insert(a, mkach(t, "dirt_digger", "Dirt Digger", "default_shovel_wood.png", {'default:dirt', 'default:dirt_with_grass', 'default:dirt_with_dry_grass', 'default:dirt_with_snow', 'default:clay', 'default:desert_sand', 'default:sand', 'default:snowblock', 'default:snow'}, 99, nil, {"default:shovel_wood", "default:clay", "default:clay_lump", "default:sand", "default:sandstone"}, nil, nil))

-- grass_digger
table.insert(a, mkach(t, "grass_digger", "Grass Digger", "farming_hoe_wood.png", {'default:grass_1','default:grass_2','default:grass_3','default:grass_4','default:grass_5','default:grass_6','default:grass_7','default:grass_8', 'default:dry_grass_1', 'default:dry_grass_2', 'default:dry_grass_3', 'default:dry_grass_4', 'default:dry_grass_5', 'default:dry_grass_6', 'default:dry_grass_7', 'default:dry_grass_8', 'default:junglegrass'}, 99, nil, {"farming:hoe_wood"}, nil, nil))

-- wheat_digger
table.insert(a, mkach(t, "wheat_digger", "Wheat Digger", "farming_wheat.png", "default:wheat_8", 99, nil, {"farming:flour"}, nil, "grass_digger"))

-- Cotton_digger
table.insert(a, mkach(t, "cotton_digger", "Cotton Digger", "farming_cotton.png", "default:cotton_8", 99, nil, {"wool:white"}, nil, "grass_digger"))

-- flower_digger
table.insert(a, mkach(t, "flower_digger", "Flower Digger", "flowers_rose.png", {'flowers:rose', 'flowers:tulip', 'flowers:viola', 'flowers:geranium', 'flowers:dandelion_white', 'flowers:dandelion_yellow'}, 99, nil, {'dye:red', 'dye:yellow', 'dye:blue', 'dye:black', 'dye:white', 'dye:violet', 'dye:orange', 'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:green', 'dye:grey', 'dye:magenta', 'dye:pink'},nil, nil))

-- papyrus_digger
table.insert(a, mkach(t, "papyrus_digger", "Papyrus Digger", "default_paper.png", "default:papyrus", 99, nil, {"default:paper"}, nil, nil))

-- award_mine2
awardTmp = awards.def['award_mine2']
awardTmp.items = {'default:furnace', 'default:sword_stone', 'default:axe_stone', 'default:shovel_stone', 'farming:hoe_stone'}
awardTmp.otherTargets = {'default:stone', 'default:desert_stone', 'default:cobble', 'default:desert_cobble', 'default:mossycobble'}
awardTmp.award_req = "tool_crafter"

-- Coal Digger
table.insert(a, mkach(t, "coal_digger", "Coal Digger", "default_coal.png", "default:stone_with_coal", 99, nil, {"default:torch", "default:coalblock", "tnt:gunpowder", "tnt:tnt"}, nil, "tool_crafter"))
