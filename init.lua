-- SYS4 Achievements
-- by Sys4

sys4_achievements = {}

-- Init
local S
if minetest.get_modpath("intllib") then
  S = intllib.Getter()
else
  S = function(s) return s end
end
sys4_achievements.intllib = S

if not awards then
   return
end

dofile(minetest.get_modpath("sys4_achievements").."/api.lua")

-- Achievements table définition
local a = {
   
   -- Builder achievements (place) --
   
   -- Trees
   { name = 'tree_builder_begins',
     title = S("My first hut"),
     node = 'default:tree',
     desc = S("Place 50 tree blocks."),
     icon = "default_wood.png",
     type = "place",
     target = 50,
     titems = {'default:wood', 'default:acacia_wood', 'default:junglewood', 'default:pine_wood'},
     tprizes = {'default:torch'},
   },

   -- Wood
   { name = 'wood_builder_begins',
     title = S("Specialized Wood builder"),
     node = 'default:wood',
     desc = S("Place 50 wooden planks."),
     icon = "default_wood.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_wood', 'stairs:stair_wood',
               'stairs:slab_acacia_wood', 'stairs:stair_acacia_wood',
               'stairs:slab_pine_wood', 'stairs:stair_pine_wood',
               'stairs:slab_junglewood', 'stairs:stair_junglewood'},
     tprizes = nil,
   },

   -- Papyrus
   { name = 'papyrus_builder_begins',
     title = S("Your papers please"),
     node = 'default:papyrus',
     desc = S("Place 10 papyrus."),
     icon = "default_paper.png",
     type = "place",
     target = 10,
     titems = {'default:paper'},
     tprizes = nil,
   },

   -- Bookshelf
   { name = 'bookshelf_builder_begins',
     title = S("Get the knowledge"),
     node = 'default:bookshelf',
     desc = S("Place 5 bookshelfs."),
     icon = "farming_tool_woodhoe.png",
     type = "place",
     target = 5,
     titems = {'farming:hoe_wood'},
     tprizes = nil,
   },

   -- Sandstone
   { name = 'sandstone_builder_begins',
     title = S("Sandstone builder lover"),
     node = 'default:sandstone',
     desc = S("Place 50 sandstones."),
     icon = "default_sandstone.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_sandstone', 'stairs:stair_sandstone'},
     tprizes = nil,
   },

   -- Sandstone bricks
   { name = 'sandstonebrick_builder_begins',
     title = S("Specialized sandstone builder"),
     node = 'default:sandstonebrick',
     desc = S("Place 50 sandstone bricks."),
     icon = "default_sandstone_brick.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_sandstonebrick', 'stairs:stair_sandstonebrick'},
     tprizes = nil,
   },

   -- Place 10 Straws : unlock stairs and slab straws
   { name = 'straw_builder_begins',
     title = S("The Straw House"),
     node = 'farming:straw',
     desc = S("Place 10 Straws."),
     icon = "farming_straw.png",
     type = "place",
     target = 10,
     titems = {'stairs:slab_straw', 'stairs:stair_straw'},
     tprizes = nil,
   },

   -- Place 50 Cobblestones : Unlock stairs and slab cobblestones.
   { name = 'stone_builder_begins',
     title = S("Stone builder First Steps"),
     node = 'default:cobble',
     desc = S("Place 50 Cobblestones."),
     icon = "default_cobble.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_cobble', 'stairs:stair_cobble', 'stairs:slab_desert_cobble', 'stairs:stair_desert_cobble'},
     tprizes = nil,
   },

   -- Place 50 stones : Unlock stairs and slab stones.
   { name = 'stone_builder_lover',
     title = S("Stone builder Lover"),
     node = 'default:stone',
     desc = S("Place 50 Stones."),
     icon = "default_stone.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_stone', 'stairs:stair_stone', 'stairs:slab_desert_stone', 'stairs:stair_desert_stone'},
     tprizes = nil,
   },

   -- Place 10 glasses : Unlock glass pane
   { name = 'glass_builder_begins',
     title = S("Glazier"),
     node = 'default:glass',
     desc = S("Place 10 Glasses."),
     icon = "default_glass.png",
     type = "place",
     target = 10,
     titems = {'xpanes:pane'},
     tprizes = nil,
   },

   -- Place 50 gravel : unlock gunpowder, tnt
   { name = 'gravel_builder_begins',
     title = S("Boom !"),
     node = 'default:gravel',
     desc = S("Place 50 Gravel blocks."),
     icon = "tnt_side.png",
     type = "place",
     target = 10,
     titems = {'tnt:gunpowder', 'tnt:tnt'},
     tprizes = nil,
   },

   -- Place 50 Clay : unlock bricks, clay brick
   { name = 'clay_builder_begins',
     title = S("Bricklayer First Steps"),
     node = 'default:clay',
     desc = S("Place 50 Clay blocks."),
     icon = "default_brick.png",
     type = "place",
     target = 50,
     titems = {'default:brick', 'default:clay_brick'},
     tprizes = nil,
   },

   -- Place 50 stonebricks : Unlock stairs and slab stonebricks.
   { name = 'stonebrick_builder_begins',
     title = S("Stonemason First Steps"),
     node = 'default:stonebrick',
     desc = S("Place 50 Stone Bricks."),
     icon = "default_stone_brick.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_stonebrick', 'stairs:stair_stonebrick', 'stairs:slab_desert_stonebrick', 'stairs:stair_desert_stonebrick'},
     tprizes = nil,
   },

   -- Place 50 bricks : unlock stairs and slab bricks
   { name = 'brick_builder_begins',
     title = S("Bricklayer Lover"),
     node = 'default:brick',
     desc = S("Place 50 Bricks."),
     icon = "default_brick.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_brick', 'stairs:stair_brick'},
     tprizes = nil,
   },

   -- Place 50 steel block : unlock stairs and slab steel block.
   { name = 'steel_builder_begins',
     title = S("Steel Builder"),
     node = 'default:steelblock',
     desc = S("Place 50 Steel Blocks."),
     icon = "default_steel_block.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_steelblock', 'stairs:stair_steelblock'},
     tprizes = nil,
   },

   -- Place 50 copper blocks : unlock stairs and slab copper blocks.
   { name = 'copper_builder_begins',
     title = S("Copper Builder"),
     node = 'default:copperblock',
     desc = S("Place 50 Copper Blocks."),
     icon = "default_copper_block.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_copperblock', 'stairs:stair_copperblock'},
     tprizes = nil,
   },

   -- Place 50 Bronze block : unlock stairs and slab bronze blocks.
   { name = 'bronze_builder_begins',
     title = S("Bronze Builder"),
     node = 'default:bronzeblock',
     desc = S("Place 50 Bronze Blocks."),
     icon = "default_bronze_block.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_bronzeblock', 'stairs:stair_bronzeblock'},
     tprizes = nil,
   },

   -- Place 100 torches : unlock mese lamp.
   { name = 'torch_placer',
     title = S("I'm Illuminated"),
     node = 'default:torch',
     desc = S("Place 100 Torches."),
     icon = "default_meselamp.png",
     type = "place",
     target = 100,
     titems = {'default:meselamp'},
     tprizes = nil,
   },

   -- Place 50 gold blocks : unlock stairs and slab gold blocks.
   { name = 'gold_builder',
     title = S("Gold Builder"),
     node = 'default:goldblock',
     desc = S("Place 50 Gold Blocks."),
     icon = "default_gold_block.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_goldblock', 'stairs:stair_goldblock'},
     tprizes = nil,
   },

   -- Place 50 obs. block : unlock obsidian bricks, stairs and slab obs. blocks.
   { name = 'obsidian_builder_begins',
     title = S("Obsidian Builder First Steps"),
     node = 'default:obsidian',
     desc = S("Place 50 Obsidian Blocks."),
     icon = "default_obsidian_brick.png",
     type = "place",
     target = 50,
     titems = {'default:obsidianbrick', 'stairs:slab_obsidian', 'stairs:stair_obsidian'},
     tprizes = nil,
   },

   -- Place 50 obs. bricks : unlock stairs and slab obs. bricks.
   { name = 'obsidian_builder_lover',
     title = S("Obsidian Builder Lover"),
     node = 'default:obsidianbrick',
     desc = S("Place 50 Obsidian Bricks."),
     icon = "default_obsidian_brick.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_obsidianbrick', 'stairs:stair_obsidianbrick'},
     tprizes = nil,
   },

   -- Miner achievements (dig) --

   -- Leaves
   { name = 'leave_digger_begins',
     title = S("Sticks into the trees"),
     node = 'default:leaves',
     desc = S("Dig 50 leaves."),
     icon = "default_stick.png",
     type = "dig",
     target = 50,
     titems = {'default:stick'},
     tprizes = nil,
   },

   -- Trees
   { name = 'tree_digger_begins',
     title = S("First steps of a Lumberjack"),
     node = 'default:tree',
     desc = S("Dig 50 trees."),
     icon = "default_tool_woodaxe.png",
     type = "dig",
     target = 50,
     titems = {'default:axe_wood', 'default:sword_wood'},
     tprizes = nil,
   },

   -- Papyrus
   { name = 'papyrus_digger_begins',
     title = S("You know write ?"),
     node = 'default:papyrus',
     desc = S("Dig 50 papyrus."),
     icon = "default_book.png",
     type = "dig",
     target = 50,
     titems = {'default:book', 'default:sign_wall'},
     tprizes = nil,
   },

   -- Cotton
   { name = 'cotton_digger_begins',
     title = S("Spinner's first steps"),
     node = 'farming:cotton_8',
     desc = S("Dig 50 mature cottons."),
     icon = "wool_white.png",
     type = "dig",
     target = 50,
     titems = {'wool:white'},
     tprizes = nil,
   },

   -- Rose flower
   { name = 'rose_digger_begins',
     title = S("I like the Red color"),
     node = 'flowers:rose',
     desc = S("Dig 10 Roses."),
     icon = "dye_red.png",
     type = "dig",
     target = 10,
     titems = {'dye:red', 'wool:red'},
     tprizes = nil,
   },

   -- Geranium flower
   { name = 'geranium_digger_begins',
     title = S("I like the Blue color"),
     node = 'flowers:geranium',
     desc = S("Dig 10 Geraniums."),
     icon = "dye_blue.png",
     type = "dig",
     target = 10,
     titems = {'dye:blue', 'wool:blue'},
     tprizes = nil,
   },

   -- Yellow Dandelion
   { name = 'dandelionYellow_digger_begins',
     title = S("I like the Yellow color"),
     node = 'flowers:dandelion_yellow',
     desc = S("Dig 10 Yellow Dandelions."),
     icon = "dye_yellow.png",
     type = "dig",
     target = 10,
     titems = {'dye:yellow', 'wool:yellow'},
     tprizes = nil,
   },

   -- Yellow Dandelion
   { name = 'dandelionWhite_digger_begins',
     title = S("I like the White color"),
     node = 'flowers:dandelion_white',
     desc = S("Dig 10 White Dandelions."),
     icon = "dye_white.png",
     type = "dig",
     target = 10,
     titems = {'dye:white'},
     tprizes = nil,
   },

   -- Violas
   { name = 'viola_digger_begins',
     title = S("I like the Violet color"),
     node = 'flowers:viola',
     desc = S("Dig 10 Violas."),
     icon = "dye_violet.png",
     type = "dig",
     target = 10,
     titems = {'dye:violet', 'wool:violet'},
     tprizes = nil,
   },

   -- Tulip
   { name = 'tulip_digger_begins',
     title = S("I like the Orange color"),
     node = 'flowers:tulip',
     desc = S("Dig 10 Tulips."),
     icon = "dye_orange.png",
     type = "dig",
     target = 10,
     titems = {'dye:orange', 'wool:orange'},
     tprizes = nil,
   },


   -- Sand
   { name = 'sand_digger_begins',
     title = S("The sand castle part. 1"),
     node = 'default:sand',
     desc = S("Dig 100 Sand blocks."),
     icon = "default_sandstone.png",
     type = "dig",
     target = 100,
     titems = {'default:sandstone', 'default:sand'},
     tprizes = nil,
   },

   -- Snow
   -- Dig 50 snowblock : unlock snow, snowblock.
   { name = 'snow_digger_begins',
     title = S("The Snow Man"),
     node = 'default:snow',
     desc = S("Dig 50 Snow Powder."),
     icon = "default_snow.png",
     type = "dig",
     target = 50,
     titems = {'default:snow', 'default:snowblock'},
     tprizes = nil,
   },

   -- Dig 8 wheat_8 : unlock flour
   { name = 'wheat_digger_begins',
     title = S("Hands in the Flour"),
     node = 'farming:wheat_8',
     desc = S("Dig 8 Mature Wheats."),
     icon = "farming_flour.png",
     type = "dig",
     target = 8,
     titems = {'farming:flour'},
     tprizes = nil,
   },

   -- Dig 50 wheat_8 : unlock Straws
   { name = 'wheat_digger_lover',
     title = S("Farmer First Steps"),
     node = 'farming:wheat_8',
     desc = S("Dig 50 Mature Wheats."),
     icon = "farming_straw.png",
     type = "dig",
     target = 50,
     titems = {'farming:straw', 'farming:wheat'},
     tprizes = nil,
   },

   -- Dig 10 coal stones : Unlock Dark dye, dark wool.
   { name = 'coal_digger_begins',
     title = S("I like the Black color"),
     node = 'default:stone_with_coal',
     desc = S("Dig 10 Coal Stones."),
     icon = "dye_black.png",
     type = "dig",
     target = 10,
     titems = {'dye:black', 'wool:black'},
     tprizes = nil,
   },

   -- Dig 50 coal stones : Unlock torches (End of Darkness).
   { name = 'coal_digger_lover',
     title = S("End of Darkness"),
     node = 'default:stone_with_coal',
     desc = S("Dig 50 Coal Stones."),
     icon = "default_torch_on_floor.png",
     type = "dig",
     target = 50,
     titems = {'default:torch'},
     tprizes = nil,
   },

   -- Dig 100 coal stones : Unlock coalblocks.
   { name = 'coal_digger',
     title = S("Coal Miner"),
     node = 'default:stone_with_coal',
     desc = S("Dig 100 Coal Stones."),
     icon = "default_coal_block.png",
     type = "dig",
     target = 100,
     titems = {'default:coalblock'},
     tprizes = nil,
   },

   -- Dig 50 stones : unlock stone axe,sword.
   { name = 'stone_digger_begins',
     title = S("Micro Miner"),
     node = 'default:stone',
     desc = S("Dig 50 Stone blocks."),
     icon = "default_tool_stoneaxe.png",
     type = "dig",
     target = 50,
     titems = {'default:axe_stone', 'default:sword_stone'},
     tprizes = nil,
   },

   -- Dig 100 gravel : unlock stone shovel
   { name = 'gravel_digger_begins',
     title = S("Get the Stone Shovel"),
     node = 'default:gravel',
     desc = S("Dig 100 Gravel blocks."),
     icon = "default_tool_stoneshovel.png",
     type = "dig",
     target = 100,
     titems = {'default:shovel_stone'},
     tprizes = nil,
   },

   -- Dig 50 Clay : unlock clay, clay lump
   { name = 'clay_digger_begins',
     title = S("Clay Discover"),
     node = 'default:clay',
     desc = S("Dig 50 Clay blocks."),
     icon = "default_clay.png",
     type = "dig",
     target = 50,
     titems = {'default:clay', 'default:clay_lump'},
     tprizes = nil,
   },

   -- Dig 50 iron stones : unlock bucket, bars, steel door, steel bottle.
   { name = 'iron_digger_begins',
     title = S("The Iron Age"),
     node = 'default:stone_with_iron',
     desc = S("Dig 50 Iron Stones."),
     icon = "bucket_water.png",
     type = "dig",
     target = 50,
     titems = {'bucket:bucket_empty', 'xpanes:bar', 'doors:door_steel', 'vessels:steel_bottle'},
     tprizes = nil,
   },

   -- Dig 100 iron stones : unlock Steel block, iron ingot.
   { name = 'iron_digger_lover',
     title = S("The Iron Peak"),
     node = 'default:stone_with_iron',
     desc = S("Dig 100 Iron Stones."),
     icon = "default_steel_block.png",
     type = "dig",
     target = 100,
     titems = {'default:steelblock', 'default:steel_ingot'},
     tprizes = nil,
   },

   --+ Dig 10 steel block : unlock screwdriver.
   { name = 'steelblock_digger',
     title = S("Unlock the Screwdriver"),
     node = 'default:steelblock',
     desc = S("Dig 10 Steel Blocks."),
     icon = "screwdriver.png",
     type = "dig",
     target = 10,
     titems = {'screwdriver:screwdriver'},
     tprizes = nil,
   },

   -- Dig 50 copper stone : unlock copper block, copper ingot.
   { name = 'copper_digger_begins',
     title = S("The Copper Age"),
     node = 'default:stone_with_copper',
     desc = S("Dig 50 Copper Stones."),
     icon = "default_copper_block.png",
     type = "dig",
     target = 50,
     titems = {'default:copperblock', 'default:copper_ingot'},
     tprizes = nil,
   },

   -- Dig 100 copper stone : unlock bronze ingot.
   { name = 'copper_digger',
     title = S("The Bronze Age"),
     node = 'default:stone_with_copper',
     desc = S("Dig 100 Copper Stones."),
     icon = "default_bronze_ingot.png",
     type = "dig",
     target = 50,
     titems = {'default:bronze_ingot'},
     tprizes = nil,
   },

   -- Dig 50 mese stone : unlock mese crystal, mese blocks, mese fragments.
   { name = 'Mese_digger',
     title = S("The Mese Manipulator"),
     node = 'default:stone_with_mese',
     desc = S("Dig 50 Mese Stones."),
     icon = "default_mese_block.png",
     type = "dig",
     target = 50,
     titems = {'default:mese', 'default:mese_crystal', 'default:mese_crystal_fragment'},
     tprizes = nil,
   },

   -- Dig 50 Gold stone : unlock goldblock, gold ingot.
   { name = 'gold_digger_begins',
     title = S("The Gold Digger"),
     node = 'default:stone_with_gold',
     desc = S("Dig 50 Gold Stones."),
     icon = "default_gold_block.png",
     type = "dig",
     target = 50,
     titems = {'default:goldblock', 'default:gold_ingot'},
     tprizes = nil,
   },

   -- Dig 50 diamond stones : unlock diamond block, diamond.
   { name = 'diamond_digger_begins',
     title = S("The Diamond Digger"),
     node = 'default:stone_with_diamond',
     desc = S("Dig 50 Diamond Stones."),
     icon = "default_diamond_block.png",
     type = "dig",
     target = 50,
     titems = {'default:diamondblock', 'default:diamond'},
     tprizes = nil,
   },

   -- Dig 50 obsidian block : unlock obs. shard, obsidian door, obs. block.
   { name = 'obsidian_digger_begins',
     title = S("The Obsidian Digger"),
     node = 'default:obsidian',
     desc = S("Dig 50 Obsidian Blocks."),
     icon = "default_obsidian.png",
     type = "dig",
     target = 50,
     titems = {'default:obsidian', 'default:obsidian_shard', 'doors:door_obsidian_glass'},
     tprizes = nil,
   },

   -- Craft achievements (craft) --

   -- Wood
   { name = 'wood_crafter_begins',
     title = S("First steps of a Crafter"),
     node = 'default:wood',
     desc = S("Craft 50 Wooden Planks."),
     icon = "doors_wood.png",
     type = "craft",
     target = 50,
     titems = {'doors:door_wood', 'doors:trapdoor', 'boats:boat', 'default:chest', 'default:bookshelf', 'vessels:shelf'},
     tprizes = {'default:torch 4'},
   },

   -- Stick
   { name = 'stick_crafter_begins',
     title = S("Stick specialist"),
     node = 'default:stick',
     desc = S("Craft 50 sticks."),
     icon = "default_ladder.png",
     type = "craft",
     target = 50,
     titems = {'default:ladder', 'default:fence_wood'},
     tprizes = nil,
   },

   -- Wool - Red
   { name = 'redwool_crafter_begins',
     title = S("A bit of rest"),
     node = 'wool:red',
     desc = S("Craft 20 Red wool."),
     icon = "beds_bed.png",
     type = "craft",
     target = 20,
     titems = {'beds:bed_bottom', 'beds:fancy_bed_bottom'},
     tprizes = nil,
   },

   -- Hoe Wood
   { name = 'hoe_crafter_begins',
     title = S("What a shovel !"),
     node = 'farming:hoe_wood',
     desc = S("Craft 10 Wooden hoes."),
     icon = "default_tool_woodshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_wood'},
     tprizes = nil,
   },

   -- Sandstone
   { name = 'sandstone_crafter_begins',
     title = S("The sand castle part. 2"),
     node = 'default:sandstone',
     desc = S("Craft 100 sandstones."),
     icon = "default_sandstone_brick.png",
     type = "craft",
     target = 100,
     titems = {'default:sandstonebrick'},
     tprizes = nil,
   },

   -- Shovel wood
   { name = 'shovelwood_crafter_begins',
     title = S("Unlock the Pick Wood"),
     node = 'default:shovel_wood',
     desc = S("Craft 10 Shovel wood."),
     icon = "default_tool_woodpick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_wood'},
     tprizes = nil,
   },

   -- Craft 10 Straws : unlock stone hoe
   { name = 'straw_crafter_begins',
     title = S("Unlock the Stone hoe"),
     node = 'farming:straw',
     desc = S("Craft 10 Straws."),
     icon = "farming_tool_stonehoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_stone'},
     tprizes = nil,
   },

   -- Craft 30 dyes : Unlock All the others dyes.
   { name = 'dye_crafter_begins',
     title = S("More Color"),
     node = 'dye:red',
     desc = S("Craft 30 Coloured Dyes."),
     icon = "dye_brown.png",
     type = "craft",
     target = 30,
     titems = {'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:green', 'dye:grey', 'dye:magenta', 'dye:pink'},
     tprizes = nil,
   },

   -- Craft 30 colored wools : Unlock All the others colored wools.
   { name = 'wool_crafter_begins',
     title = S("The Rainbow Wools"),
     node = 'wool:red',
     desc = S("Craft 30 Coloured Wools."),
     icon = "wool_brown.png",
     type = "craft",
     target = 30,
     titems = {'wool:brown','wool:cyan', 'wool:dark_green', 'wool:dark_grey', 'wool:green', 'wool:grey', 'wool:magenta', 'wool:pink'},
     tprizes = nil,
   },

   -- Craft 50 torches : unlock furnace.
   { name = 'torch_crafter_begins',
     title = S("Look at the Furnace"),
     node = 'default:torch',
     desc = S("Craft 50 torches."),
     icon = "default_furnace_front.png",
     type = "craft",
     target = 50,
     titems = {'default:furnace'},
     tprizes = nil,
   },

   -- Craft 50 glass pane : unlock drinking glasses, and bottles and glass fragments
   { name = 'pane_crafter_begins',
     title = S("Glass Blower"),
     node = 'xpanes:pane',
     desc = S("Craft 50 Glass Panes."),
     icon = "vessels_glass_bottle.png",
     type = "craft",
     target = 50,
     titems = {'vessels:drinking_glass', 'vessels:glass_bottle', 'vessels:glass_fragments'},
     tprizes = nil,
   },

   -- Craft 10 glass vessel (bottle, drinking glass, glass fragments : Unlock glass door.
   { name = 'vessel_crafter_begins',
     title = S("Glass Blower Lover"),
     node = 'vessels:glass_bottle',
     desc = S("Craft 50 Glass Recipients."),
     icon = "doors_glass.png",
     type = "craft",
     target = 50,
     titems = {'doors:door_glass'},
     tprizes = nil,
   },

   -- Craft 50 bricks : unlock stone bricks.
   { name = 'brick_crafter_begins',
     title = S("Stone Bricks Crafter"),
     node = 'default:brick',
     desc = S("Craft 50 Brick blocks."),
     icon = "default_stone_brick.png",
     type = "craft",
     target = 50,
     titems = {'default:stonebrick', 'default:desert_stonebrick'},
     tprizes = nil,
   },

   -- Craft 100 stonebricks : Unlock stone pick.
   { name = 'stonebrick_crafter_begins',
     title = S("Get the Stone Pick"),
     node = 'default:stonebrick',
     desc = S("Craft 100 Stone Bricks."),
     icon = "default_tool_stonepick.png",
     type = "craft",
     target = 100,
     titems = {'default:pick_stone'},
     tprizes = nil,
   },

   -- Craft 50 steel block : unlock locked chests, rails.
   { name = 'steel_crafter_begins',
     title = S("Unlock Crafts with Steel"),
     node = 'default:steelblock',
     desc = S("Craft 50 Steel Blocks."),
     icon = "default_rail.png",
     type = "craft",
     target = 50,
     titems = {'default:rail', 'default:chest_locked'},
     tprizes = nil,
   },

   -- Craft 50 bronze ingot : unlock Bronze block.
   { name = 'bronze_crafter_begins',
     title = S("Bronze Crafter First Steps"),
     node = 'default:bronze_ingot',
     desc = S("Craft 50 Bronze ingots."),
     icon = "default_bronze_block.png",
     type = "craft",
     target = 50,
     titems = {'default:bronzeblock'},
     tprizes = nil,
   },

   -- Tools crafts achievements --

   { name = 'pick_crafter_begins',
     title = S("Pick Crafter : Newbee"),
     node = 'default:pick_stone',
     desc = S("Craft 10 Stone Picks."),
     icon ="default_tool_steelpick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_steel'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_begins',
     title = S("Shovel Crafter : Newbee"),
     node = 'default:shovel_stone',
     desc = S("Craft 10 Stone Shovels."),
     icon ="default_tool_steelshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_steel'},
     tprizes = nil,
   },

   { name = 'axe_crafter_begins',
     title = S("Axe Crafter : Newbee"),
     node = 'default:axe_stone',
     desc = S("Craft 10 Stone Axes."),
     icon ="default_tool_steelaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_steel'},
     tprizes = nil,
   },

   { name = 'sword_crafter_begins',
     title = S("Sword Crafter : Newbee"),
     node = 'default:sword_stone',
     desc = S("Craft 10 Stone Swords."),
     icon ="default_tool_steelsword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_steel'},
     tprizes = nil,
   },

   { name = 'pick_crafter_newbee',
     title = S("Pick Crafter : Lover"),
     node = 'default:pick_steel',
     desc = S("Craft 10 Steel Picks."),
     icon ="default_tool_bronzepick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_bronze'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_newbee',
     title = S("Shovel Crafter : Lover"),
     node = 'default:shovel_steel',
     desc = S("Craft 10 Steel Shovels."),
     icon ="default_tool_bronzeshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_bronze'},
     tprizes = nil,
   },

   { name = 'axe_crafter_newbee',
     title = S("Axe Crafter : Lover"),
     node = 'default:axe_steel',
     desc = S("Craft 10 Steel Axes."),
     icon ="default_tool_bronzeaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_bronze'},
     tprizes = nil,
   },

   { name = 'sword_crafter_newbee',
     title = S("Sword Crafter : Lover"),
     node = 'default:sword_steel',
     desc = S("Craft 10 Steel Swords."),
     icon ="default_tool_bronzesword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_bronze'},
     tprizes = nil,
   },

   { name = 'pick_crafter_lover',
     title = S("Pick Crafter : Professional"),
     node = 'default:pick_bronze',
     desc = S("Craft 10 Bronze Picks."),
     icon ="default_tool_mesepick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_mese'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_lover',
     title = S("Shovel Crafter : Professional"),
     node = 'default:shovel_bronze',
     desc = S("Craft 10 Bronze Shovels."),
     icon ="default_tool_meseshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_mese'},
     tprizes = nil,
   },

   { name = 'axe_crafter_lover',
     title = S("Axe Crafter : Professional"),
     node = 'default:axe_bronze',
     desc = S("Craft 10 Bronze Axes."),
     icon ="default_tool_meseaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_mese'},
     tprizes = nil,
   },

   { name = 'sword_crafter_lover',
     title = S("Sword Crafter : Professional"),
     node = 'default:sword_bronze',
     desc = S("Craft 10 Bronze Swords."),
     icon ="default_tool_mesesword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_mese'},
     tprizes = nil,
   },

   { name = 'pick_crafter_pro',
     title = S("Pick Crafter : Specialized"),
     node = 'default:pick_mese',
     desc = S("Craft 10 Mese Picks."),
     icon ="default_tool_diamondpick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_diamond'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_pro',
     title = S("Shovel Crafter : Specialized"),
     node = 'default:shovel_mese',
     desc = S("Craft 10 Mese Shovels."),
     icon ="default_tool_diamondshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_diamond'},
     tprizes = nil,
   },

   { name = 'axe_crafter_pro',
     title = S("Axe Crafter : Specialized"),
     node = 'default:axe_mese',
     desc = S("Craft 10 Mese Axes."),
     icon ="default_tool_diamondaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_diamond'},
     tprizes = nil,
   },

   { name = 'sword_crafter_pro',
     title = S("Sword Crafter : Specialized"),
     node = 'default:sword_mese',
     desc = S("Craft 10 Mese Swords."),
     icon ="default_tool_diamondsword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_diamond'},
     tprizes = nil,
   },

   -- Hoes
   { name = 'hoe_crafter_lover',
     title = S("Hoe Crafter : Newbee"),
     node = 'farming:hoe_stone',
     desc = S("Craft 10 Stone Hoes."),
     icon = "farming_tool_steelhoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_steel'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_good',
     title = S("Hoe Crafter : Lover"),
     node = 'farming:hoe_steel',
     desc = S("Craft 10 Steel Hoes."),
     icon = "farming_tool_bronzehoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_bronze'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_pro',
     title = S("Hoe Crafter : Professional"),
     node = 'farming:hoe_bronze',
     desc = S("Craft 10 Bronze Hoes."),
     icon = "farming_tool_mesehoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_mese'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_master',
     title = S("Hoe Crafter : Specialized"),
     node = 'farming:hoe_mese',
     desc = S("Craft 10 Mese Hoes."),
     icon = "farming_tool_diamondhoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_diamond'},
     tprizes = nil
   },
   

}

