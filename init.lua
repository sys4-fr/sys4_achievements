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

   -- Lumberjacks achievements --

   { name = 'lumberjack_begins_default',
     title = S("Un bucheron en herbe"),
     node = 'default:tree',
     desc = S("Récolte 50 blocs de bois."),
     icon ="default_tree.png",
     type = "dig",
     target = 50,
     titems = {'default:wood', 'default:pine_wood', 'default:junglewood', 'default:acacia_wood'},
     tprizes = {'default:pick_wood','default:torch 4'},
   },

   { name = 'lumberjack_begins_jungle',
     title = S("Un bucheron dans la Jungle"),
     node = 'default:jungletree',
     desc = S("Récolte 50 blocs de bois de jungle."),
     icon ="default_jungletree.png",
     type = "dig",
     target = 50,
     titems = {'default:wood', 'default:pine_wood', 'default:junglewood', 'default:acacia_wood'},
     tprizes = {'default:pick_wood', 'default:torch 4'},
   },

   { name = 'lumberjack_begins_pinetree',
     title = S("Bucheron des montagnes"),
     node = 'default:pine_tree',
     desc = S("Récolte 50 blocs de bois de résineux."),
     icon ="default_pine_tree.png",
     type = "dig",
     target = 50,
     titems = {'default:wood', 'default:pine_wood', 'default:junglewood', 'default:acacia_wood'},
     tprizes = {'default:pick_wood', 'default:torch 4'},
   },

   { name = 'lumberjack_begins_acacia',
     title = S("Bucheron du désert"),
     node = 'default:acacia_tree',
     desc = S("Récolte 50 blocs de bois d'acacia."),
     icon ="default_acacia_tree.png",
     type = "dig",
     target = 50,
     titems = {'default:wood', 'default:pine_wood', 'default:junglewood', 'default:acacia_wood'},
     tprizes = {'default:pick_wood', 'default:torch 4'},
   },

   -- Crafts achievements --

   -- Tools crafts achievements --

   { name = 'pick_crafter_begins',
     title = S("Artisanat des pioches - Découverte -"),
     node = 'default:pick_stone',
     desc = S("Fabrique 10 pioches en pierres."),
     icon ="default_tool_steelpick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_steel'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_begins',
     title = S("Artisanat des pelles - Découverte -"),
     node = 'default:shovel_stone',
     desc = S("Fabrique 10 pelles en pierres."),
     icon ="default_tool_steelshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_steel'},
     tprizes = nil,
   },

   { name = 'axe_crafter_begins',
     title = S("Artisanat des haches - Découverte -"),
     node = 'default:axe_stone',
     desc = S("Fabrique 10 haches en pierres."),
     icon ="default_tool_steelaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_steel'},
     tprizes = nil,
   },

   { name = 'sword_crafter_begins',
     title = S("Artisanat des épées - Découverte -"),
     node = 'default:sword_stone',
     desc = S("Fabrique 10 épées en pierres."),
     icon ="default_tool_steelsword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_steel'},
     tprizes = nil,
   },

   { name = 'pick_crafter_newbee',
     title = S("Artisanat des pioches - Débutant -"),
     node = 'default:pick_steel',
     desc = S("Fabrique 10 pioches en fer."),
     icon ="default_tool_bronzepick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_bronze'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_newbee',
     title = S("Artisanat des pelles - Débutant -"),
     node = 'default:shovel_steel',
     desc = S("Fabrique 10 pelles en fer."),
     icon ="default_tool_bronzeshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_bronze'},
     tprizes = nil,
   },

   { name = 'axe_crafter_newbee',
     title = S("Artisanat des haches - Débutant -"),
     node = 'default:axe_steel',
     desc = S("Fabrique 10 haches en fer."),
     icon ="default_tool_bronzeaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_bronze'},
     tprizes = nil,
   },

   { name = 'sword_crafter_newbee',
     title = S("Artisanat des épées - Débutant -"),
     node = 'default:sword_steel',
     desc = S("Fabrique 10 épées en fer."),
     icon ="default_tool_bronzesword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_bronze'},
     tprizes = nil,
   },

   { name = 'pick_crafter_lover',
     title = S("Artisanat des pioches - Amateur -"),
     node = 'default:pick_bronze',
     desc = S("Fabrique 10 pioches en bronze."),
     icon ="default_tool_mesepick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_mese'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_lover',
     title = S("Artisanat des pelles - Amateur -"),
     node = 'default:shovel_bronze',
     desc = S("Fabrique 10 pelles en bronze."),
     icon ="default_tool_meseshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_mese'},
     tprizes = nil,
   },

   { name = 'axe_crafter_lover',
     title = S("Artisanat des haches - Amateur -"),
     node = 'default:axe_bronze',
     desc = S("Fabrique 10 haches en bronze."),
     icon ="default_tool_meseaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_mese'},
     tprizes = nil,
   },

   { name = 'sword_crafter_lover',
     title = S("Artisanat des épées - Amateur -"),
     node = 'default:sword_bronze',
     desc = S("Fabrique 10 épées en bronze."),
     icon ="default_tool_mesesword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_mese'},
     tprizes = nil,
   },

   { name = 'pick_crafter_pro',
     title = S("Artisanat des pioches - Professionnel -"),
     node = 'default:pick_mese',
     desc = S("Fabrique 10 pioches en mese."),
     icon ="default_tool_diamondpick.png",
     type = "craft",
     target = 10,
     titems = {'default:pick_diamond'},
     tprizes = nil,
   },

   { name = 'shovel_crafter_pro',
     title = S("Artisanat des pelles - Professionnel -"),
     node = 'default:shovel_mese',
     desc = S("Fabrique 10 pelles en mese."),
     icon ="default_tool_diamondshovel.png",
     type = "craft",
     target = 10,
     titems = {'default:shovel_diamond'},
     tprizes = nil,
   },

   { name = 'axe_crafter_pro',
     title = S("Artisanat des haches - Professionnel -"),
     node = 'default:axe_mese',
     desc = S("Fabrique 10 haches en mese."),
     icon ="default_tool_diamondaxe.png",
     type = "craft",
     target = 10,
     titems = {'default:axe_diamond'},
     tprizes = nil,
   },

   { name = 'sword_crafter_pro',
     title = S("Artisanat des épées - Professionnel -"),
     node = 'default:sword_mese',
     desc = S("Fabrique 10 épées en mese."),
     icon ="default_tool_diamondsword.png",
     type = "craft",
     target = 10,
     titems = {'default:sword_diamond'},
     tprizes = nil,
   },

   -- Hoes
   
   { name = 'hoe_crafter_newbee',
     title = S("Agriculteur Débutant"),
     node = 'farming:hoe_wood',
     desc = S("Fabrique 10 houx en bois."),
     icon = "farming_tool_stonehoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_stone'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_lover',
     title = S("Agriculteur amateur"),
     node = 'farming:hoe_stone',
     desc = S("Fabrique 10 houx en pierre."),
     icon = "farming_tool_steelhoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_steel'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_good',
     title = S("Agriculteur confirmé"),
     node = 'farming:hoe_steel',
     desc = S("Fabrique 10 houx en fer."),
     icon = "farming_tool_bronzehoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_bronze'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_pro',
     title = S("Agriculteur professionnel"),
     node = 'farming:hoe_bronze',
     desc = S("Fabrique 10 houx en bronze."),
     icon = "farming_tool_mesehoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_mese'},
     tprizes = nil
   },
   
   { name = 'hoe_crafter_master',
     title = S("Maitre Agriculteur"),
     node = 'farming:hoe_mese',
     desc = S("Fabrique 10 houx en mese."),
     icon = "farming_tool_diamondhoe.png",
     type = "craft",
     target = 10,
     titems = {'farming:hoe_diamond'},
     tprizes = nil
   },
   
   -- Wood crafts

   { name = 'crafter_begins',
     title = S("Découverte de l'artisanat"),
     node = 'default:wood',
     desc = S("Fabrique 50 planches."),
     icon ="default_wood.png",
     type = "craft",
     target = 50,
     titems = {'default:stick', 'default:chest', 'boats:boat', 'doors:door_wood', 'doors:trapdoor'},
     tprizes = nil,
   },

   { name = 'crafter_newbee',
     title = S("Artisan débutant"),
     node = 'default:stick',
     desc = S("Fabrique 50 sticks."),
     icon ="default_stick.png",
     type = "craft",
     target = 50,
     titems = {'default:fence_wood', 'default:ladder'},
     tprizes = nil,
   },

   { name = 'crafter_lover',
     title = S("Artisan amateur"),
     node = 'default:wood',
     desc = S("Fabrique 100 planches de bois."),
     icon ="default_wood.png",
     type = "craft",
     target = 100,
     titems = {'default:sign_wall', 'default:pick_wood', 'default:shovel_wood', 'default:axe_wood', 'default:sword_wood'},
     tprizes = nil,
   },

   { name = 'crafter_good',
     title = S("Artisan confirmé"),
     node = 'default:wood',
     desc = S("Fabrique 500 planches de bois."),
     icon ="default_wood.png",
     type = "craft",
     target = 500,
     titems = {'default:chest_locked'},
     tprizes = nil,
   },

   -- Bronze crafts

   { name = 'bronze_crafter_begins',
     title = S("L'apogée du bronze"),
     node = 'default:bronze_ingot',
     desc = S("Fabrique 50 lingots de bronze."),
     icon ="default_bronze_ingot.png",
     type = "craft",
     target = 50,
     titems = {'default:bronzeblock'},
     tprizes = nil,
   },

   -- Mese crafts

   { name = 'mese_crafter_begins',
     title = S("Mese bien sur ?"),
     node = 'default:mese',
     desc = S("Fabrique 50 blocs de mese."),
     icon ="default_mese_block.png",
     type = "craft",
     target = 50,
     titems = {'default:meselamp'},
     tprizes = nil,
   },

   -- Sandstone crafts

   { name = 'sand_crafter_begins',
     title = S("Maitre du gré"),
     node = 'default:sandstone',
     desc = S("Fabrique 50 blocs gré."),
     icon ="default_sandstone.png",
     type = "craft",
     target = 50,
     titems = {'default:sandstonebrick'},
     tprizes = nil,
   },

   -- Glass crafts

   { name = 'glass_crafter_newbee',
     title = S("Soufleur de verre"),
     node = 'xpanes:glass',
     desc = S("Fabrique 40 plaques de verre."),
     icon ="vessels_glass_bottle.png",
     type = "craft",
     target = 40,
     titems = {'vessels:glass_bottle', 'vessels:drinking_glass','vessels:glass_fragments'},
     tprizes = nil,
   },

   { name = 'glass_crafter_good',
     title = S("Soufleur de verre confirmé"),
     node = 'vessels:bottle',
     desc = S("Fabrique 50 bouteilles de verre."),
     icon ="vessels_glass_bottle.png",
     type = "craft",
     target = 40,
     titems = {'vessels:shelf'},
     tprizes = nil,
   },
   
   -- Paper crafts

   { name = 'book_crafter_begins',
     title = S("Vous savez écrire"),
     node = 'default:paper',
     desc = S("Fabrique 50 feuilles de papier."),
     icon ="default_book.png",
     type = "craft",
     target = 50,
     titems = {'default:book'},
     tprizes = nil,
   },

   -- Book crafts

   { name = 'book_crafter_newbee',
     title = S("La passion du livre"),
     node = 'default:book',
     desc = S("Fabrique 10 livres."),
     icon ="default_book.png",
     type = "craft",
     target = 10,
     titems = {'default:bookshelf'},
     tprizes = nil,
   },

   -- Dyes crafts

   { name = 'like_dye_nyan',
     title = S("Toutes les couleurs"),
     node = 'dye:red',
     desc = S("Fabrique 10 colorants rouges."),
     icon = "dye_brown.png",
     type = "craft",
     target = 10,
     titems = {'dye:brown','dye:cyan', 'dye:dark_green', 'dye:dark_grey', 'dye:green', 'dye:grey', 'dye:magenta', 'dye:pink'},
     tprizes = nil
   },
   
   -- Wool crafts

   { name = 'deco_wool_newbee',
     title = S("Laine dans tous ces états"),
     node = 'wool:white',
     desc = S("Fabrique 10 pelotes de laines."),
     icon = "wool_brown.png",
     type = "craft",
     target = 10,
     titems = {'wool:white', 'wool:grey', 'wool:black', 'wool:red', 'wool:yellow', 'wool:green','wool:cyan', 'wool:blue', 'wool:magenta', 'wool:orange', 'wool:violet','wool:brown', 'wool:pink', 'wool:dark_grey', 'wool:dark_green'},
     tprizes = nil
   },
   
   -- Beds crafts

   { name = 'bed_crafter_begins',
     title = S("Un peu de repos"),
     node = 'wool:red',
     desc = S("Fabrique 10 pelotes rouges."),
     icon = "beds_bed.png",
     type = "craft",
     target = 10,
     titems = {'beds:bed_bottom'},
     tprizes = nil
   },

   { name = 'bed_crafter_newbee',
     title = S("Beaucoup de repos"),
     node = 'beds:bed',
     desc = S("Fabrique 10 lits simples."),
     icon = "beds_bed_fancy.png",
     type = "craft",
     target = 10,
     titems = {'beds:fancy_bed_bottom'},
     tprizes = nil
   },

   -- TNT crafts

   { name = 'tnt_man',
     title = S("Boum !"),
     node = 'tnt:gunpowder',
     desc = S("Fabrique 10 barils de poudre."),
     icon = "tnt_side.png",
     type = "craft",
     target = 10,
     titems = {'tnt:tnt'},
     tprizes = nil
   },

   -- Miners achievements --

   -- Stone with coal
   
   { name = 'like_dye_black',
     title = S("J'aime le noir"),
     node = 'default:stone_with_coal',
     desc = S("Récolte 10 minerais de charbon."),
     icon = "dye_black.png",
     type = "dig",
     target = 10,
     titems = {'dye:black'},
     tprizes = nil
   },
   
   { name = 'coal_miner_begins',
     title = S("Découverte du charbon"),
     node = 'default:stone_with_coal',
     desc = S("Récolte 50 blocs de minerai de charbon."),
     icon ="default_coal_block.png",
     type = "dig",
     target = 50,
     titems = {'default:coalblock', 'default:coal_lump'},
     tprizes = nil,
   },

   { name = 'coal_miner_newbee',
     title = S("Fin des ténèbres"),
     node = 'default:stone_with_coal',
     desc = S("Récolte 100 blocs de minerai de charbon."),
     icon ="default_coal_block.png",
     type = "dig",
     target = 100,
     titems = {'default:torch'},
     tprizes = nil,
   },

   -- Default Stone

   { name = 'miner_begins',
     title = S("L'age du feu"),
     node = 'default:stone',
     desc = S("Récolte 100 blocs de pierre."),
     icon ="default_stone.png",
     type = "dig",
     target = 100,
     titems = {'default:furnace'},
     tprizes = nil,
   },

   { name = 'miner_newbee',
     title = S("L'age de pierre"),
     node = 'default:stone',
     desc = S("Récolte 200 blocs de pierre."),
     icon ="default_stone.png",
     type = "dig",
     target = 200,
     titems = {'default:pick_stone', 'default:shovel_stone', 'default:axe_stone', 'default:sword_stone'},
     tprizes = nil,
   },

   -- Default Stone with Iron

   { name = 'iron_miner_begins',
     title = S("L'age du fer"),
     node = 'default:stone_with_iron',
     desc = S("Récolte 50 blocs de minerai de fer."),
     icon ="default_mineral_iron.png",
     type = "dig",
     target = 50,
     titems = {'default:steelblock', 'default:steel_ingot', 'bucket:bucket_empty', 'doors:door_steel', 'xpanes:bar','vessels:steel_bottle'},
     tprizes = nil,
   },

   { name = 'iron_miner_newbee',
     title = S("Toujours plus de fer"),
     node = 'default:stone_with_iron',
     desc = S("Récolte 100 blocs de minerai de fer."),
     icon ="default_mineral_iron.png",
     type = "dig",
     target = 100,
     titems = {'default:rail'},
     tprizes = nil,
   },

   -- Default Stone with Copper

   { name = 'copper_miner_begins',
     title = S("L'age du cuivre"),
     node = 'default:stone_with_copper',
     desc = S("Récolte 50 minerai de cuivre."),
     icon ="default_mineral_copper.png",
     type = "dig",
     target = 50,
     titems = {'default:copperblock', 'default:copper_ingot'},
     tprizes = nil,
   },

   { name = "copper_miner_newbee",
     title = S("L'age du bronze"),
     node = 'default:stone_with_copper',
     desc = S("Récolte 100 minerai de cuivre."),
     icon ="default_mineral_copper.png",
     type = "dig",
     target = 100,
     titems = {'default:bronze_ingot'},
     tprizes = nil,
   },
   
   -- Default Stone with Gold

   { name = 'gold_miner_begins',
     title = S("Chercheur d'or"),
     node = 'default:stone_with_gold',
     desc = S("Récolte 50 blocs de pierres avec minerai d'or."),
     icon ="default_mineral_gold.png",
     type = "dig",
     target = 50,
     titems = {'default:goldblock', 'default:gold_ingot'},
     tprizes = nil,
   },

   -- Default Stone with Diamond

   { name = 'diamond_miner_begins',
     title = S("Mineur des bas fonds"),
     node = 'default:stone_with_diamond',
     desc = S("Récolte 50 blocs de pierres avec des diamants."),
     icon ="default_mineral_diamond.png",
     type = "dig",
     target = 50,
     titems = {'default:diamondblock', 'default:diamond'},
     tprizes = nil,
   },

   -- Default Stone with Mese

   { name = 'mese_miner_begins',
     title = S("Chercheur de mese"),
     node = 'default:stone_with_mese',
     desc = S("Récolte 50 blocs de pierres avec du mese."),
     icon ="default_mineral_mese.png",
     type = "dig",
     target = 50,
     titems = {'default:mese_crystal_fragment', 'default:mese_crystal'},
     tprizes = nil,
   },

   -- Default Obsidian

   { name = 'obsidian_miner_begins',
     title = S("C'est dur l'obsidienne"),
     node = 'default:obsidian',
     desc = S("Récolte 50 blocs d'obsidienne."),
     icon ="default_obsidian.png",
     type = "dig",
     target = 50,
     titems = {'default:obsidian_shard', 'default:obsidian', 'doors:door_obsidian_glass'},
     tprizes = nil,
   },

   -- Default:sand

   { name = 'sand_miner_begins',
     title = S("Au gré des sables"),
     node = 'default:sand',
     desc = S("Récolte 100 blocs de sable."),
     icon ="default_sand.png",
     type = "dig",
     target = 100,
     titems = {'default:sandstone', 'default:sand'},
     tprizes = nil,
   },

   -- Default clay

   { name = 'clay_miner_begins',
     title = S("Découverte de l'argile"),
     node = 'default:clay',
     desc = S("Récolte 50 blocs d'argile."),
     icon ="default_clay.png",
     type = "dig",
     target = 50,
     titems = {'default:clay', 'default:clay_lump'},
     tprizes = nil,
   },

   -- Default Snow

   { name = 'snow_miner_begins',
     title = S("Découverte de la neige"),
     node = 'default:snow',
     desc = S("Récolte 50 blocs de neige."),
     icon ="default_snow.png",
     type = "dig",
     target = 50,
     titems = {'default:snow', 'default:snowblock'},
     tprizes = nil,
   },

   -- Default Papyrus

   { name = 'papyrus_miner_begins',
     title = S("Vos papiers !"),
     node = 'default:papyrus',
     desc = S("Récolte 50 papyrus."),
     icon ="default_papyrus.png",
     type = "dig",
     target = 50,
     titems = {'default:paper'},
     tprizes = nil,
   },

   -- Default grass_5

   { name = 'agro_straw_begins',
     title = S("Découverte du blé"),
     node = 'default:grass_5',
     desc = S("Récolte 50 touffes d'herbe mature."),
     icon = "farming_wheat.png",
     type = "dig",
     target = 50,
     titems = {'farming:hoe_wood'},
     tprizes = nil
   },

   -- Farming Wheat_8

   { name = 'agro_straw_newbee',
     title = S("Céréalier débutant"),
     node = 'farming:wheat_8',
     desc = S("Récolte 50 plants de blé bien murs."),
     icon = "farming_wheat.png",
     type = "dig",
     target = 50,
     titems = {'farming:flour'},
     tprizes = nil
   },
   { name = 'agro_straw_lover',
     title = S("Céréalier amateur"),
     node = 'farming:wheat_8',
     desc = S("Récolte 100 plants de blé bien murs."),
     icon = "farming_straw.png",
     type = "dig",
     target = 100,
     titems = {'farming:straw'},
     tprizes = nil
   },

   -- Default Junglegrass
   
   { name = 'agro_cotton_begins',
     title = S("Découverte du cotton"),
     node = 'default:junglegrass',
     desc = S("Récolte 50 touffes d'herbe de jungle."),
     icon = "farming_cotton.png",
     type = "dig",
     target = 50,
     titems = {'farming:hoe_wood'},
     tprizes = nil
   },
   
   -- Default Cotton_8

   { name = 'agro_cotton_newbee',
     title = S("La route du cotton"),
     node = 'default:cotton_8',
     desc = S("Récolte 50 plants de cottons bien murs."),
     icon = "farming_cotton.png",
     type = "dig",
     target = 50,
     titems = {'wool:white'},
     tprizes = nil
   },

   -- Flowers Rose

   { name = 'like_dye_red',
     title = S("J'aime le rouge"),
     node = 'flowers:rose',
     desc = S("Récolte 10 roses rouges."),
     icon = "dye_red.png",
     type = "dig",
     target = 10,
     titems = {'dye:red'},
     tprizes = nil
   },

   -- Floyers Tulip

   { name = 'like_dye_orange',
     title = S("J'aime le orange"),
     node = 'flowers:tulip',
     desc = S("Récolte 10 tulipes."),
     icon = "dye_orange.png",
     type = "dig",
     target = 10,
     titems = {'dye:orange'},
     tprizes = nil
   },

   -- Flowers Dandelion_yellow

   { name = 'like_dye_yellow',
     title = S("J'aime le jaune"),
     node = 'flowers:dandelion_yellow',
     desc = S("Récolte 10 dandelions jaunes."),
     icon = "dye_yellow.png",
     type = "dig",
     target = 10,
     titems = {'dye:yellow'},
     tprizes = nil
   },

   -- Flowers Geranium

   { name = 'like_dye_blue',
     title = S("J'aime le bleue"),
     node = 'flowers:geranium',
     desc = S("Récolte 10 géraniums bleues."),
     icon = "dye_blue.png",
     type = "dig",
     target = 10,
     titems = {'dye:blue'},
     tprizes = nil
   },

   -- Flowers Viola

   { name = 'like_dye_violet',
     title = S("J'aime le violet"),
     node = 'flowers:viola',
     desc = S("Récolte 10 violettes."),
     icon = "dye_violet.png",
     type = "dig",
     target = 10,
     titems = {'dye:violet'},
     tprizes = nil
   },

   -- Flowers Dandelion_white

   { name = 'like_dye_white',
     title = S("J'aime le blanc"),
     node = 'flowers:dandelion_white',
     desc = S("Récolte 10 dandelions blancs."),
     icon = "dye_white.png",
     type = "dig",
     target = 10,
     titems = {'dye:white'},
     tprizes = nil
   },
   
   -- Default Gravel

   { name = 'gravel_digger_begins',
     title = S("Poudre noire"),
     node = 'default:gravel',
     desc = S("Récolte 100 blocs de graviers."),
     icon = "tnt_gunpowder_inventory.png",
     type = "dig",
     target = 100,
     titems = {'tnt:gunpowder'},
     tprizes = nil
   },

   -- Builders achievements --

   -- Default Wood

   { name = 'wood_builder_begins',
     title = S("Architecture - Découverte"),
     node = 'default:wood',
     desc = S("Place 50 Planches de Bois."),
     icon = "default_wood.png",
     type = "place",
     target = 50,
     titems = {'stairs:slab_wood','stairs:stair_wood'},
     tprizes = nil
   },

   -- Default cobblestone

   { name = 'stone_builder_begins',
     title = S("Batisseur en herbe"),
     node = 'default:cobblestone',
     desc = S("Place 50 blocs de cailloux."),
     icon ="default_cobble.png",
     type = "place",
     target = 50,
     titems = {'default:stonebrick', 'stairs:slab_cobble', 'stairs:stair_cobble'},
     tprizes = nil,
   },

   -- Default stonebrick

   { name = 'stone_builder_newbee',
     title = S("Batisseur Débutant"),
     node = 'default:stonebrick',
     desc = S("Place 50 briques de pierres."),
     icon ="default_stone_brick.png",
     type = "place",
     target = 50,
     titems = {'screwdriver:screwdriver', 'stairs:slab_stonebrick', 'stairs:stair_stonebrick', 'stairs:slab_acacia_wood','stairs:slab_brick', 'stairs:slab_bronzeblock', 'stairs:slab_copperblock',  'stairs:slab_desert_stone', 'stairs:slab_desert_stonebrick', 'stairs:slab_:goldblock', 'stairs:slab_junglewood', 'stairs:slab_pine_wood', 'stairs:slab_sandstone', 'stairs:slab_sandstonebrick', 'stairs:slab_steelblock', 'stairs:slab_stone', 'stairs:slab_straw', 'stairs:stair_acacia_wood','stairs:stair_brick', 'stairs:stair_bronzeblock', 'stairs:stair_copperblock', 'stairs:stair_desert_stone', 'stairs:stair_desert_stonebrick', 'stairs:stair_goldblock', 'stairs:stair_junglewood', 'stairs:stair_pine_wood', 'stairs:stair_sandstone', 'stairs:stair_sandstonebrick', 'stairs:stair_steelblock', 'stairs:stair_stone', 'stairs:stair_straw'},
     tprizes = nil,
   },

   -- Default desert stone

   { name = 'desertstone_builder_begins',
     title = S("Batisseur du désert en herbe"),
     node = 'default:desert_stone',
     desc = S("Place 50 blocs de pierre du désert."),
     icon ="default_desert_stone.png",
     type = "place",
     target = 50,
     titems = {'default:desert_stonebrick', 'stairs:slab_desert_cobble', 'stairs:stair_desert_cobble'},
     tprizes = nil,
   },

   -- Default Obsidian

   { name = 'obsidian_builder_begins',
     title = S("Batisseur d'obsidienne"),
     node = 'default:obsidian',
     desc = S("Place 50 blocs d'obsidienne."),
     icon ="default_obsidian.png",
     type = "place",
     target = 50,
     titems = {'default:obsidianbrick', 'stairs:stair_obsidian', 'stairs:slab_obsidian', 'stairs:slab_obsidianbrick', 'stairs:stair_obsidianbrick' },
     tprizes = nil,
   },

   -- Default Glass

   { name = 'glass_builder_begins',
     title = S("Apprendre le verre"),
     node = 'default:glass',
     desc = S("Place 20 blocs de verre."),
     icon ="default_glass.png",
     type = "place",
     target = 20,
     titems = {'doors:door_glass', 'xpanes:pane'},
     tprizes = nil,
   },

   -- Default Clay

   { name = 'clay_builder_begins',
     title = S("Terre cuite - Découverte -"),
     node = 'default:clay',
     desc = S("Place 50 blocs d'argile."),
     icon ="default_clay.png",
     type = "place",
     target = 50,
     titems = {'default:brick', 'default:clay_brick'},
     tprizes = nil,
   },

}  

-- Secrets achievements table
local sa = {
   { name = 'secret_stuf',
     title = S("Pas que des déchets"),
     node = 'sys4_achievements:waste',
     desc = S("Récolte 10 blocs de déchets."),
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
	 book = { title = "SYS4 AWARDS : "..sa[i].title,
		  text = sys4_achievements.write_book(sa[i].titems, sa[i].tprizes)
	 },
	 secret = 1
      })
end
   
