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
minetest.override_item("animalmaterials:meat_pork", {
	description = "Cooked Pork",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})

minetest.register_alias("cooking:meat_pork_cooked", "animalmaterials:meat_pork")

core.register_craftitem("cooking:meat_chicken_cooked", {
	description = "Cooked Chicken",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:meat_beef_cooked", {
	description = "Cooked Beef",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:meat_undead_cooked", {
	description = "Cooked Meat (now dead)",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(-2),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:meat_venison_cooked", {
	description = "Cooked Venison",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(6),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:meat_toxic_cooked", {
	description = "Cooked Toxic Meat",
	image = "cooking_cooked_meat.png",
	on_use = core.item_eat(-5),
	groups = { meat=1 , eatable=1},
	stack_max = 25
})
core.register_craftitem("cooking:fish_bluewhite_cooked", {
	description = "Cooked Bluewhite",
	image = "cooking_cooked_meat.png",
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
	recipe = "animalmaterials:pork_raw",
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
core.register_craft({
	type = "cooking",
	output = "cooking:pork_cooked",
	recipe = "animalmaterials:pork_raw",
	cooktime = 5,
})

core.log("action","MOD: cooking (by Mr Elmux) version .. " .. version .. " loaded.")
