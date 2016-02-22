local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'place' -- Type of achievement

-- award_on_the_way
local awardTmp = awards.def['award_on_the_way']
awardTmp.award_req = "iron_digger_lover"

-- award_lightitup
awardTmp = awards.def['award_lightitup']
awardTmp.award_req = "coal_digger"

-- award_light_all_the_things
awardTmp = awards.def['award_light_all_the_things']
awardTmp.award_req = "coal_digger"

-- wood_builder
table.insert(a, mkach(t, "wood_builder", "Wood Builder", "default_wood.png", {'default:wood', 'default:junglewood', 'default:acacia_wood', 'default:pine_wood'}, 100, nil, {"doors:door_wood", "doors:trapdoor", "default:chest", "boats:boat", "stairs:slab_wood", "stairs:slab_junglewood", "stairs:slab_acacia_wood", "stairs:slab_pine_wood"}, nil, "award_lumberjack"))

-- wood_builder_lover
table.insert(a, mkach(t, "wood_builder_lover", "Wood Builder Lover", "default_wood.png", {'stairs:slab_wood', 'stairs:slab_junglewood', 'stairs:slab_acacia_wood', 'stairs:slab_pine_wood'}, 100, nil, {"stairs:stair_wood", "stairs:stair_junglewood", "stairs:stair_acacia_wood", "stairs:stair_pine_wood"}, nil, "wood_builder"))

-- sandstone_builder
table.insert(a, mkach(t, "sandstone_builder", "Sandstone Builder", "default_sandstone.png", "default:sandstone", 100, nil, {"stairs:slab_sandstone"}, nil, "dirt_digger"))

-- sandstone_builder_lover
table.insert(a, mkach(t, "sandstone_builder_lover", "Sandstone Builder Lover", "default_sandstone.png", "stairs:slab_sandstone", 100, nil, {"stairs:stair_sandstone"}, nil, "sandstone_builder"))

-- sandstonebrick_builder
table.insert(a, mkach(t, "sandstonebrick_builder", "SandstoneBrick Builder", "default_sandstone_brick.png", "default:sandstonebrick", 100, nil, {"stairs:slab_sandstonebrick"}, nil, "sandstone_crafter"))

-- sandstonebrick_builder_lover
table.insert(a, mkach(t, "sandstonebrick_builder_lover", "SandstoneBrick Builder Lover", "default_sandstone_brick.png", "stairs:slab_sandstonebrick", 100, nil, {"stairs:stair_sandstonebrick"}, nil, "sandstonebrick_builder"))

-- straw_builder
table.insert(a, mkach(t, "straw_builder", "Straw Builder", "farming_straw.png", "farming:straw", 100, nil, {"stairs:slab_straw"}, nil, "flour_crafter"))

-- straw_builder_lover
table.insert(a, mkach(t, "straw_builder_lover", "Straw Builder Lover", "farming_straw.png", "stairs:slab_straw", 100, nil, {"stairs:stair_straw"}, nil, "straw_builder"))

-- wool_builder
table.insert(a, mkach(t, "wool_builder", "Wool Builder", "wool_red.png", "wool:white", 100, nil, {'beds:bed_bottom', 'beds:fancy_bed_bottom', 'wool:black', 'wool:red', 'wool:green', 'wool:blue', 'wool:orange', 'wool:violet', 'wool:yellow', 'wool:brown','wool:cyan', 'wool:dark_green', 'wool:dark_grey', 'wool:green', 'wool:grey', 'wool:magenta', 'wool:pink'}, nil, "cotton_digger"))

-- furnace_builder
table.insert(a, mkach(t, "furnace_builder", "Furnace Builder", "default_furnace_front.png", "default:furnace", 1, nil, {'default:stonebrick', 'default:desert_stonebrick', 'default:brick', 'default:clay_brick'}, nil, "award_mine2"))
		      
-- glass_builder
table.insert(a, mkach(t, "glass_builder", "Glass Builder", "default_glass.png", "default:glass", 100, nil, {"xpanes:pane", "doors:door_glass", "vessels:drinking_glass", "vessels:glass_bottle", "vessels:glass_fragments"}, nil, "furnace_builder"))

-- stone_builder
table.insert(a, mkach(t, "stone_builder", "Stone Builder", "default_stone.png", {'default:stone', 'default:desert_stone'}, 100, nil, {"stairs:slab_stone", "stairs:slab_desert_stone"}, nil, "furnace_builder"))

-- stone_builder_lover
table.insert(a, mkach(t, "stone_builder_lover", "Stone Builder Lover", "default_stone.png", {'stairs:slab_stone', 'stairs:slab_desert_stone'}, 100, nil, {"stairs:stair_stone", "stairs:stair_desert_stone"}, nil, "stone_builder"))

-- brick_builder
table.insert(a, mkach(t, "brick_builder", "Brick Builder", "default_brick.png", "default:brick", 100, nil, {"stairs:slab_brick"}, nil, "furnace_builder"))

