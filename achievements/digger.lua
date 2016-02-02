local a = sys4_achievements.achievements['sys4']
local mkach = sys4_achievements.mkach

local t = 'dig' -- Type of achievement

table.insert(a, mkach(t, "tree_digger", "Finding wood", "default_tree.png", "default:tree", 1, nil,
		      {'default:wood', 'default:junglewood', 'default:pine_wood', 'default:acacia_wood'},
		      "Attack a tree and obtain wood. It's an essential raw material",
		      nil))

-- Dig 13 wheats : unlock flour & straws
table.insert(a, mkach(t, "wheat_digger", "Hands in the Flour", "farming_flour.png", "farming:wheat_8", 8,
		      nil, {'farming:flour', 'farming_straw', 'farming_wheat'},
		      nil, "hoe_crafter"))
-- Cotton
table.insert(a, mkach(t, "cotton_digger", "Spinner's first steps", "wool_white.png", "farming:cotton_8", 8,
		      nil, {'wool:white'}, nil, "hoe_crafter"))

-- Stone
table.insert(a, mkach(t, "stone_digger", "Finding stone", "default_stone.png", "default:stone", 1, nil,
		      {'default:furnace', 'default:axe_stone', 'default:sword_stone', 'default:shovel_stone', 'farming:hoe_stone'},
		      "Find stone and make your first stone tools", "pick_crafter"))

-- Coal
