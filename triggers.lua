-- Give initial Stuff if craftmode enabled
--[[minetest.register_on_newplayer(
   function(player)
      if craftmode then
	 minetest.log("action", "Giving initial stuff to player "..player:get_player_name())
	 local book = ItemStack("default:book_written")
	 local data = {}
	 data.title = "SYS4 AWARDS : Introduction"
	 data.text = "Bonjour "..player:get_player_name().." et bienvenue dans Minetest.\n\n"
	    .."Vous débarquez dans ce monde avec vos seules mains comme outils et la nuit arrive à grand pas. Vous vous sentez perdu mais une chose est sure. Il faut vous fabriquer des outils et des matériaux pour pouvoir construire votre premier abris afin d'y passer la nuit.\n\n"
	    .."Comme premier objectif, trouvez du bois."
	 data.owner = player:get_player_name()
	 local data_str = minetest.serialize(data)
	 book:set_metadata(data_str)
	 
	 local inv = minetest.get_inventory({type="player", name=player:get_player_name()})
	 inv:add_item("main", book)
      end
   end)
--]]

-- Register new trigger on "craft"
minetest.register_on_craft(
   function(itemstack, player, old_craft_grid, craft_inv)
      
	 
      -- Par défaut tout craft qui doit donner quelque chose retournera des déchets inutilisables.
      local wasteItem = "sys4_achievements:waste"
      
      local nodeName = itemstack:get_name()
      local nodeCrafted = string.split(nodeName, ":")
      if #nodeCrafted ~= 2 then
	 --minetest.log("error","Awards mod: "..oldnode.name.." is in wrong format!")
	 return
      end
      
      local mod = nodeCrafted[1]
      local item = nodeCrafted[2]
      local playern = player:get_player_name()
      
      if (not playern or not nodeCrafted or not mod or not item) then
	 return
      end
      awards.assertPlayer(playern)
      awards.tbv(awards.players[playern].craft, mod)
      awards.tbv(awards.players[playern].craft[mod], item, 0)
      
      -- Si des awards ont été débloqués, ont les parcours pour en extraire les items qu'ils débloquent
      if awards.player(playern) ~= nil then
	 local data = awards.players[playern]
	 for _, str in pairs(data.unlocked) do
	    local def = awards.def[str]
	    if def and def.items then
	       local items = def.items
	       for i=1, #items do
		  -- Si un item débloqué correspond à l'item demandé par l'utilisateur alors on le prend en compte et on retournera l'item (en retournant nil)
		  if items[i] == nodeName then
		     -- Increment counter
		     awards.players[playern].craft[mod][item] = awards.players[playern].craft[mod][item] + itemstack:get_count()
		     
		     -- Run callbacks and triggers
		     local crafter = player
		     
		     for j=1, #awards.onCraft do
			local res = nil
			if type(awards.onCraft[j]) == "function" then
			   -- Run trigger callback
			   res = awards.onCraft[j](crafter, data)
			elseif type(awards.onCraft[j]) == "table" then
			   -- Handle table trigger
			   if not awards.onCraft[j].node or not awards.onCraft[j].target or not awards.onCraft[j].award then
			      -- table running failed !
			      print("[ERROR] awards - onCraft trigger "..j.." is invalid !")
			   else
			      -- run the table
			      local tnodeCrafted = string.split(awards.onCraft[j].node, ":")
			      local tmod = tnodeCrafted[1]
			      local titem = tnodeCrafted[2]
			      if tmod == nil or titem == nil or not data.craft[tmod] or not data.craft[tmod][titem] then
				 -- table running failed
			      elseif data.craft[tmod][titem] > awards.onCraft[j].target - 1 then
				 res = awards.onCraft[j].award
			      end
			   end
			end
			
			if res then
			   awards.give_achievement(playern,res)
			end
		     end
		     
		     return nil
		  end
	       end
	    end
	 end
      end
      
      if sys4_achievements.craftmode then
	 return ItemStack(wasteItem)
      else
	 return nil
      end
      
   end)

