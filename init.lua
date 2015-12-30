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

-- Add translations for awards from Rubenwardy and Calinou
for _,award in pairs(awards.def) do
   award.title = S(award.title)
   award.description = S(award.description)
end

-- Add 'award_req' property for some original awards from Rubenwardy and Calinou
awards.def['award_on_the_way'].award_req = 'pick_crafter_lover'
awards.def['award_youre_a_copper'].award_req = 'pick_crafter_lover'
awards.def['award_mine2'].award_req = 'pick_crafter'
awards.def['award_mine3'].award_req = 'pick_crafter'
awards.def['award_mine4'].award_req = 'pick_crafter'
awards.def['award_lightitup'].award_req = 'pick_crafter'
awards.def['award_light_all_the_things'].award_req = 'pick_crafter'
awards.def['award_obsessed_with_obsidian'].award_req = 'pick_crafter_pro'
awards.def['award_nyanfind'].award_req = 'pick_crafter_lover'
awards.def['award_mesefind'].award_req = 'pick_crafter_pro'
awards.def['award_youre_winner'].award_req = 'pick_crafter'

local lvl = 1 -- Level Of difficulty

-- Achievements table définition
local a = {
   
   -- Miner achievements (dig) --
   
   -- Trees
   { name = 'tree_digger',
     title = S("Trouvons du bois"),
     node = 'default:tree',
     desc = S("Dig ")..(1*lvl) .." "..S("default:tree")..".",
     icon = "default_tree.png",
     type = "dig",
     target = 1 * lvl,
     titems = {'default:wood', 'default:acacia_wood', 'default:junglewood', 'default:pine_wood'},
     tprizes = nil,
     tbook = S("Frappez du bois jusqu'à obtenir un tronc d'arbre. Vous pourrez alors fabriquer vos premières planches."),
   },   

   { name = 'wood_crafter',
     title = S("Faire des planches..."),
     node = 'default:wood',
     desc = S("Craft ")..(4 * lvl).." "..S("default:wood")..".",
     icon = "default_wood.png",
     type = "craft",
     target = 4 * lvl,
     titems = {'default:stick', 'doors:door_wood', 'doors:trapdoor', 'boats:boat', 'default:chest'},
     tprizes = nil,
     tbook = S("Fabriquez des planches pour obtenir du matériel."),
     award_req = 'tree_digger'
   },   

   { name = 'tools_crafter',
     title = S("...et des bâtons"),
     node = 'default:stick',
     desc = S("Craft ")..(4 * lvl).." "..S("default:stick")..".",
     icon = "default_stick.png",
     type = "craft",
     target = 4 * lvl,
     titems = {'default:pick_wood', 'default:sword_wood', 'default:shovel_wood', 'farming:hoe_wood', 'default:ladder', 'default:fence_wood', 'default:sign_wall'},
     tprizes = nil,
     tbook = S("Fabriquez des Bâtons pour obtenir vos premiers outils."),
     award_req = 'wood_crafter'
   },   

   { name = 'pick_crafter',
     title = S("Bonne Pioche !"),
     node = 'default:pick_wood',
     desc = S("Craft ")..(1 * lvl).." "..S("default:pick_wood")..".",
     icon = "default_tool_woodpick.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabriquez une pioche en Bois. Vous pourrez miner de la roche et du minerai de charbon."),
     award_req = 'tools_crafter'
   },   

   { name = 'hoe_crafter',
     title = S("Agriculteur"),
     node = 'farming:hoe_wood',
     desc = S("Craft ")..(1 * lvl).." "..S("farming:hoe_wood")..".",
     icon = "farming_tool_woodhoe.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabrique une houe en bois. Vous pourrez travailler pour planter des graines trouvées au hasard de vos pérégrinations."),
     award_req = 'tools_crafter'
   },

   { name = 'stone_miner',
     title = S("Le monde est stone"),
     node = 'default:stone',
     desc = S("Dig ")..(1 * lvl).." "..S("default:stone")..".",
     icon = "default_cobble.png",
     type = "dig",
     target = 1 * lvl,
     titems = {'default:furnace', 'default:pick_stone', 'default:sword_stone', 'default:axe_stone', 'default:shovel_stone', 'farming:hoe_stone'},
     tprizes = nil,
     tbook = S("Minez de la roche. Un nouveau matériau plus durable que le bois."),
     award_req = 'pick_crafter'
   },   

   { name = 'coal_miner',
     title = S("Au charbon !"),
     node = 'default:stone_with_coal',
     desc = S("Dig ")..(1 * lvl).." "..S("default:stone_with_coal")..".",
     icon = "default_coal_lump.png",
     type = "dig",
     target = 1 * lvl,
     titems = {'default:torch', 'dye:black', 'default:coalblock'},
     tprizes = nil,
     tbook = S("Minez du minerai de charbon. Vous pourrez l'utiliser pour faire des torches, servir de carburant pour le four ou bien faire de la teinture noire."),
     award_req = 'pick_crafter'
   },   

   { name = 'furnace_crafter',
     title = S("Au Four !"),
     node = 'default:furnace',
     desc = S("Craft ")..(1 * lvl).." "..S("default:furnace")..".",
     icon = "default_furnace_front.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabriquez un four. Vous pourrez fondre du minerai en lingots, faire cuire des matériaux et de la nourriture."),
     award_req = 'stone_miner'
   },   

   { name = 'pick_crafter_lover',
     title = S("Meilleure Pioche !"),
     node = 'default:pick_stone',
     desc = S("Craft ")..(1 * lvl).." "..S("default:pick_stone")..".",
     icon = "default_tool_stonepick.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Obtenez un pioche de meilleure qualité et plus durable. Vous pourrez miner des métaux."),
     award_req = 'stone_miner'
   },   
 
   { name = 'stone_crafter',
     title = S("Du solide !"),
     node = 'default:stonebrick',
     desc = S("Craft ")..(4 * lvl).." "..S("default:stonebrick")..".",
     icon = "default_stone_brick.png",
     type = "craft",
     target = 4 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Faites des briques de roche. Vous améliorerai ainsi vos constructions."),
     award_req = 'furnace_crafter'
   },

   { name = 'iron_miner',
     title = S("Âge du Fer"),
     node = 'default:stone_with_iron',
     desc = S("Dig ")..(1 * lvl).." "..S("default:stone_with_iron")..".",
     icon = "default_steel_ingot.png",
     type = "dig",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Récoltez du minerai de fer et faites-le fondre dans le four pour obtenir des lingots d'acier. Vous obtiendrez des outils et des matériaux très durables."),
     award_req = 'pick_crafter_lover'
   },

   { name = 'pick_crafter_pro',
     title = S("Mineur accomplie"),
     node = 'default:pick_steel',
     desc = S("Craft ")..(1 * lvl).." "..S("default:pick_steel")..".",
     icon = "default_tool_steelpick.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabriquez une pioche en acier. Avec celle-ci, pas un bloc ne vous resistera. Pratique pour les pierres précieuses comme le Diamant."),
     award_req = 'iron_miner'
   },

   { name = 'copper_miner',
     title = S("Âge du Cuivre"),
     node = 'default:stone_with_copper',
     desc = S("Dig ")..(1 * lvl).." "..S("default:stone_with_copper")..".",
     icon = "default_copper_ingot.png",
     type = "dig",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Trouve et mine du minerai de cuivre. Le Bronze est à votre portée."),
     award_req = 'pick_crafter_lover'
   },

   { name = 'bronze_crafter',
     title = S("Âge du Bronze"),
     node = 'default:bronze_ingot',
     desc = S("Craft ")..(1 * lvl).." "..S("default:bronze_ingot")..".",
     icon = "default_bronze_ingot.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Le bronze est un alliage exceptionnel. Vos outils fabriqués avec ce métal s'useront beaucoup moins vite que ceux en acier."),
     award_req = 'copper_miner'
   },
   
   { name = 'wheat_digger',
     title = S("La récolte"),
     node = 'farming:wheat_8',
     desc = S("Dig ")..(3* lvl).." "..S("farming:wheat")..".",
     icon = "farming_wheat.png",
     type = "dig",
     target = 3 * lvl,
     titems = {'farming:flour', 'farming:straw'},
     tprizes = nil,
     tbook = S("Récolte du Blé. Vous pourrez en faire de la farine."),
     award_req = 'hoe_crafter'
   },   

   { name = 'straw_crafter',
     title = S("Dans la paille"),
     node = 'farming:straw',
     desc = S("Craft ")..(1* lvl).." "..S("farming:straw")..".",
     icon = "farming_straw.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Faites des bottes de paille. À la fois pratique pour stocker du blé et pratique comme matériau de construction."),
     award_req = 'wheat_digger'
   },   

   { name = 'cooker_begins',
     title = S("À TABLE !"),
     node = 'farming:flour',
     desc = S("Craft ")..(1* lvl).." "..S("farming:flour")..".",
     icon = "farming_bread.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabrique de la farine. La cuire au four et du bon pain bien chaud tu obtiendra !"),
     award_req = 'wheat_digger'
   },   

   { name = 'cotton_digger',
     title = S("La route du coton"),
     node = 'farming:cotton_8',
     desc = S("Dig ")..(2* lvl).." "..S("farming:cotton")..".",
     icon = "farming_cotton.png",
     type = "dig",
     target = 3 * lvl,
     titems = {'wool:white'},
     tprizes = nil,
     tbook = S("Récolte du Coton. C'est la voie à suivre si tu veux tricoter."),
     award_req = 'hoe_crafter'
   },   

   { name = 'wool_crafter',
     title = S("De fil en aiguille"),
     node = 'wool:white',
     desc = S("Craft ")..(1* lvl).." "..S("wool:white")..".",
     icon = "wool_white.png",
     type = "craft",
     target = 1 * lvl,
     titems = {'wool:white'},
     tprizes = nil,
     tbook = S("Fabrique de la laine à partir du coton. Ambience feutrée garantie."),
     award_req = 'cotton_digger'
   },   

   { name = 'bed_crafter',
     title = S("Je vais me coucher"),
     node = 'beds:bed_bottom',
     desc = S("Craft ")..(1* lvl).." "..S("beds:bed_bottom")..".",
     icon = "beds_bed.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabrique un lit. Bonne nuit les petits !"),
     award_req = 'wool_crafter'
   },   

   { name = 'vessel_crafter',
     title = S("Souffleur de Verre"),
     node = 'vessels:drinking_glass',
     desc = S("Craft ")..(1* lvl).." "..S("group:vessels")..".",
     icon = "vessels_glass_bottle.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabrique un récipient en verre. Attention à la casse !"),
     award_req = 'furnace_crafter'
   },   

   { name = 'vessel_crafter_2',
     title = S("Dans quelle étagère ?"),
     node = 'vessels:shelf',
     desc = S("Craft ")..(1* lvl).." "..S("vessels:shelf")..".",
     icon = "vessels_shelf.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabrique une étagère pour ranger la vaiselle. Un peu d'organisation voyons !"),
     award_req = 'vessel_crafter'
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
     tprizes = {'default:axe_diamond', 'default:pick_diamond', 'default:shovel_diamond', 'default:sword_diamond', 'farming:hoe_diamond', 'default:furnace', 'default:chest', 'default:meselamp'},
     tbook = S("Vous ne vous avouez pas vaincu si facilement !\nCes objets sont pour vous afin de récompenser votre acharnement.")
   }
}
    
-- Register achievements from tables
for i=1, #a do
   local tbook = nil
   if a[i].tbook and a[i].tbook ~= nil then
      tbook = {title = "SYS4 AWARDS : "..a[i].title,
	       text = sys4_achievements.write_book(a[i].tbook, a[i].titems, a[i].tprizes)
      }
   end
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
   
awards.register_onDig(
   function(player, data)
      local playern = player:get_player_name()

      local achievements = {
	 sys4_achievements.getAchievement("dig", "tree_digger"),
	 sys4_achievements.getAchievement("dig", "stone_miner"),
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
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 local name = achievement.award

	 if not sys4_achievements.has_achievement(playern, name) then
	    local node = achievement.node
	    local target = achievement.target
	    local mod = ""
	    local items = {}

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
	 sys4_achievements.getAchievement("craft", "wood_crafter")
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
	       mod = 'default'
	       items = {'wood', 'junglewood', 'pine_wood', 'acacia_wood'}
	    end

	    local count = sys4_achievements.getItemCount("craft", mod, items, playern, data)
	    
	    if count > target - 1 then
	       return name
	    end
	 end
      end
   end)
