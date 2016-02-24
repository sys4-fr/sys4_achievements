local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'craft' -- Type of achievement

-- wood_crafter
local wood_nodes = {'default:wood', 'default:junglewood', 'default:acacia_wood', 'default:pine_wood'}
local wood_items = {"default:stick", "default:sword_wood", "default:axe_wood"}

if minetest.get_modpath("ethereal") then
   table.insert(wood_nodes, "ethereal:banana_wood")
   table.insert(wood_nodes, "ethereal:birch_wood")
   table.insert(wood_nodes, "ethereal:frost_wood")
   table.insert(wood_nodes, "ethereal:palm_wood")
   table.insert(wood_nodes, "ethereal:redwood_wood")
   table.insert(wood_nodes, "ethereal:willow_wood")
   table.insert(wood_nodes, "ethereal:yellow_wood")

   table.insert(wood_items, "ethereal:bowl")
end

table.insert(a, mkach(t, "wood_crafter", "Wood Crafter", "default_tool_woodsword.png", wood_nodes, 100, nil, wood_items, nil, "award_lumberjack"))

-- stick_crafter
table.insert(a, mkach(t, "stick_crafter", "Stick Crafter", "default_ladder.png", "default:stick", 100, nil, {"default:ladder", "default:fence_wood", "default:sign_wall"}, nil, "wood_crafter"))

-- tools_crafter (End of Darkness)
table.insert(a, mkach(t, "tools_crafter", "Tools Crafter", "default_tool_woodpick.png", {'default:sword_wood', 'default:axe_wood', 'default:shovel_wood', 'farming:hoe_wood'}, 20, nil, {"default:pick_wood"}, nil, "wood_crafter"))

-- flour_crafter
table.insert(a, mkach(t, "flour_crafter", "Flour Crafter", "farming_straw.png", "farming:flour", 100, nil, {"farming:straw", "farming:wheat"}, nil, "wheat_digger"))

-- sandstone_crafter
table.insert(a, mkach(t, "sandstone_crafter", "Sandstone Crafter", "default_sandstone_brick.png", "default:sandstone", 100, nil, {"default:sandstonebrick"},nil, "dirt_digger"))

-- book_crafter
table.insert(a, mkach(t, "book_crafter", "Book Crafter", "default_book.png", "default:paper", 100, nil, {"default:book"},nil, "papyrus_digger"))

-- bookshelf_crafter
table.insert(a, mkach(t, "bookshelf_crafter", "BookShelf Crafter", "default_bookshelf.png", "default:book", 100, nil, {"default:bookshelf"}, nil, "book_crafter"))

-- tools_crafter_lover
table.insert(a, mkach(t, "tools_crafter_lover", "Tools Crafter Lover", "default_tool_stonepick.png", {'default:sword_stone', 'default:axe_stone', 'default:shovel_stone', 'farming:hoe_stone'}, 15, nil, {"default:pick_stone"}, nil, "award_mine2"))

-- vessel_crafter
table.insert(a, mkach(t, "vessel_crafter", "Vessel Crafter", "vessels_shelf.png", {'vessels:drinking_glass', 'vessels:glass_bootle', 'vessels:glass_fragments'}, 100, nil, {'vessels:shelf'}, nil, "glass_builder"))

-- tools_crafter_pro
table.insert(a, mkach(t, "tools_crafter_pro", "Tools Crafter Pro", "default_tool_steelpick.png", {'default:sword_steel', 'default:axe_steel', 'default:shovel_steel', 'farming:hoe_steel', 'default:sword_bronze', 'default:axe_bronze', 'default:shovel_bronze', 'farming:hoe_bronze'}, 10, nil, {'default:pick_steel', 'default:pick_bronze'}, nil, "iron_digger_lover"))

-- bronze_crafter
table.insert(a, mkach(t, "bronze_crafter", "Bronze Crafter", "default_bronze_ingot.png", "default:bronze_ingot", 100, nil, {'default:sword_bronze', 'default:axe_bronze', 'default:shovel_bronze', 'farming:hoe_bronze', 'default:bronzeblock'}, nil, "copper_digger"))

-- tools_crafter_master
table.insert(a, mkach(t, "tools_crafter_master", "Tools Crafter Master", "default_tool_mesepick.png", {'default:sword_mese', 'default:axe_mese', 'default:shovel_mese', 'farming:hoe_mese'}, 5, nil, {'default:pick_mese'}, nil, "mese_digger"))

