/obj/item/stack/sheet/hot_ice
	name = "hot ice"
	icon_state = "hot-ice"
	inhand_icon_state = null
	singular_name = "hot ice piece"
	icon = 'icons/obj/stack_objects.dmi'
<<<<<<< HEAD
	mats_per_unit = list(/datum/material/hot_ice=MINERAL_MATERIAL_AMOUNT)
=======
	mats_per_unit = list(/datum/material/hot_ice=SHEET_MATERIAL_AMOUNT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	grind_results = list(/datum/reagent/toxin/hot_ice = 25)
	material_type = /datum/material/hot_ice
	merge_type = /obj/item/stack/sheet/hot_ice

/obj/item/stack/sheet/hot_ice/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] begins licking \the [src]! It looks like [user.p_theyre()] trying to commit suicide!"))
	return FIRELOSS//dont you kids know that stuff is toxic?
