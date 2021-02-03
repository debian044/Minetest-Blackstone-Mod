--nodes
mcl_stairs = {}

minetest.register_node("mcl_blackstone:blackstone", {
	description = ("Blackstone"),
	tiles = {"mcl_blackstone.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})

minetest.register_node("mcl_blackstone:blackstone_polished", {
	description = ("Polished Blackstone"),
	tiles = {"mcl_blackstone_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("mcl_blackstone:blackstone_chiseled_polished", {
	description = ("Chieseled Polished Blackstone"),
	tiles = {"mcl_blackstone_chiseled_polished.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


minetest.register_node("mcl_blackstone:blackstone_brick_polished", {
	description = ("Polished Blackstone Bricks"),
	tiles = {"mcl_blackstone_polished_bricks.png"},
	is_ground_content = false,
	groups = {cracky = 3, pickaxey=2, material_stone=1},
})


--lavacooling



minetest.register_abm({
	label = "Lava cooling",
	nodenames = {"group:lava"},
	neighbors = {"mcl_core:packed_ice"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local water = minetest.find_nodes_in_area({x=pos.x-1, y=pos.y-1, z=pos.z-1}, {x=pos.x+1, y=pos.y+1, z=pos.z+1}, "mcl_core:packed_ice")

		local lavatype = minetest.registered_nodes[node.name].liquidtype

		for w=1, #water do
			local waternode = minetest.get_node(water[w])
			local watertype = minetest.registered_nodes[waternode.name].liquidtype
			if water[w].y < pos.y and water[w].x == pos.x and water[w].z == pos.z then
				minetest.set_node(water[w], {name="mcl_blackstone:blackstone"})
			elseif lavatype == "flowing" and water[w].y == pos.y and (water[w].x == pos.x or water[w].z == pos.z) then
				minetest.set_node(pos, {name="mcl_blackstone:blackstone"})
			elseif lavatype == "flowing" and water[w].y > pos.y and water[w].x == pos.x and water[w].z == pos.z then
				minetest.set_node(pos, {name="mcl_blackstone:blackstone"})
			end
		end
	end,
})


--crafting



minetest.register_craft({
	output = 'mcl_blackstone:blackstone_polished 4',
	recipe = {
		{'mcl_blackstone:blackstone','mcl_blackstone:blackstone'},
		{'mcl_blackstone:blackstone','mcl_blackstone:blackstone'},
	}
})
minetest.register_craft({
	output = 'mcl_blackstone:blackstone_chiseled_polished 2',
	recipe = {
		{'mcl_blackstone:blackstone_polished'},
		{'mcl_blackstone:blackstone_polished'},
	}
})
minetest.register_craft({
	output = 'mcl_blackstone:blackstone_brick_polished 4',
	recipe = {
		{'mcl_blackstone:blackstone_polished','mcl_blackstone:blackstone_polished'},
		{'mcl_blackstone:blackstone_polished','mcl_blackstone:blackstone_polished'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:pick_stone',
	recipe = {
		{'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone'},
		{'', 'mcl_core:stick', ''},
		{'', 'mcl_core:stick', ''},
	}
})



minetest.register_craft({
	output = 'mcl_tools:axe_stone',
	recipe = {
		{'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone'},
		{'mcl_blackstone:blackstone', 'mcl_core:stick'},
		{'', 'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:axe_stone',
	recipe = {
		{'mcl_blackstone:blackstone', 'mcl_blackstone:blackstone'},
		{'mcl_core:stick',  'mcl_blackstone:blackstone'},
		{'', 'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:shovel_stone',
	recipe = {
		{'mcl_blackstone:blackstone'},
		{'mcl_core:stick'},
		{'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = 'mcl_tools:sword_stone',
	recipe = {
		{'mcl_blackstone:blackstone'},
		{'mcl_blackstone:blackstone'},
		{'mcl_core:stick'},
	}
})


minetest.register_craft({
	output = "mcl_farming:hoe_stone",
	recipe = {
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone"},
		{"", "mcl_core:stick"},
		{"", "mcl_core:stick"}
	}
})
minetest.register_craft({
	output = "mcl_farming:hoe_stone",
	recipe = {
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone"},
		{"mcl_core:stick", ""},
		{"mcl_core:stick", ""}
	}
})

minetest.register_craft({
	output = "mcl_furnaces:furnace",
	recipe = {
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone", "mcl_blackstone:blackstone"},
		{"mcl_blackstone:blackstone", "",			   "mcl_blackstone:blackstone"},
		{"mcl_blackstone:blackstone", "mcl_blackstone:blackstone", "mcl_blackstone:blackstone"}
	}
})