-- tools_crafter_ultimate
table.insert(a, mkach(t, "tools_crafter_ultimate", "Tools Crafter Ultimate", "default_tool_diamondpick.png", {'default:sword_diamond', 'default:axe_diamond', 'default:shovel_diamond', 'farming:hoe_diamond'}, 5, nil, {'default:pick_diamond'}, nil, "diamond_digger"))

if minetest.get_modpath("3d_armor") then
   local items_wood = {'3d_armor:boots_wood', '3d_armor:chestplate_wood', '3d_armor:helmet_wood', '3d_armor:leggings_wood'}
   local items_steel = {'3d_armor:boots_steel', '3d_armor:chestplate_steel', '3d_armor:helmet_steel', '3d_armor:leggings_steel'}
   local items_bronze = {'3d_armor:boots_bronze', '3d_armor:chestplate_bronze', '3d_armor:helmet_bronze', '3d_armor:leggings_bronze'}
   local items_gold = {'3d_armor:boots_gold', '3d_armor:chestplate_gold', '3d_armor:helmet_gold', '3d_armor:leggings_gold'}
   local items_diamond = {'3d_armor:boots_diamond', '3d_armor:chestplate_diamond', '3d_armor:helmet_diamond', '3d_armor:leggings_diamond'}

   if minetest.get_modpath("shields") then
      table.insert(items_wood, 'shields:shield_wood')
      table.insert(items_steel, 'shields:shield_steel')
      table.insert(items_bronze, 'shields:shield_bronze')
      table.insert(items_gold, 'shields:shield_gold')
      table.insert(items_diamond, 'shields:shield_diamond')
   end

   -- sword_crafter
   table.insert(a, mkach(t, "sword_crafter", "Sword Crafter", "3d_armor_inv_chestplate_wood.png", "default:sword_wood", 2, nil, items_wood, nil, "wood_crafter"))

   -- sword_crafter_lover
   table.insert(a, mkach(t, "sword_crafter_lover", "Sword Crafter Lover", "3d_armor_inv_chestplate_steel.png", "default:sword_steel", 2, nil, items_steel, nil, "iron_digger"))

   -- sword_crafter_pro
   table.insert(a, mkach(t, "sword_crafter_pro", "Sword Crafter Pro", "3d_armor_inv_chestplate_bronze.png", "default:sword_bronze", 2, nil, items_bronze, nil, "bronze_crafter"))

   -- sword_crafter_expert
   table.insert(a, mkach(t, "sword_crafter_expert", "Sword Crafter Expert", "3d_armor_inv_chestplate_gold.png", "default:sword_mese", 2, nil, items_gold, nil, "mese_digger"))

   -- sword_crafter_master
   table.insert(a, mkach(t, "sword_crafter_master", "Sword Crafter Master", "3d_armor_inv_chestplate_diamond.png", "default:sword_diamond", 2, nil, items_diamond, nil, "diamond_digger"))

end

-- ethereal --
if minetest.get_modpath("ethereal") then

   -- crystal_crafter
   table.insert(a, mkach(t, "crystal_crafter", "Crystal Crafter", "crystal_sword.png", "ethereal:crystal_ingot", 50, nil, {'ethereal:sword_crystal', 'ethereal:axe_crystal', 'ethereal:shovel_crystal', 'ethereal:crystal_block'}, nil, "crystal_spike_digger"))

   -- crystal_tools_crafter
   table.insert(a, mkach(t, "crystal_tools_crafter", "Crystal Tools Crafter", "crystal_gilly_staff.png", {'ethereal:sword_crystal', 'ethereal:axe_crystal', 'ethereal:shovel_crystal'}, 5, nil, {'ethereal:crystal_gilly_staff', 'ethereal:pick_crystal'}, nil, "crystal_crafter"))

   -- bowl_crafter
   table.insert(a, mkach(t, "bowl_crafter", "Bowl Crafter", "mushroom_soup.png", "ethereal:bowl", 2, nil, {'ethereal:mushroom_soup', 'ethereal:hearty_stew'}, nil, "wood_crafter"))

   if minetest.get_modpath("3d_armor") then
      -- ethereal_sword_crafter
      local crystal_items = {'3d_armor:boots_crystal', '3d_armor:chestplate_crystal', '3d_armor:helmet_crystal', '3d_armor:leggings_crystal'}
      if minetest.get_modpath("shields") then
	 table.insert(crystal_items, "shields:shield_crystal")
      end

      table.insert(a, mkach(t, "ethereal_sword_crafter", "Ethereal Sword Crafter", "3d_armor_inv_chestplate_crystal.png", "ethereal:sword_crystal", 2, nil, crystal_items, nil, "crystal_crafter"))
   end
end
