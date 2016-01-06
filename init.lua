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


-- Level of difficulty
local lvl = sys4_achievements.getLevel()

-- Craftmode
local craftmode = sys4_achievements.getCraftMode()

-- Achievements table definition
local a

if not craftmode then
   -- Add 'award_req' property for some original awards from Rubenwardy and Calinou
   awards.def['award_on_the_way'].award_req = 'furnace_crafter'
   awards.def['award_youre_a_copper'].award_req = 'pick_crafter_lover'
   awards.def['award_mine2'].award_req = 'pick_crafter'
   awards.def['award_mine3'].award_req = 'pick_crafter'
   awards.def['award_mine4'].award_req = 'pick_crafter'
   awards.def['award_lightitup'].award_req = 'pick_crafter'
   awards.def['award_light_all_the_things'].award_req = 'pick_crafter'
   awards.def['award_obsessed_with_obsidian'].award_req = 'pick_crafter_pro'
   awards.def['award_nyanfind'].award_req = 'pick_crafter_lover'
   awards.def['award_mesefind'].award_req = 'pick_crafter_pro'
   awards.def['award_mesefind'].items = {'default:meselamp'}
   awards.def['award_youre_winner'].award_req = 'pick_crafter'
   
   a = {
      
      { name = 'tree_digger',
	title = S("Finding wood"),
	node = 'default:tree',
	desc = S("Dig ")..(1 * lvl).." "..S("default:tree")..".",
	icon = "default_tree.png",
	type = "dig",
	target = 1 * lvl,
	titems = {'default:wood', 'default:stick'},
	tprizes = nil,
	tbook = S("Attack a tree and obtain wood. It's an essential raw material."),
      },   

      { name = 'wood_crafter',
	title = S("Make planks and sticks"),
	node = 'default:stick',
	desc = S("Craft ")..(4 * lvl).." "..S("default:stick")..".",
	icon = "default_wood.png",
	type = "craft",
	target = 4 * lvl,
	titems = {'default:pick_wood', 'farming:hoe_wood'},
	tprizes = nil,
	tbook = S("Make Planks and Sticks from wood."),
	award_req = 'tree_digger'
      },   

      { name = 'pick_crafter',
	title = S("Good Pick!"),
	node = 'default:pick_wood',
	desc = S("Craft ")..(1 * lvl).." "..S("default:pick_wood")..".",
	icon = "default_tool_woodpick.png",
	type = "craft",
	target = 1 * lvl,
	titems = {'default:pick_stone', 'default:furnace'},
	tprizes = nil,
	tbook = S("Make a wooden Pick from planks and sticks."),
	award_req = 'wood_crafter'
      },   

      { name = 'pick_crafter_lover',
	title = S("Better Pick!"),
	node = 'default:pick_stone',
	desc = S("Craft ")..(1 * lvl).." "..S("default:pick_stone")..".",
	icon = "default_tool_stonepick.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a better quality Pick from sticks and stones."),
	award_req = 'pick_crafter'
      },   
      
      { name = 'hoe_crafter',
	title = S("Farmer"),
	node = 'farming:hoe_wood',
	desc = S("Craft ")..(1 * lvl).." "..S("farming:hoe_wood")..".",
	icon = "farming_tool_woodhoe.png",
	type = "craft",
	target = 1 * lvl,
	titems = {'farming:flour', 'farming:straw', 'beds:bed_bottom', 'beds:fancy_bed_bottom'},
	tprizes = nil,
	tbook = S("Make a wooden Hoe from planks and sticks."),
	award_req = 'wood_crafter'
      },

      { name = 'cooker',
	title = S("Lunch!"),
	node = 'farming:flour',
	desc = S("Craft ")..(1 * lvl).." "..S("farming:flour")..".",
	icon = "farming_bread.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make flour from wheat. Cook it into the furnace and good lunch!"),
	award_req = 'hoe_crafter'
      },

      { name = 'bed_crafter',
	title = S("Going to sleep"),
	node = 'beds:bed_bottom',
	desc = S("Craft ")..(1* lvl).." "..S("beds:bed_bottom")..".",
	icon = "beds_bed.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a bed from planks and wool."),
	award_req = 'hoe_crafter'
      },   

      { name = 'furnace_crafter',
	title = S("To the Furnace!"),
	node = 'default:furnace',
	desc = S("Craft ")..(1 * lvl).." "..S("default:furnace")..".",
	icon = "default_furnace_front.png",
	type = "craft",
	target = 1 * lvl,
	titems = {'default:bronze_ingot', 'default:pick_steel', 'screwdriver:screwdriver', 'vessels:drinking_glass', 'vessels:glass_bottle', 'vessels:steel_bottle'},
	tprizes = nil,
	tbook = S("Make a furnace with 8 Cobblestones."),
	award_req = 'pick_crafter'
      },   

      { name = 'iron_miner',
	title = S("Iron Age"),
	node = 'default:stone_with_iron',
	desc = S("Dig ")..(1 * lvl).." "..S("default:stone_with_iron")..".",
	icon = "default_steel_ingot.png",
	type = "dig",
	target = 1 * lvl,
	titems = {'default:iron_ingot'},
	tprizes = nil,
	tbook = S("Dig iron ore. You will can smelt steel ingot with a furnace."),
	award_req = 'pick_crafter_lover'
      },

      { name = 'pick_crafter_pro',
	title = S("Complet miner"),
	node = 'default:pick_steel',
	desc = S("Craft ")..(1 * lvl).." "..S("default:pick_steel")..".",
	icon = "default_tool_steelpick.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a steel Pick from sticks and steel ingots."),
	award_req = 'furnace_crafter'
      },   

      { name = 'bronze_crafter',
	title = S("Bronze Age"),
	node = 'default:bronze_ingot',
	desc = S("Craft ")..(1 * lvl).." "..S("default:bronze_ingot")..".",
	icon = "default_bronze_ingot.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make bronze ingots from steel and copper ingots."),
	award_req = 'furnace_crafter'
      },
      
      { name = 'straw_crafter',
	title = S("Into the straw"),
	node = 'farming:straw',
	desc = S("Craft ")..(1* lvl).." "..S("farming:straw")..".",
	icon = "farming_straw.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a straw block with 9 wheats."),
	award_req = 'hoe_crafter'
      },   

      { name = 'vessel_crafter',
	title = S("Glass Blower"),
	node = 'vessels:drinking_glass',
	desc = S("Craft ")..(1* lvl).." "..S("group:vessels")..".",
	icon = "vessels_glass_bottle.png",
	type = "craft",
	target = 1 * lvl,
	titems = {'vessels:shelf'},
	tprizes = nil,
	tbook = S("Make a container from glass or steel ingots."),
	award_req = 'furnace_crafter'
      },   

      { name = 'vessel_crafter_2',
	title = S("Shelf ?"),
	node = 'vessels:shelf',
	desc = S("Craft ")..(1* lvl).." "..S("vessels:shelf")..".",
	icon = "vessels_shelf.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a vessel shelf from planks and containers."),
	award_req = 'vessel_crafter'
      },   

      { name = 'diamond_miner',
	title = S("Bling Bling !"),
	node = 'default:stone_with_diamond',
	desc = S("Dig ")..(1* lvl).." "..S("default:stone_with_diamond")..".",
	icon = "default_diamond.png",
	type = "dig",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Dig diamonds whith help of a metal pick."),
	award_req = 'pick_crafter_pro'
      },   

      { name = 'mese_crafter',
	title = S("The Mese Glow"),
	node = 'default:meselamp',
	desc = S("Craft ")..(1* lvl).." "..S("default:meselamp")..".",
	icon = "default_meselamp.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a lamp based on Mese and Glass."),
	award_req = 'award_mesefind'
      },   

      { name = 'screwdriver_crafter',
	title = S("Tightening the Screw!"),
	node = 'screwdriver:screwdriver',
	desc = S("Craft ")..(1* lvl).." "..S("screwdriver:screwdriver")..".",
	icon = "screwdriver.png",
	type = "craft",
	target = 1 * lvl,
	titems = nil,
	tprizes = nil,
	tbook = S("Make a screwdriver from one stick and a steel ingot."),
	award_req = 'furnace_crafter'
      },   
   }
   
