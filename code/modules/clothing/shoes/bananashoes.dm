//banana flavored chaos and horror ahead

/obj/item/clothing/shoes/clown_shoes/banana_shoes
	name = "mk-honk prototype shoes"
	desc = "Lost prototype of advanced clown tech. Powered by bananium, these shoes leave a trail of chaos in their wake."
	icon_state = "clown_prototype_off"
	actions_types = list(/datum/action/item_action/toggle)
<<<<<<< HEAD
	var/on = FALSE
	var/always_noslip = FALSE

/obj/item/clothing/shoes/clown_shoes/banana_shoes/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob, ITEM_SLOT_FEET)
	AddComponent(/datum/component/material_container, list(/datum/material/bananium), 100 * MINERAL_MATERIAL_AMOUNT, MATCONTAINER_EXAMINE|MATCONTAINER_ANY_INTENT|MATCONTAINER_SILENT, allowed_items=/obj/item/stack)
	AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 75, falloff_exponent = 20)
	RegisterSignal(src, COMSIG_SHOES_STEP_ACTION, PROC_REF(on_step))
	if(always_noslip)
		clothing_flags |= NOSLIP
=======
	/// Whether the clown shoes are active (spawning bananas)
	var/on = FALSE
	/// If TRUE, we will always have the noslip trait no matter whether they're on or off
	var/always_noslip = FALSE
	/// How many materials we consume per banana created
	var/material_per_banana =SMALL_MATERIAL_AMOUNT
	/// Typepath of created banana
	var/banana_type = /obj/item/grown/bananapeel/specialpeel

/obj/item/clothing/shoes/clown_shoes/banana_shoes/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)
	AddComponent(/datum/component/material_container, list(/datum/material/bananium), 100 * SHEET_MATERIAL_AMOUNT, MATCONTAINER_EXAMINE|MATCONTAINER_ANY_INTENT|MATCONTAINER_SILENT, allowed_items=/obj/item/stack)
	AddComponent(/datum/component/squeak, list('sound/items/bikehorn.ogg'=1), 75, falloff_exponent = 20)
	RegisterSignal(src, COMSIG_SHOES_STEP_ACTION, PROC_REF(on_step))
	if(always_noslip)
		LAZYOR(clothing_traits, TRAIT_NO_SLIP_WATER)

/obj/item/clothing/shoes/clown_shoes/banana_shoes/proc/toggle_clowning_action()
	on = !on
	update_appearance()
	if(always_noslip)
		return

	if(on)
		attach_clothing_traits(TRAIT_NO_SLIP_WATER)
	else
		detach_clothing_traits(TRAIT_NO_SLIP_WATER)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/clown_shoes/banana_shoes/proc/on_step()
	SIGNAL_HANDLER

	var/mob/wearer = loc
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
<<<<<<< HEAD
	if(on && istype(wearer))
		if(bananium.get_material_amount(/datum/material/bananium) < 100)
			on = !on
			if(!always_noslip)
				clothing_flags &= ~NOSLIP
			update_appearance()
			to_chat(loc, span_warning("You ran out of bananium!"))
		else
			new /obj/item/grown/bananapeel/specialpeel(get_step(src,turn(wearer.dir, 180))) //honk
			bananium.use_amount_mat(100, /datum/material/bananium)
=======
	if(!on || !istype(wearer))
		return

	if(bananium.use_amount_mat(material_per_banana, /datum/material/bananium))
		new banana_type(get_step(src, turn(wearer.dir, 180))) //honk
		return

	toggle_clowning_action()
	to_chat(wearer, span_warning("You ran out of bananium!"))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/clown_shoes/banana_shoes/attack_self(mob/user)
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
	var/sheet_amount = bananium.retrieve_all()
	if(sheet_amount)
		to_chat(user, span_notice("You retrieve [sheet_amount] sheets of bananium from the prototype shoes."))
	else
		to_chat(user, span_warning("You cannot retrieve any bananium from the prototype shoes!"))

/obj/item/clothing/shoes/clown_shoes/banana_shoes/examine(mob/user)
	. = ..()
	. += span_notice("The shoes are [on ? "enabled" : "disabled"].")

/obj/item/clothing/shoes/clown_shoes/banana_shoes/ui_action_click(mob/user)
	var/datum/component/material_container/bananium = GetComponent(/datum/component/material_container)
<<<<<<< HEAD
	if(bananium.get_material_amount(/datum/material/bananium))
		on = !on
		update_appearance()
		to_chat(user, span_notice("You [on ? "activate" : "deactivate"] the prototype shoes."))
		if(!always_noslip)
			if(on)
				clothing_flags |= NOSLIP
			else
				clothing_flags &= ~NOSLIP
=======
	if(bananium.get_material_amount(/datum/material/bananium) >= material_per_banana)
		toggle_clowning_action()
		to_chat(user, span_notice("You [on ? "activate" : "deactivate"] the prototype shoes."))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	else
		to_chat(user, span_warning("You need bananium to turn the prototype shoes on!"))

/obj/item/clothing/shoes/clown_shoes/banana_shoes/update_icon_state()
	icon_state = "clown_prototype_[on ? "on" : "off"]"
	return ..()
