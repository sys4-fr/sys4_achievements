local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'craft' -- Type of achievement

-- Require 'sand_digger' --

-- sand_crafter
table.insert(a, mkach(t, "sand_crafter", "The sand castle part. 2", "default_sandstone_brick.png", "default:sandstone", 100, nil, {'default:sandstone_brick'}, nil, "sand_digger"))

-- Requiere 'papyrus_digger' --

-- book_crafter
table.insert(a, mkach(t, "book_crafter", "You know write ?", "default_book.png", "default:paper", 3, nil, {'default:book', 'default:bookshelf'}, nil, "papyrus_digger"))

-- Requieres 'book_crafter' --

-- bookshelf_crafter
table.insert(a, mkach(t, "bookshelf_crafter", "Get the knowledge", "default_bookshelf.png", "default:bookshelf", 1, nil, nil, nil, "book_crafter"))

-- Requieres 'tree_digger' --

-- planks_crafter
table.insert(a, mkach(t, "planks_crafter", "Make planks", "default_wood.png", "default:wood", 8, nil, {'default:stick', 'default:chest', 'doors:door_wood', 'doors:trapdoor', 'boats:boat'}, "Make planks from wood", "tree_digger"))

-- Requieres 'planks_crafter" --

-- sticks_crafter
table.insert(a, mkach(t, "sticks_crafter", "Make sticks", "default_stick.png", "default:stick", 8, nil, {'default:sword_wood', 'default:axe_wood', 'default:shovel_wood', 'farming:hoe_wood', 'default:ladder', 'default:fence_wood'}, "Make sticks from planks", "planks_crafter"))

-- Requieres 'sticks_crafter' --

-- axe_crafter
table.insert(a, mkach(t, "axe_crafter", "Make a wooden axe", "default_tool_woodaxe.png", "default:axe_wood", 1, nil, nil, "Make a wooden axe from sticks and planks", "sticks_crafter"))

-- sword_crafter
table.insert(a, mkach(t, "sword_crafter", "Make a wooden sword", "default_tool_woodsword.png", "default:sword_wood", 1, nil, nil, "Make a wooden sword from sticks and planks", "sticks_crafter"))

-- shovel_crafter
table.insert(a, mkach(t, "shovel_crafter", "Make a wooden shovel", "default_tool_woodshovel.png", "default:shovel_wood", 1, nil, nil, "Make a wooden shovel from sticks and planks", "sticks_crafter"))

-- hoe_crafter
table.insert(a, mkach(t, "hoe_crafter", "Make a wooden hoe", "farming_tool_woodhoe.png", "farming:hoe_wood", 1, nil, nil, "Make a wooden hoe from sticks and planks", "sticks_crafter"))

-- Requieres 'award_lumberjack' --

-- pick_crafter
table.insert(a, mkach(t, "pick_crafter", "Make a wooden pickaxe", "default_tool_woodpick.png", "default:pick_wood", 1, nil, nil, "Make a wooden pick from sticks and planks", "award_lumberjack"))

-- Requieres 'coal_digger' --

-- dye_crafter
table.insert(a, mkach(t, "dye_crafter", "A colorful World", "dye_red.png", "dye:black", 100, nil, {'dye:red', 'dye:blue', 'dye:yellow', 'dye:white', 'dye:orange', 'dye:violet', 'dye:green'}, "Discover how to make others colored dyes", "coal_digger"))

-- dye_crafter_lover
table.insert(a, mkach(t, "dye_crafter_lover", "Picasso", "dye_brown.png", "dye:black", 200, nil, {'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:grey', 'dye:magenta', 'dye:pink'}, nil, "coal_digger"))

-- wool_crafter
table.insert(a, mkach(t, "wool_crafter", "Colored Wools", "wool_red.png", "wool:black", 100, nil, {'wool:red', 'beds:bed_bottom', 'beds:fancy_bed_bottom', 'wool:blue', 'wool:yellow', 'wool:orange', 'wool:violet', 'wool:green'}, "Discover how to make colored wools", "coal_digger"))

-- wool_crafter_lover
table.insert(a, mkach(t, "wool_crafter_lover", "The Rainbow Wools", "wool_brown.png", "wool:red", 200, nil, {'wool:brown','wool:cyan', 'wool:dark_green', 'wool:dark_grey', 'wool:grey', 'wool:magenta', 'wool:pink'}, nil, "coal_digger"))

-- Requieres 'wool_crafter' --

-- bed_crafter
table.insert(a, mkach(t, "bed_crafter", "Going to sleep", "beds_bed.png", "beds:bed_bottom", 1, nil, nil, "Make a bed from planks and wools", "wool_crafter"))

-- Requires 'award_mine2' --

-- pick_crafter_lover
table.insert(a, mkach(t, "pick_crafter_lover", "Better Pick!", "default_tool_stonepick.png", "default:pick_stone", 1, nil, nil, "Make a better quality Pick from sticks and stones", "award_mine2"))

-- Requires 'copper_digger' --

-- bronze_crafter
table.insert(a, mkach(t, "bronze_crafter", "The Bronze Age", "default_bronze_ingot.png", "default:bronze_ingot", 1, nil, {'default:sword_bronze', 'default:axe_bronze', 'default:shovel_bronze', 'farming:hoe_bronze'}, nil, "copper_digger"))

-- bronze_crafter_lover
table.insert(a, mkach(t, "bronze_crafter_lover", "The Bronze Peak", "default_bronze_ingot.png", "default:bronze_ingot", 100, nil, {'default:pick_bronze', 'default:bronze_block'}, nil, "copper_digger"))


-- sys4_2 --
a = sys4_achievements.achievements['sys4_2']

-- wood_crafter
table.insert(a, mkach(t, "wood_crafter", "Wood Crafter", "default_wood_sword.png", "default:wood", 99, nil, {"default:stick", "default:sword_wood", "default:axe_wood"}, nil, "award_lumberjack"))

-- tools_crafter (End of Darkness)
table.insert(a, mkach(t, "tools_crafter", "Tools Crafter", "default_wood_pick.png", "default:sword_wood", 20, nil, {"default:pick_wood"}, nil, "wood_crafter"))

-- flour_crafter
table.insert(a, mkach(t, "flour_crafter", "Flour Crafter", "farming_flour.png", "farming:flour", 99, nil, {"farming:straw", "farming:wheat"}, nil, "wheat_digger"))

-- sandstone_crafter
table.insert(a, mkach(t, "sandstone_crafter", "Sandstone Crafter", "default_sandstone_brick.png", "default:sandstone", 99, nil, {"default:sandstonebrick"},nil, "dirt_digger"))

-- book_crafter
table.insert(a, mkach(t, "book_crafter", "Book Crafter", "default_book.png", "default:paper", 99, nil, {"default:book"},nil, "papyrus_digger"))

-- bookshelf_crafter
table.insert(a, mkach(t, "bookshelf_crafter", "BookShelf Crafter", "default_bookshelf.png", "default:book", 99, nil, {"default:bookshelf"}, nil, "book_crafter"))

-- tools_crafter_lover
table.insert(a, mkach(t, "tools_crafter_lover", "Tools Crafter Lover", "default_stone_pick.png", "default:sword_stone", 20, nil, {"default:pick_stone"}, nil, "award_mine2"))
