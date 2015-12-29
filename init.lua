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

local lvl = 1 -- Level Of difficulty

-- Achievements table définition
local a = {
   
   -- Miner achievements (dig) --
   
   -- Trees
   { name = 'tree_digger_begins',
     title = S("Wood Cutting"),
     node = 'default:tree',
     desc = S("Dig ")..(1*lvl) .." "..S("default:tree")..".",
     icon = "default_tree.png",
     type = "dig",
     target = 1 * lvl,
     titems = {'default:wood', 'default:acacia_wood', 'default:junglewood', 'default:pine_wood'},
     tprizes = nil,
     tbook = S("Frappez du bois jusqu'à obtenir un tronc d'arbre. Vous pourrez alors fabriquer vos premières planches."),
   },   

   { name = 'wood_crafter_begins',
     title = S("Wooden Tools and Items"),
     node = 'default:wood',
     desc = S("Craft ")..(4 * lvl).." "..S("default:wood")..".",
     icon = "default_wood.png",
     type = "craft",
     target = 4 * lvl,
     titems = {'default:stick', 'default:pick_wood', 'default:sword_wood', 'default:shovel_wood', 'farming:hoe_wood', 'doors:door_wood', 'doors:trapdoor', 'default:ladder', 'default:fence_wood', 'boats:boat', 'default:chest'},
     tprizes = nil,
     tbook = S("Fabriquez des planches pour obtenir du matériel et vos premiers outils."),
     award_req = 'tree_digger_begins'
   },   

   { name = 'pick_crafter_begins',
     title = S("Belle Pioche !"),
     node = 'default:pick_wood',
     desc = S("Craft ")..(1 * lvl).." "..S("default:pick_wood")..".",
     icon = "default_tool_woodpick.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabriquez une pioche en Bois. Vous pourrez miner de la roche et du minerai de charbon."),
     award_req = 'wood_crafter_begins'
   },   

   { name = 'hoe_crafter_begins',
     title = S("À la Ferme"),
     node = 'farming:hoe_wood',
     desc = S("Craft ")..(1 * lvl).." "..S("farming:hoe_wood")..".",
     icon = "farming_tool_woodhoe.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabriquez une Houe en Bois. Vous pourrez travailler la terre et planter du coton et du blé."),
     award_req = 'wood_crafter_begins'
   },   

   { name = 'stone_crafter_begins',
     title = S("Au Four !"),
     node = 'default:furnace',
     desc = S("Craft ")..(1 * lvl).." "..S("default:furnace")..".",
     icon = "default_furnace_front.png",
     type = "craft",
     target = 1 * lvl,
     titems = nil,
     tprizes = nil,
     tbook = S("Fabriquez un four. Vous pourrez fondre du minerai en lingots et faire de la cuisine."),
     award_req = 'stone_miner_begins'
   },   

   { name = 'stone_miner_begins',
     title = S("Soyez Stone"),
     node = 'default:stone',
     desc = S("Dig ")..(1 * lvl).." "..S("default:stone")..".",
     icon = "default_cobble.png",
     type = "dig",
     target = 1 * lvl,
     titems = {'default:furnace', 'default:pick_stone', 'default:sword_stone', 'default:axe_stone', 'default:shovel_stone', 'farming:hoe_stone'},
     tprizes = nil,
     tbook = S("Minez de la roche. Un nouveau matériau plus durable que le bois."),
     award_req = 'pick_crafter_begins'
   },   

   { name = 'coal_miner_begins',
     title = S("Au charbon !"),
     node = 'default:stone_with_coal',
     desc = S("Dig ")..(1 * lvl).." "..S("default:stone_with_coal")..".",
     icon = "default_coal.png",
     type = "dig",
     target = 1 * lvl,
     titems = {'default:torch', 'dye:black'},
     tprizes = nil,
     tbook = S("Minez du minerai de charbon. Vous pourrez l'utiliser pour faire des torches, servir de carburant pour le four ou bien faire de la teinture noire."),
     award_req = 'pick_crafter_begins'
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
   if a[i].tbook and a[i].tbook ~= nil then
      tbook = {title = "SYS4 AWARDS : "..a[i].title,
	       text = sys4_achievements.write_book(a[i].tbook, a[i].titems, a[i].tprizes)
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
	 secret = 1
      })
end
   

-- Register Specialized steps with some achievements
awards.register_onDig(
   function(player, data)
      local playern = player:get_player_name()

      local achievements = {
	 sys4_achievements.getAchievement("dig", "tree_digger_begins"),
	 sys4_achievements.getAchievement("dig", "stone_miner_begins"),
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
	 sys4_achievements.getAchievement("dig", "wood_crafter_begins")
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
