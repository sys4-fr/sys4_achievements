local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'craft' -- Type of achievement

-- wood_crafter
table.insert(a, mkach(t, "wood_crafter", "Wood Crafter", "default_tool_woodsword.png", {'default:wood', 'default:junglewood', 'default:acacia_wood', 'default:pine_wood'}, 100, nil, {"default:stick", "default:sword_wood", "default:axe_wood"}, nil, "award_lumberjack"))

-- stick_crafter
table.insert(a, mkach(t, "stick_crafter", "Stick Crafter", "default_ladder.png", "default:stick", 100, nil, {"default:ladder", "fences:fence_wood", "default:sign_wall"}, nil, "wood_crafter"))

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
table.insert(a, mkach(t, "vessel_crafter", "Vessel Crafter", "vessel_drinking_glass.png", {'vessels:drinking_glass', 'vessels:glass_bootle', 'vessels:glass_fragments'}, 100, nil, {'vessels:shelf'}, nil, "glass_builder"))

-- tools_crafter_pro
table.insert(a, mkach(t, "tools_crafter_pro", "Tools Crafter Pro", "default_tool_steelpick.png", {'default:sword_steel', 'default:axe_steel', 'default:shovel_steel', 'farming:hoe_steel'}, 10, nil, {'default:pick_steel'}, nil, "iron_digger_lover"))

-- bronze_crafter
table.insert(a, mkach(t, "bronze_crafter", "Bronze Crafter", "default_bronze_ingot.png", "default:bronze_ingot", 100, nil, {'default:sword_bronze', 'default:axe_bronze', 'default:shovel_bronze', 'farming:hoe_bronze'}, nil, "copper_digger"))

-- tools_crafter_expert
table.insert(a, mkach(t, "tools_crafter_expert", "Tools Crafter Expert", "default_tool_bronzepick.png", {'default:sword_bronze', 'default:axe_bronze', 'default:shovel_bronze', 'farming:hoe_bronze'}, 5, nil, {'default:pick_bronze'}, nil, "bronze_crafter"))

-- tools_crafter_master
table.insert(a, mkach(t, "tools_crafter_master", "Tools Crafter Master", "default_tool_mesepick.png", {'default:sword_mese', 'default:axe_mese', 'default:shovel_mese', 'farming:hoe_mese'}, 5, nil, {'default:pick_mese'}, nil, "mese_digger"))

-- tools_crafter_ultimate
table.insert(a, mkach(t, "tools_crafter_ultimate", "Tools Crafter Ultimate", "default_tool_diamondpick.png", {'default:sword_diamond', 'default:axe_diamond', 'default:shovel_diamond', 'farming:hoe_diamond'}, 5, nil, {'default:pick_diamond'}, nil, "diamond_digger"))

if minetest.get_modpath("3d_armor") then
   local items_wood = {'3d_armor:boots_wood', '3d_armor:chestplate_wood', '3d_armor:helmet_wood', '3d_armor:leggings_wood'}
   local items_steel = {'3d_armor:boots_steel', '3d_armor:chestplate_steel', '3d_armor:helmet_steel', '3d_armor:leggings_steel'}
   local items_bronze = {'3d_armor:boots_bronze', '3d_armor:chestplate_bronze', '3d_armor:helmet_bronze', '3d_armor:leggings_bronze'}
   local items_mese = {'3d_armor:boots_mese', '3d_armor:chestplate_mese', '3d_armor:helmet_mese', '3d_armor:leggings_mese'}
   local items_diamond = {'3d_armor:boots_diamond', '3d_armor:chestplate_diamond', '3d_armor:helmet_diamond', '3d_armor:leggings_diamond'}

   if minetest.get_modpath("shields") then
      table.insert(items_wood, 'shields:shield_wood')
      table.insert(items_steel, 'shields:shield_steel')
      table.insert(items_bronze, 'shields:shield_bronze')
      table.insert(items_mese, 'shields:shield_mese')
      table.insert(items_diamond, 'shields:shield_diamond')
   end

   -- sword_crafter
   table.insert(a, mkach(t, "sword_crafter", "Sword Crafter", "3d_armor_inv_chestplate_wood.png", "default:sword_wood", 2, nil, items_wood, nil, "wood_crafter"))

   -- sword_crafter_lover
   table.insert(a, mkach(t, "sword_crafter_lover", "Sword Crafter Lover", "3d_armor_inv_chestplate_steel.png", "default:sword_steel", 2, nil, items_steel, nil, "iron_digger"))

   -- sword_crafter_pro
   table.insert(a, mkach(t, "sword_crafter_pro", "Sword Crafter Pro", "3d_armor_inv_chestplate_bronze.png", "default:sword_bronze", 2, nil, items_bronze, nil, "bronze_crafter"))

   -- sword_crafter_expert
   table.insert(a, mkach(t, "sword_crafter_expert", "Sword Crafter Expert", "3d_armor_inv_chestplate_mese.png", "default:sword_mese", 2, nil, items_mese, nil, "mese_digger"))

   -- sword_crafter_master
   table.insert(a, mkach(t, "sword_crafter_master", "Sword Crafter Master", "3d_armor_inv_chestplate_diamond.png", "default:sword_diamond", 2, nil, items_diamond, nil, "diamond_digger"))

end
