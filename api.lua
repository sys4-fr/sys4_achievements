-- SYS4 Achievements
-- by Sys4

-- api.lua file
-- this file contains my custom functions

if not awards then
   return
end

sys4_achievements = {}

-- Init
local S
if minetest.get_modpath("intllib") then
  S = intllib.Getter()
else
  S = function(s) return s end
end
sys4_achievements.intllib = S

-- New Waste Node
minetest.register_node("sys4_achievements:waste",
{
   description = S("Waste"),
   tiles = {"waste.png"},
   is_ground_content = false,
   groups = {crumbly=2, flammable=2},
})

-- Functions for get and set craftmode
-- When craftmode is enabled, crafts are locked by defaults.
-- Players have to unlock achievements for unlock locked crafts.
function sys4_achievements.getCraftMode()
   local craftmode
   craftmode = minetest.setting_getbool("sys4_craftmode")
   if craftmode == nil then
      craftmode = false
   end

   return craftmode
end

function sys4_achievements.setCraftMode(craftmode)
   local param = "false"
   if craftmode then
      param = "true"
   end
   minetest.setting_set("sys4_craftmode", param)
   minetest.setting_save()
end

-- Functions for set and get Level of difficulty
-- This functions take sense when craftmode is enabled
function sys4_achievements.getLevel()
   local lvl = nil
   lvl = tonumber(minetest.setting_get("sys4_level"))
   if lvl == nil or lvl < 1 then 
      return 1
   end
   
   return lvl
end

function sys4_achievements.setLevel(level)
   minetest.setting_set("sys4_level", level)
   minetest.setting_save()
end

-- Function that format text written in given books
function sys4_achievements.write_book(book_content, items, prizes)
   local text = ""
   
   if book_content and book_content ~= nil then
      text = text..book_content.."\n\n"
   end
   
   if prizes and prizes ~= nil then
      text = text..S("Amazing ! You win").." :\n"
      
      local tt = ""
      for i=1, #prizes do
	 local itemstack = ItemStack(prizes[i])
	 tt = tt..itemstack:get_count().." "..S(itemstack:get_name()).."\n"
      end
      text = text..tt.."\n"
   end
   
   if items and items ~= nil and sys4_achievements.getCraftMode() then
      text = text..S("You unlock these crafts").." :"
      
      local tt = "\n"
      for i=1, #items do
	 tt = tt.."\n"..sys4_achievements.getCraftRecipes(items[i])
	 tt = tt..S("Output").." --> "..S(items[i]).."\n\n"
	 tt = tt.."------------]]][[[------------\n"
      end
      text = text..tt.."\n"
   end

   return text
end

-- Function for display craft recipes in given books
function sys4_achievements.getCraftRecipes(itemName)
   local str = ""
   if itemName ~= nil and itemName ~= "" then
      local craftRecipes = minetest.get_all_craft_recipes(itemName)

      if craftRecipes ~= nil then
	 local first = true
	 for i=1, #craftRecipes do
	    if craftRecipes[i].type == "normal" then
	       if not first then
		  str = str.."\n---]] "..S("OR").." [[---\n\n"
	       end
	       
	       first = false
	       local width = craftRecipes[i].width
	       local items = craftRecipes[i].items
	       local maxn = table.maxn(items)
	       local h = 0
	       local g
	       if width == 0 then
		  g = 1
		  while g*g < maxn do g = g + 1 end
		  width = maxn
	       else
		  h = math.ceil(maxn / width)
		  g = width < h and h or width
	       end
	       
	       for y=1, g do
		  str = str..y..": "
		  for x=1, width do
		     local item = items[(y-1) * width + x]
		     if item ~= nil then
			str = str.."'"..S(item).."' "
		     else
			str = str.."'"..S("empty").."' "
		     end
		     if x == width then
			str = str.."\n"
		     end
		  end
	       end
	    end
	 end
      end
   else
      str = S("No craft for this item").."\n"
   end
   return str
end

-- Function that return an achievement by type and name
function sys4_achievements.getAchievement(onType, name)
   local registeredAchievements

   if onType == "dig" then
      registeredAchievements = awards.onDig
   end

   if onType == "place" then
      registeredAchievements = awards.onPlace
   end

   if onType == "craft" then
      registeredAchievements = awards.onCraft
   end
   
   for i=1, #registeredAchievements do
      if type(registeredAchievements[i]) == "table" and 
      registeredAchievements[i].award == name then
	 return registeredAchievements[i]
      end
   end
end

-- Function that determine if player has or not unlocked achievement and return a boolean.
function sys4_achievements.has_achievement(name, award)
   local data = awards.players[name]
   
   if not data then
      return
   end
   
   if not awards.def[award] then
      return
   end
   
   awards.tbv(data, "unlocked")
   
   if data.unlocked[award] and data.unlocked[award] == award then
      return true
   else
      return false
   end
end