else
   
   awards.def['award_on_the_way'].award_req = 'torch_crafter_begins'
   awards.def['award_youre_a_copper'].award_req = 'stonebrick_crafter_begins'
   awards.def['award_mine2'].award_req = 'shovelwood_crafter_begins'
   awards.def['award_mine3'].award_req = 'shovelwood_crafter_begins'
   awards.def['award_mine4'].award_req = 'shovelwood_crafter_begins'
   awards.def['award_lightitup'].award_req = 'coal_digger_lover'
   awards.def['award_light_all_the_things'].award_req = 'coal_digger_lover'
   awards.def['award_obsessed_with_obsidian'].award_req = 'pick_crafter_lover'
   awards.def['award_nyanfind'].award_req = 'stonebrick_crafter_begins'
   awards.def['award_mesefind'].award_req = 'pick_crafter_lover'
   awards.def['award_youre_winner'].award_req = 'shovelwood_crafter_begins'
   
   a = {
      -- Builder achievements (place) --
      
      -- Trees
      { name = 'tree_builder_begins',
	title = S("My first hut"),
	node = 'default:tree',
	desc = S("Place ")..(50*lvl).." "..S("group:tree")..".",
	icon = "default_wood.png",
	type = "place",
	target = 50*lvl,
	titems = {'default:wood', 'default:acacia_wood', 'default:junglewood', 'default:pine_wood'},
	tprizes = {'default:torch'},
	award_req = 'tree_digger_begins',
	tbook = "Construit une cabane avec des troncs d'arbres. Tu pourra faire des planches."
      },

      -- Wood
      { name = 'wood_builder_begins',
	title = S("Specialized Wood builder"),
	node = 'default:wood',
	desc = S("Place ")..(50*lvl).." "..S("group:wood")..".",
	icon = "default_wood.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_wood', 'stairs:stair_wood',
		  'stairs:slab_acacia_wood', 'stairs:stair_acacia_wood',
		  'stairs:slab_pine_wood', 'stairs:stair_pine_wood',
		  'stairs:slab_junglewood', 'stairs:stair_junglewood'},
	tprizes = nil,
	award_req = 'wood_crafter_begins',
	tbook = "À force de poser des planches, tu apprends à en faire des dalles et des escaliers."
      },

      -- Papyrus
      { name = 'papyrus_builder_begins',
	title = S("Your papers please"),
	node = 'default:papyrus',
	desc = S("Place ")..(10*lvl).." "..S("default:papyrus")..".",
	icon = "default_paper.png",
	type = "place",
	target = 10*lvl,
	titems = {'default:paper'},
	tprizes = nil,
	tbook = "Plante du papyrus. En le manipulant tu découvres la fabrication du papier."
      },

      -- Bookshelf
      { name = 'bookshelf_builder_begins',
	title = S("Get the knowledge"),
	node = 'default:bookshelf',
	desc = S("Place ")..(5*lvl).." "..S("default:bookshelf")..".",
	icon = "farming_tool_woodhoe.png",
	type = "place",
	target = 5*lvl,
	titems = {'farming:hoe_wood'},
	tprizes = nil,
	award_req = 'wood_crafter_begins',
	tbook = "Pose des bibliothèques pour t'instruire. Cela te permet d'inventer la houe pour devenir fermier."
      },

      -- Sandstone
      { name = 'sandstone_builder_begins',
	title = S("Sandstone builder lover"),
	node = 'default:sandstone',
	desc = S("Place ")..(50*lvl).." "..S("default:sandstone")..".",
	icon = "default_sandstone.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_sandstone', 'stairs:stair_sandstone'},
	tprizes = nil,
	award_req = 'sand_digger_begins',
	tbook = "Les constructions en grès t'aprenne à en faire des dalles et des escaliers."
      },

      -- Sandstone bricks
      { name = 'sandstonebrick_builder_begins',
	title = S("Specialized sandstone builder"),
	node = 'default:sandstonebrick',
	desc = S("Place ")..(50*lvl).." "..S("default:sandstonebrick")..".",
	icon = "default_sandstone_brick.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_sandstonebrick', 'stairs:stair_sandstonebrick'},
	tprizes = nil,
	award_req = 'sandstone_crafter_begins',
	tbook = "Les constructions en briques de grès t'aprennent à en faire des dalles et des escaliers."
      },

      -- Place 10 Straws : unlock stairs and slab straws
      { name = 'straw_builder_begins',
	title = S("The Straw House"),
	node = 'farming:straw',
	desc = S("Place ")..(10*lvl).." "..S("farming:straw")..".",
	icon = "farming_straw.png",
	type = "place",
	target = 10*lvl,
	titems = {'stairs:slab_straw', 'stairs:stair_straw'},
	tprizes = nil,
	award_req = 'wheat_digger_lover',
	tbook = "Pose des blocs de pailles, tu sauras en faire des dalles et des escaliers."
      },

      -- Place 50 Cobblestones : Unlock stairs and slab cobblestones.
      { name = 'stone_builder_begins',
	title = S("Stone builder First Steps"),
	node = 'default:cobble',
	desc = S("Place ")..(50*lvl).." "..S("default:cobble")..".",
	icon = "default_cobble.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_cobble', 'stairs:stair_cobble', 'stairs:slab_desert_cobble', 'stairs:stair_desert_cobble'},
	tprizes = nil,
	award_req = 'shovelwood_crafter_begins',
	tbook = "Tu débutes dans la construction en pavés de pierres. Cela te permet assez vite d'en faire des dalles et des escaliers."
      },

      -- Place 50 stones : Unlock stairs and slab stones.
      { name = 'stone_builder_lover',
	title = S("Stone builder Lover"),
	node = 'default:stone',
	desc = S("Place ")..(50*lvl).." "..S("default:stone")..".",
	icon = "default_stone.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_stone', 'stairs:stair_stone', 'stairs:slab_desert_stone', 'stairs:stair_desert_stone'},
	tprizes = nil,
	award_req = 'torch_crafter_begins',
	tbook = "Pose suffisament de roche pour apprendre à en faire des dalles et des escaliers."
      },

      -- Place 10 glasses : Unlock glass pane
      { name = 'glass_builder_begins',
	title = S("Glazier"),
	node = 'default:glass',
	desc = S("Place ")..(10*lvl).." "..S("default:glass")..".",
	icon = "default_glass.png",
	type = "place",
	target = 10*lvl,
	titems = {'xpanes:pane'},
	tprizes = nil,
	award_req = 'torch_crafter_begins',
	tbook = "Pose des blocs de verre, cela t'apprendra à faire des vitres."
      },

      -- Place 50 gravel : unlock gunpowder, tnt
      { name = 'gravel_builder_begins',
	title = S("Boom !"),
	node = 'default:gravel',
	desc = S("Place ")..(50*lvl).." "..S("default:gravel")..".",
	icon = "tnt_side.png",
	type = "place",
	target = 10*lvl,
	titems = {'tnt:gunpowder', 'tnt:tnt'},
	tprizes = nil,
	award_req = 'tree_digger_begins',
	tbook = "En déposant de gravier, tu t'aperçois qu'en le mélangeant avec du charbon, cela produit de la poudre à canon. Fais-en bon usage et avec prudence."
      },

      -- Place 50 Clay : unlock bricks, clay brick
      { name = 'clay_builder_begins',
	title = S("Bricklayer First Steps"),
	node = 'default:clay',
	desc = S("Place ")..(50*lvl).." "..S("default:clay")..".",
	icon = "default_brick.png",
	type = "place",
	target = 50*lvl,
	titems = {'default:brick', 'default:clay_brick'},
	tprizes = nil,
	award_req = 'clay_digger_begins',
	tbook = "L'argile permet d'être cuite au four. Le résultat permet d'en faire des blocs de briques très utiles pour des constructions solides."
      },

      -- Place 50 stonebricks : Unlock stairs and slab stonebricks.
      { name = 'stonebrick_builder_begins',
	title = S("Stonemason First Steps"),
	node = 'default:stonebrick',
	desc = S("Place ")..(50*lvl).." "..S("default:stonebrick")..".",
	icon = "default_stone_brick.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_stonebrick', 'stairs:stair_stonebrick', 'stairs:slab_desert_stonebrick', 'stairs:stair_desert_stonebrick'},
	tprizes = nil,
	award_req = 'torch_crafter_begins',
	tbook = "Les briques en roches n'ont plus de secrets pour toi. Désormais tu sais en faire des dalles et des escaliers."
      },

      -- Place 50 bricks : unlock stairs and slab bricks
      { name = 'brick_builder_begins',
	title = S("Bricklayer Lover"),
	node = 'default:brick',
	desc = S("Place ")..(50*lvl).." "..S("default:brick")..".",
	icon = "default_brick.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_brick', 'stairs:stair_brick'},
	tprizes = nil,
	award_req = 'torch_crafter_begins',
	tbook = "Les blocs de briques c'est bien, mais pour être plus professionel, des dalles et des escaliers sont tout indiqués."
      },

      -- Place 50 steel block : unlock stairs and slab steel block.
      { name = 'steel_builder_begins',
	title = S("Steel Builder"),
	node = 'default:steelblock',
	desc = S("Place ")..(50*lvl).." "..S("default:steelblock")..".",
	icon = "default_steel_block.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_steelblock', 'stairs:stair_steelblock'},
	tprizes = nil,
	award_req = 'iron_digger_lover',
	tbook = "Pose des blocs d'aciers, suffisament afin d'en faire des dalles et des escaliers."
      },

      -- Place 50 copper blocks : unlock stairs and slab copper blocks.
      { name = 'copper_builder_begins',
	title = S("Copper Builder"),
	node = 'default:copperblock',
	desc = S("Place ")..(50*lvl).." "..S("default:copperblock")..".",
	icon = "default_copper_block.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_copperblock', 'stairs:stair_copperblock'},
	tprizes = nil,
	award_req = 'copper_digger_begins',
	tbook = "Pose des blocs de cuivre, suffisament pour en faire des dalles et des escaliers."
      },

      -- Place 50 Bronze block : unlock stairs and slab bronze blocks.
      { name = 'bronze_builder_begins',
	title = S("Bronze Builder"),
	node = 'default:bronzeblock',
	desc = S("Place ")..(50*lvl).." "..S("default:bronzeblock")..".",
	icon = "default_bronze_block.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_bronzeblock', 'stairs:stair_bronzeblock'},
	tprizes = nil,
	award_req = 'bronze_crafter_begins'
      },

      -- Place 100 torches : unlock mese lamp.
      { name = 'torch_placer',
	title = S("I'm Illuminated"),
	node = 'default:torch',
	desc = S("Place ")..(100*lvl).." "..S("default:torch")..".",
	icon = "default_meselamp.png",
	type = "place",
	target = 100*lvl,
	titems = {'default:meselamp'},
	tprizes = nil,
	award_req = 'coal_digger_lover'
      },

      -- Place 50 gold blocks : unlock stairs and slab gold blocks.
      { name = 'gold_builder',
	title = S("Gold Builder"),
	node = 'default:goldblock',
	desc = S("Place ")..(50*lvl).." "..S("default:goldblock")..".",
	icon = "default_gold_block.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_goldblock', 'stairs:stair_goldblock'},
	tprizes = nil,
	award_req = 'gold_digger_begins'
      },

      -- Place 50 obs. block : unlock obsidian bricks, stairs and slab obs. blocks.
      { name = 'obsidian_builder_begins',
	title = S("Obsidian Builder First Steps"),
	node = 'default:obsidian',
	desc = S("Place ")..(50*lvl).." "..S("default:obsidian")..".",
	icon = "default_obsidian_brick.png",
	type = "place",
	target = 50*lvl,
	titems = {'default:obsidianbrick', 'stairs:slab_obsidian', 'stairs:stair_obsidian'},
	tprizes = nil,
	award_req = 'obsidian_digger_begins'
      },

      -- Place 50 obs. bricks : unlock stairs and slab obs. bricks.
      { name = 'obsidian_builder_lover',
	title = S("Obsidian Builder Lover"),
	node = 'default:obsidianbrick',
	desc = S("Place ")..(50*lvl).." "..S("default:obsidianbrick")..".",
	icon = "default_obsidian_brick.png",
	type = "place",
	target = 50*lvl,
	titems = {'stairs:slab_obsidianbrick', 'stairs:stair_obsidianbrick'},
	tprizes = nil,
	award_req = 'obsidian_builder_begins'
      },

      -- Miner achievements (dig) --

      -- Leaves
      { name = 'leave_digger_begins',
	title = S("Sticks into the trees"),
	node = 'default:leaves',
	desc = S("Dig ")..(50*lvl).." "..S("group:leaves")..".",
	icon = "default_stick.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:stick'},
	tprizes = nil,
      },

      -- Trees
      { name = 'tree_digger_begins',
	title = S("First steps of a Lumberjack"),
	node = 'default:tree',
	desc = S("Dig ")..(50*lvl).." "..S("group:tree")..".",
	icon = "default_tool_woodaxe.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:axe_wood', 'default:sword_wood'},
	tprizes = nil,
      },

      -- Papyrus
      { name = 'papyrus_digger_begins',
	title = S("You know write ?"),
	node = 'default:papyrus',
	desc = S("Dig ")..(50*lvl).." "..S("default:papyrus")..".",
	icon = "default_book.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:book', 'default:sign_wall'},
	tprizes = nil,
      },

      -- Cotton
      { name = 'cotton_digger_begins',
	title = S("Spinner's first steps"),
	node = 'farming:cotton_8',
	desc = S("Dig ")..(50*lvl).." "..S("farming:cotton")..".",
	icon = "wool_white.png",
	type = "dig",
	target = 50*lvl,
	titems = {'wool:white'},
	tprizes = nil,
	award_req = 'bookshelf_builder_begins'
      },

      -- Rose flower
      { name = 'rose_digger_begins',
	title = S("I like the Red color"),
	node = 'flowers:rose',
	desc = S("Dig ")..(10*lvl).." "..S("flowers:rose")..".",
	icon = "dye_red.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:red', 'wool:red'},
	tprizes = nil,
      },

      -- Geranium flower
      { name = 'geranium_digger_begins',
	title = S("I like the Blue color"),
	node = 'flowers:geranium',
	desc = S("Dig ")..(10*lvl).." "..S("flowers:geranium")..".",
	icon = "dye_blue.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:blue', 'wool:blue'},
	tprizes = nil,
      },

      -- Yellow Dandelion
      { name = 'dandelionYellow_digger_begins',
	title = S("I like the Yellow color"),
	node = 'flowers:dandelion_yellow',
	desc = S("Dig ")..(10*lvl).." "..S("flowers:dandelion_yellow")..".",
	icon = "dye_yellow.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:yellow', 'wool:yellow'},
	tprizes = nil,
      },

      -- Yellow Dandelion
      { name = 'dandelionWhite_digger_begins',
	title = S("I like the White color"),
	node = 'flowers:dandelion_white',
	desc = S("Dig ")..(10*lvl).." "..S("flowers:dandelion_white")..".",
	icon = "dye_white.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:white'},
	tprizes = nil,
      },

      -- Violas
      { name = 'viola_digger_begins',
	title = S("I like the Violet color"),
	node = 'flowers:viola',
	desc = S("Dig ")..(10*lvl).." "..S("flowers:viola")..".",
	icon = "dye_violet.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:violet', 'wool:violet'},
	tprizes = nil,
      },

      -- Tulip
      { name = 'tulip_digger_begins',
	title = S("I like the Orange color"),
	node = 'flowers:tulip',
	desc = S("Dig ")..(10*lvl).." "..S("flowers:tulip")..".",
	icon = "dye_orange.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:orange', 'wool:orange'},
	tprizes = nil,
      },


      -- Sand
      { name = 'sand_digger_begins',
	title = S("The sand castle part. 1"),
	node = 'default:sand',
	desc = S("Dig ")..(100*lvl).." "..S("default:sand")..".",
	icon = "default_sandstone.png",
	type = "dig",
	target = 100*lvl,
	titems = {'default:sandstone', 'default:sand'},
	tprizes = nil,
      },

      -- Snow
      -- Dig 50 snowblock : unlock snow, snowblock.
      { name = 'snow_digger_begins',
	title = S("The Snow Men"),
	node = 'default:snow',
	desc = S("Dig ")..(50*lvl).." "..S("default:snow")..".",
	icon = "default_snow.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:snow', 'default:snowblock'},
	tprizes = nil,
      },

      -- Dig 8 wheat_8 : unlock flour
      { name = 'wheat_digger_begins',
	title = S("Hands in the Flour"),
	node = 'farming:wheat_8',
	desc = S("Dig ")..(8*lvl).." "..S("farming:wheat")..".",
	icon = "farming_flour.png",
	type = "dig",
	target = 8*lvl,
	titems = {'farming:flour'},
	tprizes = nil,
	award_req = 'bookshelf_builder_begins'
      },

      -- Dig 50 wheat_8 : unlock Straws
      { name = 'wheat_digger_lover',
	title = S("Farmer First Steps"),
	node = 'farming:wheat_8',
	desc = S("Dig ")..(50*lvl).." "..S("farming:wheat")..".",
	icon = "farming_straw.png",
	type = "dig",
	target = 50*lvl,
	titems = {'farming:straw', 'farming:wheat'},
	tprizes = nil,
	award_req = 'bookshelf_builder_begins'
      },

      -- Dig 10 coal stones : Unlock Dark dye, dark wool.
      { name = 'coal_digger_begins',
	title = S("I like the Black color"),
	node = 'default:stone_with_coal',
	desc = S("Dig ")..(10*lvl).." "..S("default:stone_with_coal")..".",
	icon = "dye_black.png",
	type = "dig",
	target = 10*lvl,
	titems = {'dye:black', 'wool:black'},
	tprizes = nil,
	award_req = 'shovelwood_crafter_begins'
      },

      -- Dig 50 coal stones : Unlock torches (End of Darkness).
      { name = 'coal_digger_lover',
	title = S("End of Darkness"),
	node = 'default:stone_with_coal',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone_with_coal")..".",
	icon = "default_torch_on_floor.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:torch'},
	tprizes = nil,
	award_req = 'shovelwood_crafter_begins'
      },

      -- Dig 100 coal stones : Unlock coalblocks.
      { name = 'coal_digger',
	title = S("Coal Miner"),
	node = 'default:stone_with_coal',
	desc = S("Dig ")..(100*lvl).." "..S("default:stone_with_coal")..".",
	icon = "default_coal_block.png",
	type = "dig",
	target = 100*lvl,
	titems = {'default:coalblock'},
	tprizes = nil,
	award_req = 'shovelwood_crafter_begins'
      },

      -- Dig 50 stones : unlock stone axe,sword.
      { name = 'stone_digger_begins',
	title = S("Micro Miner"),
	node = 'default:stone',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone")..".",
	icon = "default_tool_stoneaxe.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:axe_stone', 'default:sword_stone'},
	tprizes = nil,
	award_req = 'shovelwood_crafter_begins'
      },

      -- Dig 100 gravel : unlock stone shovel
      { name = 'gravel_digger_begins',
	title = S("Get the Stone Shovel"),
	node = 'default:gravel',
	desc = S("Dig ")..(100*lvl).." "..S("default:gravel")..".",
	icon = "default_tool_stoneshovel.png",
	type = "dig",
	target = 100*lvl,
	titems = {'default:shovel_stone'},
	tprizes = nil,
      },

      -- Dig 50 Clay : unlock clay, clay lump
      { name = 'clay_digger_begins',
	title = S("Clay Discover"),
	node = 'default:clay',
	desc = S("Dig ")..(50*lvl).." "..S("default:clay")..".",
	icon = "default_clay.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:clay', 'default:clay_lump'},
	tprizes = nil,
      },

      -- Dig 50 iron stones : unlock bucket, bars, steel door, steel bottle.
      { name = 'iron_digger_begins',
	title = S("The Iron Age"),
	node = 'default:stone_with_iron',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone_with_iron")..".",
	icon = "bucket_water.png",
	type = "dig",
	target = 50*lvl,
	titems = {'bucket:bucket_empty', 'xpanes:bar', 'doors:door_steel', 'vessels:steel_bottle'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      -- Dig 100 iron stones : unlock Steel block, iron ingot.
      { name = 'iron_digger_lover',
	title = S("The Iron Peak"),
	node = 'default:stone_with_iron',
	desc = S("Dig ")..(100*lvl).." "..S("default:stone_with_iron")..".",
	icon = "default_steel_block.png",
	type = "dig",
	target = 100*lvl,
	titems = {'default:steelblock', 'default:steel_ingot'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      -- Dig 10 steel block : unlock screwdriver.
      { name = 'steelblock_digger',
	title = S("Unlock the Screwdriver"),
	node = 'default:steelblock',
	desc = S("Dig ")..(10*lvl).." "..S("default:steelblock")..".",
	icon = "screwdriver.png",
	type = "dig",
	target = 10*lvl,
	titems = {'screwdriver:screwdriver'},
	tprizes = nil,
	award_req = 'iron_digger_lover'
      },

      -- Dig 50 copper stone : unlock copper block, copper ingot.
      { name = 'copper_digger_begins',
	title = S("The Copper Age"),
	node = 'default:stone_with_copper',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone_with_copper.")..".",
	icon = "default_copper_block.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:copperblock', 'default:copper_ingot'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      -- Dig 100 copper stone : unlock bronze ingot.
      { name = 'copper_digger',
	title = S("The Bronze Age"),
	node = 'default:stone_with_copper',
	desc = S("Dig ")..(100*lvl).." "..S("default:stone_with_copper")..".",
	icon = "default_bronze_ingot.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:bronze_ingot'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      -- Dig 50 mese stone : unlock mese crystal, mese blocks, mese fragments.
      { name = 'Mese_digger',
	title = S("The Mese Manipulator"),
	node = 'default:stone_with_mese',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone_with_mese")..".",
	icon = "default_mese_block.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:mese', 'default:mese_crystal', 'default:mese_crystal_fragment'},
	tprizes = nil,
	award_req = 'pick_crafter_begins'
      },

      -- Dig 50 Gold stone : unlock goldblock, gold ingot.
      { name = 'gold_digger_begins',
	title = S("The Gold Digger"),
	node = 'default:stone_with_gold',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone_with_gold")..".",
	icon = "default_gold_block.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:goldblock', 'default:gold_ingot'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      -- Dig 50 diamond stones : unlock diamond block, diamond.
      { name = 'diamond_digger_begins',
	title = S("The Diamond Digger"),
	node = 'default:stone_with_diamond',
	desc = S("Dig ")..(50*lvl).." "..S("default:stone_with_diamond")..".",
	icon = "default_diamond_block.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:diamondblock', 'default:diamond'},
	tprizes = nil,
	award_req = 'pick_crafter_begins'
      },

      -- Dig 50 obsidian block : unlock obs. shard, obsidian door, obs. block.
      { name = 'obsidian_digger_begins',
	title = S("The Obsidian Digger"),
	node = 'default:obsidian',
	desc = S("Dig ")..(50*lvl).." "..S("default:obsidian")..".",
	icon = "default_obsidian.png",
	type = "dig",
	target = 50*lvl,
	titems = {'default:obsidian', 'default:obsidian_shard', 'doors:door_obsidian_glass'},
	tprizes = nil,
	award_req = 'pick_crafter_begins'
      },

      -- Craft achievements (craft) --

      -- Wood
      { name = 'wood_crafter_begins',
	title = S("First steps of a Crafter"),
	node = 'default:wood',
	desc = S("Craft ")..(50*lvl).." "..S("group:wood")..".",
	icon = "doors_wood.png",
	type = "craft",
	target = 50*lvl,
	titems = {'doors:door_wood', 'doors:trapdoor', 'boats:boat', 'default:chest', 'default:bookshelf', 'vessels:shelf'},
	tprizes = {'default:torch 4'},
	award_req = 'tree_builder_begins'
      },

      -- Stick
      { name = 'stick_crafter_begins',
	title = S("Stick specialist"),
	node = 'default:stick',
	desc = S("Craft ")..(50*lvl).." "..S("default:stick")..".",
	icon = "default_ladder.png",
	type = "craft",
	target = 50*lvl,
	titems = {'default:ladder', 'default:fence_wood'},
	tprizes = nil,
	award_req = 'leave_digger_begins'
      },

      -- Wool - Red
      { name = 'redwool_crafter_begins',
	title = S("A bit of rest"),
	node = 'wool:red',
	desc = S("Craft ")..(20*lvl).." "..S("wool:red")..".",
	icon = "beds_bed.png",
	type = "craft",
	target = 20*lvl,
	titems = {'beds:bed_bottom', 'beds:fancy_bed_bottom'},
	tprizes = nil,
	award_req = 'rose_digger_begins'
      },

      -- Hoe Wood
      { name = 'hoe_crafter_begins',
	title = S("What a shovel !"),
	node = 'farming:hoe_wood',
	desc = S("Craft ")..(10*lvl).." "..S("farming:hoe_wood")..".",
	icon = "default_tool_woodshovel.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:shovel_wood'},
	tprizes = nil,
	award_req = 'bookshelf_builder_begins'
      },

      -- Sandstone
      { name = 'sandstone_crafter_begins',
	title = S("The sand castle part. 2"),
	node = 'default:sandstone',
	desc = S("Craft ")..(100*lvl).." "..S("default:sandstone")..".",
	icon = "default_sandstone_brick.png",
	type = "craft",
	target = 100*lvl,
	titems = {'default:sandstonebrick'},
	tprizes = nil,
	award_req = 'sand_digger_begins'
      },

      -- Shovel wood
      { name = 'shovelwood_crafter_begins',
	title = S("Unlock the Pick Wood"),
	node = 'default:shovel_wood',
	desc = S("Craft ")..(10*lvl).." "..S("default:shovel_wood")..".",
	icon = "default_tool_woodpick.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:pick_wood'},
	tprizes = nil,
	award_req = 'hoe_crafter_begins'
      },

      -- Craft 10 Straws : unlock stone hoe
      { name = 'straw_crafter_begins',
	title = S("Unlock the Stone hoe"),
	node = 'farming:straw',
	desc = S("Craft ")..(10*lvl).." "..S("farming:straw")..".",
	icon = "farming_tool_stonehoe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'farming:hoe_stone'},
	tprizes = nil,
	award_req = 'wheat_digger_lover'
      },

      -- Craft 30 dyes : Unlock All the others dyes.
      { name = 'dye_crafter_begins',
	title = S("More Color"),
	node = 'dye:red',
	desc = S("Craft ")..(30*lvl).." "..S("group:dye")..".",
	icon = "dye_brown.png",
	type = "craft",
	target = 30*lvl,
	titems = {'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:green', 'dye:grey', 'dye:magenta', 'dye:pink'},
	tprizes = nil,
	award_req = 'rose_digger_begins'
      },

      -- Craft 30 colored wools : Unlock All the others colored wools.
      { name = 'wool_crafter_begins',
	title = S("The Rainbow Wools"),
	node = 'wool:red',
	desc = S("Craft ")..(30*lvl).." "..S("group:wool")..".",
	icon = "wool_brown.png",
	type = "craft",
	target = 30*lvl,
	titems = {'wool:brown','wool:cyan', 'wool:dark_green', 'wool:dark_grey', 'wool:green', 'wool:grey', 'wool:magenta', 'wool:pink'},
	tprizes = nil,
	award_req = 'rose_digger_begins'
      },

      -- Craft 50 torches : unlock furnace.
      { name = 'torch_crafter_begins',
	title = S("Look at the Furnace"),
	node = 'default:torch',
	desc = S("Craft ")..(50*lvl).." "..S("default:torch")..".",
	icon = "default_furnace_front.png",
	type = "craft",
	target = 50*lvl,
	titems = {'default:furnace'},
	tprizes = nil,
	award_req = 'coal_digger_lover'
      },

      -- Craft 50 glass pane : unlock drinking glasses, and bottles and glass fragments
      { name = 'pane_crafter_begins',
	title = S("Glass Blower"),
	node = 'xpanes:pane',
	desc = S("Craft ")..(50*lvl).." "..S("xpanes:pane")..".",
	icon = "vessels_glass_bottle.png",
	type = "craft",
	target = 50*lvl,
	titems = {'vessels:drinking_glass', 'vessels:glass_bottle', 'vessels:glass_fragments'},
	tprizes = nil,
	award_req = 'glass_builder_begins'
      },

      -- Craft 10 glass vessel (bottle, drinking glass, glass fragments : Unlock glass door.
      { name = 'vessel_crafter_begins',
	title = S("Glass Blower Lover"),
	node = 'vessels:glass_bottle',
	desc = S("Craft ")..(50*lvl).." "..S("group:vessels")..".",
	icon = "doors_glass.png",
	type = "craft",
	target = 50*lvl,
	titems = {'doors:door_glass'},
	tprizes = nil,
	award_req = 'pane_crafter_begins'
      },

      -- Craft 50 bricks : unlock stone bricks.
      { name = 'brick_crafter_begins',
	title = S("Stone Bricks Crafter"),
	node = 'default:brick',
	desc = S("Craft ")..(50*lvl).." "..S("default:brick")..".",
	icon = "default_stone_brick.png",
	type = "craft",
	target = 50*lvl,
	titems = {'default:stonebrick', 'default:desert_stonebrick'},
	tprizes = nil,
	award_req = 'clay_builder_begins'
      },

      -- Craft 100 stonebricks : Unlock stone pick.
      { name = 'stonebrick_crafter_begins',
	title = S("Get the Stone Pick"),
	node = 'default:stonebrick',
	desc = S("Craft ")..(100*lvl).." "..S("default:stonebrick")..".",
	icon = "default_tool_stonepick.png",
	type = "craft",
	target = 100*lvl,
	titems = {'default:pick_stone'},
	tprizes = nil,
	award_req = 'brick_crafter_begins'
      },

      -- Craft 50 steel block : unlock locked chests, rails.
      { name = 'steel_crafter_begins',
	title = S("Unlock Crafts with Steel"),
	node = 'default:steelblock',
	desc = S("Craft ")..(50*lvl).." "..S("default:steelblock")..".",
	icon = "default_rail.png",
	type = "craft",
	target = 50*lvl,
	titems = {'default:rail', 'default:chest_locked'},
	tprizes = nil,
	award_req = 'iron_digger_lover'
      },

      -- Craft 50 bronze ingot : unlock Bronze block.
      { name = 'bronze_crafter_begins',
	title = S("Bronze Crafter First Steps"),
	node = 'default:bronze_ingot',
	desc = S("Craft ")..(50*lvl).." "..S("default:bronze_ingot")..".",
	icon = "default_bronze_block.png",
	type = "craft",
	target = 50*lvl,
	titems = {'default:bronzeblock'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      -- Tools crafts achievements --

      { name = 'pick_crafter_begins',
	title = S("Pick Crafter : Newbee"),
	node = 'default:pick_stone',
	desc = S("Craft ")..(10*lvl).." "..S("default:pick_stone")..".",
	icon ="default_tool_steelpick.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:pick_steel'},
	tprizes = nil,
	award_req = 'stonebrick_crafter_begins'
      },

      { name = 'shovel_crafter_begins',
	title = S("Shovel Crafter : Newbee"),
	node = 'default:shovel_stone',
	desc = S("Craft ")..(10*lvl).." "..S("default:shovel_stone")..".",
	icon ="default_tool_steelshovel.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:shovel_steel'},
	tprizes = nil,
	award_req = 'gravel_digger_begins'
      },

      { name = 'axe_crafter_begins',
	title = S("Axe Crafter : Newbee"),
	node = 'default:axe_stone',
	desc = S("Craft ")..(10*lvl).." "..S("default:axe_stone")..".",
	icon ="default_tool_steelaxe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:axe_steel'},
	tprizes = nil,
	award_req = 'stone_digger_begins'
      },

      { name = 'sword_crafter_begins',
	title = S("Sword Crafter : Newbee"),
	node = 'default:sword_stone',
	desc = S("Craft ")..(10*lvl).." "..S("default:sword_stone")..".",
	icon ="default_tool_steelsword.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:sword_steel'},
	tprizes = nil,
	award_req = 'stone_digger_begins'
      },

      { name = 'pick_crafter_newbee',
	title = S("Pick Crafter : Lover"),
	node = 'default:pick_steel',
	desc = S("Craft ")..(10*lvl).." "..S("default:pick_steel")..".",
	icon ="default_tool_bronzepick.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:pick_bronze'},
	tprizes = nil,
	award_req = 'pick_crafter_begins'
      },

      { name = 'shovel_crafter_newbee',
	title = S("Shovel Crafter : Lover"),
	node = 'default:shovel_steel',
	desc = S("Craft ")..(10*lvl).." "..S("default:shovel_steel")..".",
	icon ="default_tool_bronzeshovel.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:shovel_bronze'},
	tprizes = nil,
	award_req = 'shovel_crafter_begins'
      },

      { name = 'axe_crafter_newbee',
	title = S("Axe Crafter : Lover"),
	node = 'default:axe_steel',
	desc = S("Craft ")..(10*lvl).." "..S("default:axe_steel")..".",
	icon ="default_tool_bronzeaxe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:axe_bronze'},
	tprizes = nil,
	award_req = 'axe_crafter_begins'
      },

      { name = 'sword_crafter_newbee',
	title = S("Sword Crafter : Lover"),
	node = 'default:sword_steel',
	desc = S("Craft ")..(10*lvl).." "..S("default:sword_steel")..".",
	icon ="default_tool_bronzesword.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:sword_bronze'},
	tprizes = nil,
	award_req = 'sword_crafter_begins'
      },

      { name = 'pick_crafter_lover',
	title = S("Pick Crafter : Professional"),
	node = 'default:pick_bronze',
	desc = S("Craft ")..(10*lvl).." "..S("default:pick_bronze")..".",
	icon ="default_tool_mesepick.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:pick_mese'},
	tprizes = nil,
	award_req = 'pick_crafter_newbee'
      },

      { name = 'shovel_crafter_lover',
	title = S("Shovel Crafter : Professional"),
	node = 'default:shovel_bronze',
	desc = S("Craft ")..(10*lvl).." "..S("default:shovel_bronze")..".",
	icon ="default_tool_meseshovel.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:shovel_mese'},
	tprizes = nil,
	award_req = 'shovel_crafter_newbee'
      },

      { name = 'axe_crafter_lover',
	title = S("Axe Crafter : Professional"),
	node = 'default:axe_bronze',
	desc = S("Craft ")..(10*lvl).." "..S("default:axe_bronze")..".",
	icon ="default_tool_meseaxe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:axe_mese'},
	tprizes = nil,
	award_req = 'axe_crafter_newbee'
      },

      { name = 'sword_crafter_lover',
	title = S("Sword Crafter : Professional"),
	node = 'default:sword_bronze',
	desc = S("Craft ")..(10*lvl).." "..S("default:sword_bronze")..".",
	icon ="default_tool_mesesword.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:sword_mese'},
	tprizes = nil,
	award_req = 'sword_crafter_newbee'
      },

      { name = 'pick_crafter_pro',
	title = S("Pick Crafter : Specialized"),
	node = 'default:pick_mese',
	desc = S("Craft ")..(10*lvl).." "..S("default:pick_mese")..".",
	icon ="default_tool_diamondpick.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:pick_diamond'},
	tprizes = nil,
	award_req = 'pick_crafter_lover'
      },

      { name = 'shovel_crafter_pro',
	title = S("Shovel Crafter : Specialized"),
	node = 'default:shovel_mese',
	desc = S("Craft ")..(10*lvl).." "..S("default:shovel_mese")..".",
	icon ="default_tool_diamondshovel.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:shovel_diamond'},
	tprizes = nil,
	award_req = 'shovel_crafter_lover'
      },

      { name = 'axe_crafter_pro',
	title = S("Axe Crafter : Specialized"),
	node = 'default:axe_mese',
	desc = S("Craft ")..(10*lvl).." "..S("default:axe_mese")..".",
	icon ="default_tool_diamondaxe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:axe_diamond'},
	tprizes = nil,
	award_req = 'axe_crafter_lover'
      },

      { name = 'sword_crafter_pro',
	title = S("Sword Crafter : Specialized"),
	node = 'default:sword_mese',
	desc = S("Craft ")..(10*lvl).." "..S("default:sword_mese")..".",
	icon ="default_tool_diamondsword.png",
	type = "craft",
	target = 10*lvl,
	titems = {'default:sword_diamond'},
	tprizes = nil,
	award_red = 'sword_crafter_lover'
      },

      -- Hoes
      { name = 'hoe_crafter_lover',
	title = S("Hoe Crafter : Newbee"),
	node = 'farming:hoe_stone',
	desc = S("Craft ")..(10*lvl).." "..S("farming:hoe_stone")..".",
	icon = "farming_tool_steelhoe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'farming:hoe_steel'},
	tprizes = nil,
	award_req = 'straw_crafter_begins'
      },
      
      { name = 'hoe_crafter_good',
	title = S("Hoe Crafter : Lover"),
	node = 'farming:hoe_steel',
	desc = S("Craft ")..(10*lvl).." "..S("farming:hoe_steel")..".",
	icon = "farming_tool_bronzehoe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'farming:hoe_bronze'},
	tprizes = nil,
	award_req = 'hoe_crafter_lover'
      },
      
      { name = 'hoe_crafter_pro',
	title = S("Hoe Crafter : Professional"),
	node = 'farming:hoe_bronze',
	desc = S("Craft ")..(10*lvl).." "..S("farming:hoe_bronze")..".",
	icon = "farming_tool_mesehoe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'farming:hoe_mese'},
	tprizes = nil,
	award_req = 'hoe_crafter_good'
      },
      
      { name = 'hoe_crafter_master',
	title = S("Hoe Crafter : Specialized"),
	node = 'farming:hoe_mese',
	desc = S("Craft ")..(10*lvl).." "..S("farming:hoe_mese")..".",
	icon = "farming_tool_diamondhoe.png",
	type = "craft",
	target = 10*lvl,
	titems = {'farming:hoe_diamond'},
	tprizes = nil,
	award_req = 'hoe_crafter_pro'
      },
      
   }
end

-- Secrets achievements table
local sa = {
   { name = 'secret_stuff',
     title = S("Not only Waste"),
     node = 'sys4_achievements:waste',
     desc = S("Dig ")..(10*lvl).." "..S("sys4_achievements:waste")..".",
     icon ="waste.png",
     type = "dig",
     target = 10*lvl,
     titems = nil,
     tprizes = {'default:axe_diamond', 'default:pick_diamond', 'default:shovel_diamond', 'default:sword_diamond', 'farming:hoe_diamond', 'default:furnace', 'default:chest', 'default:meselamp'},
     tbook = S("Vous ne vous avouez pas vaincu si facilement !\nCes objets sont pour vous afin de récompenser votre acharnement.")
   }
}
    
-- Register achievements from default table definition
for i=1, #a do
   local tbook = nil
   tbook = {title = "SYS4 AWARDS : "..a[i].title,
	    text = sys4_achievements.write_book(a[i].tbook, a[i].titems, a[i].tprizes)
   }

   awards.register_achievement(
      a[i].name,
      {
	 title = a[i].title,
	 description = a[i].desc ,
	 icon = a[i].icon,
	 trigger = { type = a[i].type, node = a[i].node, target = a[i].target},
	 items = a[i].titems,
	 prizes = a[i].tprizes,
	 book = tbook,
	 award_req = a[i].award_req
      })
end

-- Register secret achievements
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
if sys4_achievements.getCraftMode() then
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
   
awards.register_onDig(
   function(player, data)
      local playern = player:get_player_name()

      local achievements = {
	 sys4_achievements.getAchievement("dig", "tree_digger"),
	 sys4_achievements.getAchievement("dig", "tree_digger_begins"),
	 sys4_achievements.getAchievement("dig", "leave_digger_begins"),
	 sys4_achievements.getAchievement("dig", "sand_digger_begins"),
	 sys4_achievements.getAchievement("dig", "snow_digger_begins"),
	 sys4_achievements.getAchievement("dig", "stone_digger_begins"),
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 if achievement ~= nil then
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
	 if achievement ~= nil then
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
	 sys4_achievements.getAchievement("craft", "bed_crafter"),
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 if achievement ~= nil then
	    local name = achievement.award
	    
	    if not sys4_achievements.has_achievement(playern, name) then
	       local node = achievement.node
	       local target = achievement.target
	       local mod = ""
	       local items = {}
	       
	       if node == 'default:wood' then
		  mod = 'default'
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
		  items = {'glass_bottle', 'steel_bottle', 'drinking_glass', 'glass_fragments'}
	       end

	       if node == 'beds:bed_bottom' then
		  mod = 'beds'
		  items = {'bed_bottom', 'fancy_bed_bottom'}
	       end
	       
	       local count = sys4_achievements.getItemCount("craft", mod, items, playern, data)
	       
	       if count > target - 1 then
		  return name
	       end
	    end
	 end
      end
   end)
