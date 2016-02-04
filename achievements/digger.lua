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