-- Function that return the number of crafted, placed or digged items by the player
function sys4_achievements.getItemCount(action_type, mod, items, playern, data)
   local count = 0
   if action_type == "craft" then
      awards.tbv(awards.players[playern].craft, mod)
      for i=1, #items do
	 awards.tbv(awards.players[playern].craft[mod], items[i], 0)
	 count = count + data.craft[mod][items[i]]
      end
   elseif action_type == "dig" then
      awards.tbv(awards.players[playern].count, mod)
      for i=1, #items do
	 awards.tbv(awards.players[playern].count[mod], items[i], 0)
	 count = count + data.count[mod][items[i]]
      end
   elseif action_type == "place" then
      awards.tbv(awards.players[playern].place, mod)
      for i=1, #items do
	 awards.tbv(awards.players[playern].place[mod], items[i], 0)
	 count = count + data.place[mod][items[i]]
      end
   else
      return
   end

   return count
end

-- Function that determine if achievement is got or not from an awards list
function sys4_achievements.isAwardGot(awardName, listofawards)
   for _,award in pairs(listofawards) do
      if awardName == award.name and award.got then
	 return true
      end
   end
   return false
end

-- Fonction qui se déclenche quand le joueur place un objet dans son environnement.
-- Cette fonction est normalement déjà définie dans 'awards' : minetest.register_on_place = func(...)
-- Mais elle ne se déclenche pas pour certains objets comme les troncs d'arbres.
-- Ces types d'objets possèdent une propriété on_place = minetest.rotate_node 
-- qu'il faut redéfinir par cette fonction pour nos besoins.
function sys4_achievements.register_on_place(itemstack, placer, pointed_thing)

   if not placer or not pointed_thing or not itemstack or not placer:get_player_name() or placer:get_player_name()=="" then
      return
   end

   
   -- Code pour le systeme awards
   local nodedug = string.split(itemstack:get_name(), ":")
   if #nodedug ~= 2 then
      --minetest.log("error","Awards mod: "..node.name.." is in wrong format!")
      return
   end
   local mod=nodedug[1]
   local item=nodedug[2]
   local playern = placer:get_player_name()
   
   -- Run checks
   if (not playern or not nodedug or not mod or not item) then
      return
   end
   awards.assertPlayer(playern)
   awards.tbv(awards.players[playern].place, mod)
   awards.tbv(awards.players[playern].place[mod], item, 0)
   
   -- Increment counter
   awards.players[playern].place[mod][item] = awards.players[playern].place[mod][item] + 1
   
   -- Run callbacks and triggers
   local player = placer
   local data = awards.players[playern]
   for i=1,# awards.onPlace do
      local res = nil
      if type(awards.onPlace[i]) == "function" then
	 -- Run trigger callback
	 res = awards.onPlace[i](player,data)
      elseif type(awards.onPlace[i]) == "table" then
	 -- Handle table trigger
	 if not awards.onPlace[i].node or not awards.onPlace[i].target or not awards.onPlace[i].award then
	    print("[ERROR] awards - onPlace trigger "..i.." is invalid!")
	 else
	    -- run the table
	    local tnodedug = string.split(awards.onPlace[i].node, ":")
	    local tmod = tnodedug[1]
	    local titem = tnodedug[2]
	    if tmod==nil or titem==nil or not data.place[tmod] or not data.place[tmod][titem] then
	       -- table running failed!
	    elseif data.place[tmod][titem] > awards.onPlace[i].target-1 then
	       res = awards.onPlace[i].award
	    end
	 end
      end
      
      if res then
	 awards.give_achievement(playern,res)
      end
   end
  
   -- Meme portion de code que dans la fonction core.rotate_node
   core.rotate_and_place(itemstack, placer, pointed_thing,
			 core.setting_getbool("creative_mode"),
			 {invert_wall = placer:get_player_control().sneak})
   return itemstack   
end


-- function that format a text displayed in formspec.
function sys4_achievements.formatShowto(text)
   if text ~= nil and text ~= "" then   
      local maxw = 45 -- Max length for a displayed string in form.

      local words = string.split(text, " ")
      local tt = ""

      -- Placer un retour à la ligne de chaque fin de ligne de longueur maxw
      local len = 0
      for i=1, #words do
	 len = len + string.len(words[i]) + 1
	 
	 if len - 1 > maxw then
	    tt = tt.."\n"..words[i].." "
	    len = string.len(words[i]) + 1
	 else
	    tt = tt..words[i].." "
	 end
      end

      return tt
   end

   return ""
end

-- Awards func redefinition
dofile(minetest.get_modpath("sys4_achievements").."/awards.lua")
-- New triggers
dofile(minetest.get_modpath("sys4_achievements").."/triggers.lua")
-- Chat commands
dofile(minetest.get_modpath("sys4_achievements").."/console.lua")

-- Redéfinition de la propriété on_place de ces nodes
local nodes = {
   minetest.registered_nodes["default:tree"],
   minetest.registered_nodes["default:jungletree"],
   minetest.registered_nodes["default:acacia_tree"],
   minetest.registered_nodes["default:pine_tree"],
}

for i=1, #nodes do
   nodes[i].on_place = sys4_achievements.register_on_place
end
