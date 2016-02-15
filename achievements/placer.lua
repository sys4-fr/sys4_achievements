local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'place' -- Type of achievement

-- Require nothing ! --

-- Require wood_crafter --

-- wood_builder
table.insert(a, mkach(t, "wood_builder", "Specialized Wood builder", "default_wood.png", "default:wood", 100, nil, {'stairs:slab_wood', 'stairs:stair_wood', 'stairs:slab_acacia_wood', 'stairs:stair_acacia_wood', 'stairs:slab_pine_wood', 'stairs:stair_pine_wood', 'stairs:slab_junglewood', 'stairs:stair_junglewood'}, "Place wooden planks that give you the ability to make wooden stairs and slabs", "planks_crafter"))

-- require sand_digger
--table.insert(a, mkach(t, "sandstone_builder", "Sandstone builder", "default_sandstone.png", "default:sandstone", 