-- Secrets achievements table
local sa = {
   { name = 'secret_stuff',
     title = S("Not only Waste"),
     node = 'sys4_achievements:waste',
     desc = S("Dig 10 Waste blocks."),
     icon ="waste.png",
     type = "dig",
     target = 10,
     titems = nil,
     tprizes = {'default:axe_diamond 99', 'default:pick_diamond 99', 'default:shovel_diamond 99', 'default:sword_diamond 99', 'farming:hoe_diamond 99', 'default:furnace', 'default:chest', 'default:meselamp'}
   }
}
    
-- Register achievements from tables
for i=1, #a do
   awards.register_achievement(
      a[i].name,
      {
	 title = a[i].title,
	 description = a[i].desc ,
	 icon = a[i].icon,
	 trigger = { type = a[i].type, node = a[i].node, target = a[i].target},
	 items = a[i].titems,
	 prizes = a[i].tprizes,
	 book = { title = "SYS4 AWARDS : "..a[i].title,
		  text = sys4_achievements.write_book(a[i].titems, a[i].tprizes)
	 },
      })
end

for i=1, #sa do
   awards.register_achievement(
      sa[i].name,
      {
	 title = sa[i].title,
	 description = sa[i].desc ,
	 icon = sa[i].icon,
	 trigger = { type = sa[i].type, node = sa[i].node, target = sa[i].target},
	 items = sa[i].titems,
	 prizes = sa[i].tprizes,
	 book = { title = "SYS4 SECRET : "..sa[i].title,
		  text = sys4_achievements.write_book(sa[i].titems, sa[i].tprizes)
	 },
	 secret = 1
      })
