local S = sys4_achievements.intllib

local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'dig' -- Type of achievement

local awardTmp, titems

-- Requires Nothing ! --

-- papyrus_digger
table.insert(a, mkach(t, "papyrus_digger", "Your papers please", "default_paper.png", "default:papyrus", 3, nil, {'default:paper'}, nil, nil))

-- tree_digger
table.insert(a, mkach(t, "tree_digger", "Finding wood", "default_tree.png", "default:tree", 1, nil, {'default:wood', 'default:junglewood', 'default:pine_wood', 'default:acacia_wood'}, "Attack a tree and obtain wood. It's an essential raw material", nil))

-- award_lumberjack
awardTmp = awards.def['award_lumberjack']
titems = {'default:pick_wood'}
awardTmp.items = titems
awardTmp.book = {title = "SYS4 AWARDS : "..awardTmp.title,
		 text = sys4_achievements.write_book( S("Discover how to make a wooden pickaxe."), titems, awardTmp.prizes)
}

-- sand_digger
table.insert(a, mkach(t, "sand_digger", "The sand castle part. 1", "default_sandstone.png", "default:sand", 100, nil, {'default:sandstone', 'default:sand', 'default:sandstonebrick'}, nil, nil))

-- Requires 'hoe_crafter' --

-- wheat_digger
table.insert(a, mkach(t, "wheat_digger", "Hands in the Flour", "farming_flour.png", "farming:wheat_8", 8, nil, {'farming:flour', 'farming_straw', 'farming_wheat'}, nil, "hoe_crafter"))

-- cotton_digger
table.insert(a, mkach(t, "cotton_digger", "Spinner's first steps", "wool_white.png", "farming:cotton_8", 8, nil, {'wool:white'}, nil, "hoe_crafter"))

-- Require 'pick_crafter' --

-- award_mine2
awardTmp = awards.def['award_mine2']
titems = {'default:pick_stone'}
awardTmp.award_req = "pick_crafter"
awardTmp.items = titems
awardTmp.book = {title = "SYS4 AWARDS : "..awardTmp.title,
		 text = sys4_achievements.write_book( S("Discover how to make a stone pickaxe."), titems, awardTmp.prizes)
}

-- award_youre_winner'
awards.def['award_youre_winner'].award_req = 'pick_crafter'
      
-- stone_digger
table.insert(a, mkach(t, "stone_digger", "Finding stone", "default_stone.png", "default:stone", 1, nil, {'default:furnace', 'default:axe_stone', 'default:sword_stone', 'default:shovel_stone', 'farming:hoe_stone'}, "Find stone and make your first stone tools", "pick_crafter"))

-- coal_digger
table.insert(a, mkach(t, "coal_digger", "Finding coal", "default_coal_lump.png", "default:stone_with_coal", 1, nil, {'default:torch', 'dye:black', 'wool:black', 'default:coalblock', 'default:coal'}, "Find coal and discover his usages", "pick_crafter"))

-- Require 'pick_crafter_lover' --

-- iron_digger
table.insert(a, mkach(t, "iron_digger", "The Iron Age", "default_steel_ingot.png", "default:stone_with_iron", 10, nil, {'bucket:bucket_empty', 'xpanes:bar', 'doors:door_steel', 'vessels:steel_bottle', 'screwdriver:screwdriver', 'default:sword_steel', 'default:axe_steel', 'default:shovel_steel', 'farming:hoe_steel'}, nil, "pick_crafter_lover"))

-- copper_digger
table.insert(a, mkach(t, "copper_digger", "The Copper Age", "default_copper_ingot.png", "default:stone_with_copper", 100, nil, {'default:copperblock', 'default:copper_ingot', 'default:bronze_ingot'}, nil, "pick_crafter_lover"))

-- Require 'pick_crafter_pro' --

-- award_mesefind
awardTmp = awards.def['award_mesefind']
awardTmp.award_req = "pick_crafter_pro"
titems = {'default:mese', 'default:mese_crystal', 'default:mese_crystal_fragment'}
awardTmp.items = titems

-- mese_digger
table.insert(a, mkach(t, "mese_digger", "Mese digger", "default_mese_block.png", "default:stone_with_mese", 100, nil, {'default:pick_mese', 'default:axe_mese', 'default:sword_mese', 'default:shovel_mese', 'farming:hoe_mese'}, nil, "pick_crafter_pro"))

-- diamond_digger
table.insert(a, mkach(t, "diamond_digger", "Bling Bling!", "default_diamond.png", "default:stone_with_diamond", 1, nil, {'default:diamond', 'default:diamondblock'}, "Dig diamonds whith help of a metal pick", "pick_crafter_pro"))

-- diamond_digger_lover
table.insert(a, mkach(t, "diamond_digger_lover", "Diamond digger", "default_diamond.png", "default:stone_with_diamond", 100, nil, {'default:pick_diamond', 'default:axe_diamond', 'default:sword_diamond', 'default:shovel_diamond', 'farming:hoe_diamond'}, nil, "pick_crafter_pro"))

-- Sys4_2 --

a = sys4_achievements.achievements['sys4_2']

-- award_lumberjack
awardTmp = awards.def['award_lumberjack']
titems = {'default:wood', 'default:junglewood', 'default:acacia_wood', 'default:pine_wood'}
awardTmp.items = titems

-- dirt_digger
table.insert(a, mkach(t, "dirt_digger", "Dirt Digger", "default_shovel_wood.png", "default:dirt", 99, nil, {"default:shovel_wood", "default:clay", "default:clay_lump", "default:sand", "default:sandstone"}, nil, nil))

-- grass_digger
table.insert(a, mkach(t, "grass_digger", "Grass Digger", "farming_hoe_wood.png", "default:grass_8", 99, nil, {"farming:hoe_wood"}, nil, nil))

-- wheat_digger
table.insert(a, mkach(t, "wheat_digger", "Wheat Digger", "farming_wheat.png", "default:wheat_8", 99, nil, {"farming:flour"}, nil, "grass_digger"))

-- Cotton_digger
table.insert(a, mkach(t, "cotton_digger", "Cotton Digger", "farming_cotton.png", "default:cotton_8", 99, nil, {"wool:white"}, nil, "grass_digger"))

-- flower_digger
table.insert(a, mkach(t, "flower_digger", "Flower Digger", "flowers_rose.png", "flowers:rose", 99, nil, {'dye:red', 'dye:yellow', 'dye:blue', 'dye:black', 'dye:white', 'dye:violet', 'dye:orange', 'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:green', 'dye:grey', 'dye:magenta', 'dye:pink'},nil, nil))

-- papyrus_digger
table.insert(a, mkach(t, "papyrus_digger", "Papyrus Digger", "default_paper.png", "default:papyrus", 99, nil, {"default:paper"}, nil, nil))

-- award_mine2
awardTmp = awards.def['award_mine2']
titems = {'default:furnace', 'default:sword_stone', 'default:axe_stone', 'default:shovel_stone', 'farming:hoe_stone'}
awardTmp.award_req = "???"
awardTmp.items = titems

-- Coal Digger
table.insert(a, mkach(t, "coal_digger", "Coal Digger", "default_coal.png", "default:stone_with_coal", 99, nil, {"default:torch", "default:coalblock", "tnt:gunpowder", "tnt:tnt"}, nil, "???"))
