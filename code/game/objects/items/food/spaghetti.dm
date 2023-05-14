///spaghetti prototype used by all subtypes
/obj/item/food/spaghetti
	icon = 'icons/obj/food/spaghetti.dmi'
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/nutriment/vitamin = 1)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	foodtypes = GRAIN
	venue_value = FOOD_PRICE_CHEAP

// Why are you putting cooked spaghetti in your pockets?
<<<<<<< HEAD
/obj/item/food/spaghetti/make_microwavable()
	var/list/display_message = list(
		span_notice("Something wet falls out of their pocket and hits the ground. Is that... [name]?"),
		span_warning("Oh shit! All your pocket [name] fell out!"))
	AddComponent(/datum/component/spill, display_message, 'sound/effects/splat.ogg', MEMORY_SPAGHETTI_SPILL)
=======
/obj/item/food/spaghetti/make_microwaveable()
	var/list/display_message = list(
		span_notice("Something wet falls out of their pocket and hits the ground. Is that... [name]?"),
		span_warning("Oh shit! All your pocket [name] fell out!"))
	AddComponent(/datum/component/spill, display_message, 'sound/effects/splat.ogg', /datum/memory/lost_spaghetti)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	return ..()

/obj/item/food/spaghetti/raw
	name = "spaghetti"
	desc = "Now that's a nic'e pasta!"
	icon_state = "spaghetti"
	tastes = list("pasta" = 1)

<<<<<<< HEAD
/obj/item/food/spaghetti/raw/make_microwavable()
=======
/obj/item/food/spaghetti/make_bakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/spaghetti/boiledspaghetti, rand(15 SECONDS, 20 SECONDS), TRUE, TRUE)

/obj/item/food/spaghetti/raw/make_microwaveable()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	AddElement(/datum/element/microwavable, /obj/item/food/spaghetti/boiledspaghetti)

/obj/item/food/spaghetti/boiledspaghetti
	name = "boiled spaghetti"
	desc = "A plain dish of noodles, this needs more ingredients."
	icon_state = "spaghettiboiled"
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 1)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 2,
		/datum/reagent/consumable/nutriment/vitamin = 1,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/food/spaghetti/boiledspaghetti/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_SCATTER, max_ingredients = 6)

/obj/item/food/spaghetti/pastatomato
	name = "spaghetti"
	desc = "Spaghetti and crushed tomatoes. Just like your abusive father used to make!"
	icon_state = "pastatomato"
	bite_consumption = 4
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/tomatojuice = 10, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES

=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/tomatojuice = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
	)
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES

/obj/item/food/spaghetti/pastatomato/soulful
	name = "soul food"
	desc = "Just how mom used to make it."
	food_reagents = list(
		// same as normal pasghetti
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/tomatojuice = 10,
		/datum/reagent/consumable/nutriment/vitamin = 4,
		// where the soul comes from
		/datum/reagent/pax = 5,
		/datum/reagent/medicine/psicodine = 10,
		/datum/reagent/medicine/morphine = 5,
	)
	tastes = list("nostalgia" = 1, "happiness" = 1)

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/food/spaghetti/copypasta
	name = "copypasta"
	desc = "You probably shouldn't try this, you always hear people talking about how bad it is..."
	icon_state = "copypasta"
	bite_consumption = 4
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 12, /datum/reagent/consumable/tomatojuice = 20, /datum/reagent/consumable/nutriment/vitamin = 8)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/tomatojuice = 20,
		/datum/reagent/consumable/nutriment/vitamin = 8,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("pasta" = 1, "tomato" = 1)
	foodtypes = GRAIN | VEGETABLES

/obj/item/food/spaghetti/meatballspaghetti
	name = "spaghetti and meatballs"
	desc = "Now that's a nic'e meatball!"
	icon_state = "meatballspaghetti"
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 2)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 10,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("pasta" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/food/spaghetti/spesslaw
	name = "spesslaw"
	desc = "A lawyers favourite."
	icon_state = "spesslaw"
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 20, /datum/reagent/consumable/nutriment/vitamin = 3)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 20,
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("pasta" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/food/spaghetti/chowmein
	name = "chow mein"
	desc = "A nice mix of noodles and fried vegetables."
	icon_state = "chowmein"
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 6)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 6,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 6,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("noodle" = 1, "meat" = 1, "fried vegetables" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES

/obj/item/food/spaghetti/beefnoodle
	name = "beef noodle"
	desc = "Nutritious, beefy and noodly."
	icon_state = "beefnoodle"
	trash_type = /obj/item/reagent_containers/cup/bowl
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 6, /datum/reagent/liquidgibs = 3)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 4,
		/datum/reagent/consumable/nutriment/protein = 2,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/liquidgibs = 3,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("noodles" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES

/obj/item/food/spaghetti/butternoodles
	name = "butter noodles"
	desc = "Noodles covered in savory butter. Simple and slippery, but delicious."
	icon_state = "butternoodles"
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 2)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 9,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("noodles" = 1, "butter" = 1)
	foodtypes = GRAIN | DAIRY

/obj/item/food/spaghetti/mac_n_cheese
	name = "mac n' cheese"
	desc = "Made the proper way with only the finest cheese and breadcrumbs. And yet, it can't scratch the same itch as Ready-Donk."
	icon_state = "mac_n_cheese"
<<<<<<< HEAD
	food_reagents = list(/datum/reagent/consumable/nutriment = 9, /datum/reagent/consumable/nutriment/vitamin = 2)
=======
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 9,
		/datum/reagent/consumable/nutriment/vitamin = 2,
	)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	tastes = list("cheese" = 1, "breadcrumbs" = 1, "pasta" = 1)
	foodtypes = GRAIN | DAIRY