end
   

-- Register Specialized steps with some achievements
awards.register_onDig(
   function(player, data)
      local playern = player:get_player_name()

      local achievements = {
	 sys4_achievements.getAchievement("dig", "tree_digger_begins"),
	 sys4_achievements.getAchievement("dig", "leave_digger_begins"),
	 sys4_achievements.getAchievement("dig", "sand_digger_begins"),
	 sys4_achievements.getAchievement("dig", "snow_digger_begins"),
	 sys4_achievements.getAchievement("dig", "stone_digger_begins"),
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 local name = achievement.award

	 if not sys4_achievements.has_achievement(playern, name) then
	    local node = achievement.node
	    local target = achievement.target
	    local mod = ""
	    local items = {}

	    if node == 'default:tree' then
	       mod = 'default'
	       items = {'tree', 'jungletree', 'pine_tree', 'acacia_tree'}
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
	    
	    local count = sys4_achievements.getItemCount("dig", mod, items, playern, data)
	    
	    if count > target - 1 then
	       return name
	    end
	 end
      end
   end)

awards.register_onPlace(
   function(player, data)
      local playern = player:get_player_name()
      local achievements = {
	 sys4_achievements.getAchievement("place", "tree_builder_begins"),
	 sys4_achievements.getAchievement("place", "wood_builder_begins"),
	 sys4_achievements.getAchievement("place", "stone_builder_begins"),
	 sys4_achievements.getAchievement("place", "stonebrick_builder_begins"),
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 local name = achievement.award

	 if not sys4_achievements.has_achievement(playern, name) then
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
	    
	    local count = sys4_achievements.getItemCount("place", mod, items, playern, data)
	    
	    if count > target - 1 then
	       return name
	    end
	 end
      end
   end)

sys4_achievements.register_onCraft(
   function(player, data)
      local playern = player:get_player_name()

      local achievements = {
	 sys4_achievements.getAchievement("craft", "wood_crafter_begins"),
	 sys4_achievements.getAchievement("craft", "dye_crafter_begins"),
	 sys4_achievements.getAchievement("craft", "wool_crafter_begins"),
	 sys4_achievements.getAchievement("craft", "vessel_crafter_begins"),
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 local name = achievement.award

	 if not sys4_achievements.has_achievement(playern, name) then
	    local node = achievement.node
	    local target = achievement.target
	    local mod = ""
	    local items = {}

	    if node == 'default:wood' then
	       mod = "default"
	       items = {'wood', 'junglewood', 'pine_wood', 'acacia_wood'}
	    end

	    if node == 'dye:red' then
	       mod = "dye"
	       items = {'red', 'blue', 'yellow', 'white', 'orange', 'violet', 'black'}
	    end

	    if node == 'wool:red' then
	       mod = 'wool'
	       items = {'red', 'blue', 'yellow', 'white', 'orange', 'violet', 'black'}
	    end

	    if node == 'vessels:glass_bottle' then
	       mod = 'vessels'
	       items = {'vessels:glass_bottle', 'vessels:drinking_glass', 'vessels:glass_fragments'}
	    end

	    local count = sys4_achievements.getItemCount("craft", mod, items, playern, data)
	    
	    if count > target - 1 then
	       return name
	    end
	 end
      end
   end)
