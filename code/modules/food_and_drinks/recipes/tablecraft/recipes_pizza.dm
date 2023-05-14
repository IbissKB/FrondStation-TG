
// see code/module/crafting/table.dm

////////////////////////////////////////////////PIZZA!!!////////////////////////////////////////////////

/datum/crafting_recipe/food/margheritapizza
<<<<<<< HEAD
	name = "Margherita pizza"
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/cheese/wedge = 4,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/margherita/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/meatpizza
	name = "Meat pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/meatpizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/meat/rawcutlet = 4,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/meat/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/arnold
	name = "Arnold pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/arnold
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/meat/rawcutlet = 3,
		/obj/item/ammo_casing/c9mm = 8,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/arnold/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/mushroompizza
	name = "Mushroom pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/mushroompizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/mushroom = 5
	)
	result = /obj/item/food/pizza/mushroom/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/vegetablepizza
	name = "Vegetable pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/vegetablepizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/eggplant = 1,
		/obj/item/food/grown/carrot = 1,
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/vegetable/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/donkpocketpizza
	name = "Donkpocket pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/donkpocketpizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/donkpocket = 3,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/donkpocket/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/dankpizza
	name = "Dank pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/dankpizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/ambrosia/vulgaris = 3,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/dank/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/sassysagepizza
	name = "Sassysage pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/sassysagepizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/raw_meatball = 3,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/sassysage/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/pineapplepizza
	name = "Hawaiian pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/pineapplepizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/meat/rawcutlet = 2,
		/obj/item/food/pineappleslice = 3,
		/obj/item/food/cheese/wedge = 1,
		/obj/item/food/grown/tomato = 1
	)
	result = /obj/item/food/pizza/pineapple/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/antspizza
	name = "Ant Party pizza slice"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/antspizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/pizzaslice/margherita = 1,
		/datum/reagent/ants = 4
	)
	result = /obj/item/food/pizzaslice/ants
<<<<<<< HEAD
	subcategory = CAT_PIZZA

/datum/crafting_recipe/food/energypizza
	name = "Energy pizza"
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/energypizza
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/stock_parts/cell = 2,
	)
	result = /obj/item/food/pizza/energy/raw
<<<<<<< HEAD
	subcategory = CAT_PIZZA
=======
	category = CAT_PIZZA

/datum/crafting_recipe/food/raw_meat_calzone
	name = "Meat calzone"
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/cheese/wedge = 2,
		/obj/item/food/meat/rawcutlet = 3,
		/obj/item/food/grown/tomato = 1,
	)
	result = /obj/item/food/raw_meat_calzone
	category = CAT_PIZZA

/datum/crafting_recipe/food/raw_vegetarian_calzone
	name = "Vegetarian calzone"
	reqs = list(
		/obj/item/food/flatdough = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/cabbage = 1,
		/obj/item/food/grown/onion = 1,
	)
	result = /obj/item/food/raw_vegetarian_calzone
	category = CAT_PIZZA
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
