/obj/item/glassblowing/magnifying_glass
	name = "magnifying glass"
	desc = "A tool that, with the assistance of a magnifying lens, allows you to view what is small."
	icon_state = "magnifying_glass"

/obj/item/glassblowing/magnifying_glass/examine(mob/user)
	. = ..()
	. += span_notice("You can use [src] on useless relics to realize their full potential!")

/datum/crafting_recipe/magnifying_glass
	name = "Magnifying Glass"
	result = /obj/item/glassblowing/magnifying_glass
	reqs = list(
		/obj/item/stack/sheet/mineral/wood = 1,
		/obj/item/glassblowing/glass_lens = 1,
	)
<<<<<<< HEAD
	category = CAT_PRIMAL
=======
	category = CAT_EQUIPMENT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
