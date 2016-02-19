local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'craft' -- Type of achievement

-- wood_crafter
table.insert(a, mkach(t, "wood_crafter", "Wood Crafter", "default_tool_woodsword.png", {'default:wood', 'default:junglewood', 'default:acacia_wood', 'default:pine_wood'}, 100, nil, {"default:stick", "default:sword_wood", "default:axe_wood"}, nil, "award_lumberjack"))

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


if minetest.get_modpath("3d_armor") then
   local items = {'3d_armor:boots_wood', '3d_armor:chestplate_wood', '3d_armor:helmet_wood', '3d_armor:leggings_wood'}

   if minetest.get_modpath("shields") then
      table.insert(items, 'shields:shield_wood')
   end

   -- sword_crafter
   table.insert(a, mkach(t, "sword_crafter", "Sword Crafter", "3d_armor_inv_chestplate_wood.png", "default:sword_wood", 2, nil, items, nil, "wood_crafter"))

end



   
