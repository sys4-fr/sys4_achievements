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
   
   -- Miner achievements (dig) --
   
   -- Trees
   { name = 'tree_digger_begins',
     title = S("My first Tool"),
     node = 'default:tree',
     desc = S("Dig 10 tree blocks."),
     icon = "default_tool_woodaxe.png",
     type = "dig",
     target = 10,
     titems = {'default:wood', 'default:acacia_wood', 'default:junglewood', 'default:pine_wood', 'default:stick', 'default:axe_wood'},
     tprizes = {'default:torch'},
     tbook = S("En coupant du bois, vous vous apercevez qu'à ce rythme la nuit va arriver bien plus vite que prévue. Cela vous décide à faire une hache en bois pour essayer d'accelérer les choses. En outre, voici une torche au cas où."),
   },   

   { name = 'tree_digger_newbee',
     title = S("Wooden Tools and Items"),
     node = 'default:tree',
     desc = S("Dig 20 tree blocks."),
     icon = "default_tool_woodpick.png",
     type = "dig",
     target = 20,
     titems = {'default:pick_wood', 'default:sword_wood', 'default:shovel_wood', 'farming:hoe_wood', 'doors:door_wood', 'doors:trapdoor', 'default:ladder', 'default:fence_wood', 'boats:boat', 'default:chest'},
     tprizes = nil,
     tbook = S("Vous disposez d'assez de bois pour construire votre premier abris. Cela vous a permis de réfléchir à l'élaboration de nouveaux objets qui pourraient vous etres utiles. Dépêchez-vous, la nuit est proche."),
     award_req = 'tree_digger_begins'
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
	 sys4_achievements.getAchievement("dig", "tree_digger_newbee"),
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
      }

      for i=1, #achievements do
	 local achievement = achievements[i]
	 local name = achievement.award

	 if not sys4_achievements.has_achievement(playern, name) then
	    local node = achievement.node
	    local target = achievement.target
	    local mod = ""
	    local items = {}

	    local count = sys4_achievements.getItemCount("craft", mod, items, playern, data)
	    
	    if count > target - 1 then
	       return name
	    end
	 end
      end
   end)