-- brick_builder_lover
table.insert(a, mkach(t, "brick_builder_lover", "Brick Builder Lover", "default_brick.png", "stairs:slab_brick", 100, nil, {"stairs:stair_brick"}, nil, "brick_builder"))

-- stonebrick_builder
table.insert(a, mkach(t, "stonebrick_builder", "Stone Brick Builder", "default_stone_brick.png", {'default:stonebrick', 'default:desert_stonebrick'}, 100, nil, {"stairs:slab_stonebrick", "stairs:slab_desert_stonebrick"}, nil, "furnace_builder"))

-- stonebrick_builder_lover
table.insert(a, mkach(t, "stonebrick_builder_lover", "Stone Brick Builder Lover", "default_stone_brick.png", {"stairs:slab_stonebrick", "stairs:slab_desert_stonebrick"}, 100, nil, {"stairs:stair_stonebrick", "stairs:stair_desert_stonebrick"}, nil, "stonebrick_builder"))

-- cobble_builder
table.insert(a, mkach(t, "cobble_builder", "Cobble Builder", "default_cobble.png", {'default:cobble', 'default:desert_cobble'}, 100, nil, {"stairs:slab_cobble", "stairs:slab_desert_cobble"}, nil, "tools_crafter"))

-- cobble_builder_lover
table.insert(a, mkach(t, "cobble_builder_lover", "Cobble Builder Lover", "default_cobble.png", {'stairs:slab_cobble', 'stairs:slab_desert_cobble'}, 100, nil, {"stairs:stair_cobble", "stairs:stair_desert_cobble"}, nil, "cobble_builder"))

-- steelblock_builder
table.insert(a, mkach(t, "steelblock_builder", "Steel Block Builder", "default_steel_block.png", "default:steelblock", 50, nil, {'stairs:slab_steelblock'}, nil, "iron_digger_lover"))

-- steelblock_builder_lover
table.insert(a, mkach(t, "steelblock_builder_lover", "Steel Block Builder Lover", "default_steel_block.png", "stairs:slab_steelblock", 50, nil, {'stairs:stair_steelblock'}, nil, "steelblock_builder"))

-- copperblock_builder
table.insert(a, mkach(t, "copperblock_builder", "Copper Block Builder", "default_copper_block.png", "default:copperblock", 50, nil, {'stairs:slab_copperblock'}, nil, "copper_digger"))

-- copperblock_builder_lover
table.insert(a, mkach(t, "copperblock_builder_lover", "Copper Block Builder Lover", "default_copper_block.png", "stairs:slab_copperblock", 50, nil, {'stairs:stair_copperblock'}, nil, "copperblock_builder"))

-- bronzeblock_builder
table.insert(a, mkach(t, "bronzeblock_builder", "Bronze Block Builder", "default_bronze_block.png", "default:bronzeblock", 50, nil, {'stairs:slab_bronzeblock'}, nil, "bronze_crafter"))

-- bronzeblock_builder_lover
table.insert(a, mkach(t, "bronzeblock_builder_lover", "Bronze Block Builder Lover", "default_bronze_block.png", "stairs:slab_bronzeblock", 50, nil, {'stairs:stair_bronzeblock'}, nil, "bronzeblock_builder"))

-- goldblock_builder
table.insert(a, mkach(t, "goldblock_builder", "Gold Block Builder", "default_gold_block.png", "default:goldblock", 50, nil, {'stairs:slab_goldblock'}, nil, "gold_digger"))

-- goldblock_builder_lover
table.insert(a, mkach(t, "goldblock_builder_lover", "Gold Block Builder Lover", "default_gold_block.png", "stairs:slab_goldblock", 50, nil, {'stairs:stair_goldblock'}, nil, "goldblock_builder"))

-- obsidian_builder
table.insert(a, mkach(t, "obsidian_builder", "Obsidian Builder", "default_obsidian.png", "default:obsidian", 50, nil, {'stairs:slab_obsidian', 'default:obsidianbrick'}, nil, "tools_crafter_pro"))

-- obsidian_builder_lover
table.insert(a, mkach(t, "obsidian_builder_lover", "Obsidian Builder Lover", "default_obsidian.png", "stairs:slab_obsidian", 50, nil, {'stairs:stair_obsidian'}, nil, "obsidian_builder"))

-- obsidianbrick_builder
table.insert(a, mkach(t, "obsidianbrick_builder", "Obsidian Brick Builder", "default_obsidian_brick.png", "default:obsidianbrick", 50, nil, {'stairs:slab_obsidianbrick'}, nil, "tools_crafter_pro"))

-- obsidianbrick_builder_lover
table.insert(a, mkach(t, "obsidianbrick_builder_lover", "Obsidian Brick Builder Lover", "default_obsidian_brick.png", "stairs:slab_obsidianbrick", 50, nil, {'stairs:stair_obsidianbrick'}, nil, "obsidianbrick_builder"))
