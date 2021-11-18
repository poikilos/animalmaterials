---------------------------------------------------------
--Cooking Support, added by Mr Elmux
-- You may use modify or do anything except removing this copyright hint
-----------------------------------------------------------
local version = "0.1.1"
core.log("action","MOD: Loading cooking (by Mr Elmux) ...")
core.register_craftitem("cooking:meat_cooked", {
	description = "Cooked Meat",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
minetest.override_item("cooking:meat_pork_cooked", {
	description = "Cooked Pork",
	image = "cooking_pork_cooked.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})

core.register_craftitem("cooking:meat_chicken_cooked", {
	description = "Cooked Chicken",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:meat_beef_cooked", {
	description = "Cooked Beef",
	image = "cooking_beef_cooked.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})

local cooking_more_cooked = false
if cooking_more_cooked then
	core.register_craftitem("cooking:meat_undead_cooked", {
		description = "Cooked Meat (now dead)",
		image = "cooking_meat_undead_cooked.png",
		on_use = core.item_eat(-2),
		groups = { meat=1 , eatable=1},
		stack_max = 25
	})
	core.register_craftitem("cooking:meat_toxic_cooked", {
		description = "Cooked Toxic Meat",
		image = "cooking_meat_toxic_cooked.png",
		on_use = core.item_eat(-5),
		groups = { meat=1 , eatable=1},
		stack_max = 25
	})
else
	minetest.register_alias("cooking:meat_undead_cooked", "cooking:meat_cooked")
	minetest.register_alias("cooking:meat_toxic_cooked", "cooking:meat_cooked")
end

core.register_craftitem("cooking:fish_bluewhite_cooked", {
	description = "Cooked Bluewhite",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:meat_venison_cooked", {
	description = "Cooked Venison",
	image = "cooking_venison_cooked.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:fish_clownfish_cooked", {
	description = "Cooked Meat",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:pork_cooked", {
	description = "Cooked Pork",
	inventory_image = "cooking_pork_cooked.png",
	on_use = core.item_eat(8),
})

core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_raw",
	output = "cooking:meat_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_pork",
	output = "cooking:meat_pork_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_chicken",
	output = "cooking:meat_chicken_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_beef",
	output = "cooking:meat_beef_cooked",
})

core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_undead",
	output = "cooking:meat_undead_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_venison",
	output = "cooking:meat_venison_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:meat_toxic",
	output = "cooking:meat_toxic_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:fish_bluewhite",
	output = "cooking:fish_bluewhite_cooked",
})
core.register_craft({
	type= "cooking",
	recipe = "animalmaterials:fish_clownfish",
	output = "cooking:fish_clownfish_cooked",
})


core.log("action","MOD: cooking (by Mr Elmux) version .. " .. version .. " loaded.")
