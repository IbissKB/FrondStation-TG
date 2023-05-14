/datum/crafting_recipe/primitive_billow
	name = "Primitive Forging Billow"
	result = /obj/item/forging/billow/primitive
	reqs = list(/obj/item/stack/sheet/mineral/wood = 5)
<<<<<<< HEAD
	category = CAT_PRIMAL
=======
	category = CAT_TOOLS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/primitive_tong
	name = "Primitive Forging Tong"
	result = /obj/item/forging/tongs/primitive
	reqs = list(/obj/item/stack/sheet/iron = 5)
<<<<<<< HEAD
	category = CAT_PRIMAL
=======
	category = CAT_TOOLS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/crafting_recipe/primitive_hammer
	name = "Primitive Forging Hammer"
	result = /obj/item/forging/hammer/primitive
	reqs = list(/obj/item/stack/sheet/iron = 5)
<<<<<<< HEAD
	category = CAT_PRIMAL
=======
	category = CAT_TOOLS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

//cargo supply pack for items
/datum/supply_pack/service/forging_items
	name = "Forging Starter Item Pack"
	desc = "Featuring: Forging. This pack is full of three items necessary to start your forging career: tongs, hammer, and billow."
	cost = CARGO_CRATE_VALUE * 4
	contains = list(/obj/item/forging/tongs, /obj/item/forging/hammer, /obj/item/forging/billow)
	crate_name = "forging start items"
	crate_type = /obj/structure/closet/crate/forging_items

/obj/structure/closet/crate/forging_items
	name = "forging starter items"
	desc = "A crate filled with the items necessary to start forging (billow, hammer, and tongs)."
