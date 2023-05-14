<<<<<<< HEAD
/obj/item/latexballon
	name = "latex glove"
	desc = "Sterile and airtight."
	icon_state = "latexballon"
=======
#define INFLATED "inflated"
#define POPPED "popped"
#define DEFLATED "deflated"

/obj/item/latexballoon
	name = "latex glove"
	desc = "Sterile and airtight."
	icon_state = "latexballoon"
	icon = 'icons/obj/weapons/hand.dmi'
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	inhand_icon_state = "greyscale_gloves"
	lefthand_file = 'icons/mob/inhands/clothing/gloves_righthand.dmi'
	righthand_file = 'icons/mob/inhands/clothing/gloves_lefthand.dmi'
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 7
<<<<<<< HEAD
	var/state
	var/datum/gas_mixture/air_contents = null

/obj/item/latexballon/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/atmos_sensitive, mapload)

/obj/item/latexballon/proc/blow(obj/item/tank/tank, mob/user)
	if (icon_state == "latexballon_bursted")
		return
	icon_state = "latexballon_blow"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	inhand_icon_state = "latexballon"
	user.update_held_items()
	to_chat(user, span_notice("You blow up [src] with [tank]."))
	air_contents = tank.remove_air_volume(3)

/obj/item/latexballon/should_atmos_process(datum/gas_mixture/air, exposed_temperature)
	return (exposed_temperature > T0C+100)

/obj/item/latexballon/atmos_expose(datum/gas_mixture/air, exposed_temperature)
	burst()

/obj/item/latexballon/proc/burst()
	if (!air_contents || icon_state != "latexballon_blow")
		return
	playsound(src, 'sound/weapons/gun/pistol/shot.ogg', 100, TRUE)
	icon_state = "latexballon_bursted"
	inhand_icon_state = initial(inhand_icon_state)
	lefthand_file = initial(lefthand_file)
	righthand_file = initial(righthand_file)
	if(isliving(loc))
		var/mob/living/user = src.loc
		user.update_held_items()
	loc.assume_air(air_contents)

/obj/item/latexballon/ex_act(severity, target)
=======
	var/state = DEFLATED
	var/datum/gas_mixture/air_contents = null

/obj/item/latexballoon/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/atmos_sensitive, mapload)
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/latexballoon/proc/set_state(state_to_set)
	state = state_to_set
	update_appearance(UPDATE_ICON | UPDATE_DESC)

/obj/item/latexballoon/update_icon_state()
	. = ..()

	switch(state)
		if(INFLATED)
			icon_state = "latexballoon_blow"
			lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
			righthand_file = 'icons/mob/inhands/items_righthand.dmi'
			inhand_icon_state = "latexballoon"
		if(POPPED)
			icon_state = "latexballoon_bursted"
			inhand_icon_state = initial(inhand_icon_state)
			lefthand_file = initial(lefthand_file)
			righthand_file = initial(righthand_file)

/obj/item/latexballoon/update_desc()
	. = ..()
	switch(state)
		if(INFLATED)
			desc = "It's a blown up latex glove on a string."
		if(POPPED)
			desc = "The remains of a latex glove."

/obj/item/latexballoon/proc/blow(obj/item/tank/tank, mob/user)
	if(state == POPPED)
		return

	air_contents = tank.remove_air_volume(3)

	if(isnull(air_contents))
		balloon_alert(user, "tank is empty!")
		return

	if(state == INFLATED)
		burst() // too much air, pop it!
		return

	playsound(src, 'sound/items/modsuit/inflate_bloon.ogg', 50, TRUE)

	balloon_alert(user, "you blow up the balloon!") // because it's a balloon obviously

	set_state(INFLATED)

/obj/item/latexballoon/should_atmos_process(datum/gas_mixture/air, exposed_temperature)
	return (exposed_temperature > T0C+100)

/obj/item/latexballoon/atmos_expose(datum/gas_mixture/air, exposed_temperature)
	burst()

/obj/item/latexballoon/proc/burst()
	if (!air_contents || state != INFLATED)
		return

	set_state(POPPED)
	playsound(src, 'sound/items/balloon_pop.ogg', 75, TRUE)
	loc.assume_air(air_contents)

/obj/item/latexballoon/ex_act(severity, target)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	burst()
	switch(severity)
		if (EXPLODE_DEVASTATE)
			qdel(src)
		if (EXPLODE_HEAVY)
			if (prob(50))
				qdel(src)

<<<<<<< HEAD
/obj/item/latexballon/bullet_act(obj/projectile/P)
	if(!P.nodamage)
		burst()
	return ..()

/obj/item/latexballon/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/tank))
		var/obj/item/tank/T = W
		blow(T, user)
		return
	if (W.get_sharpness() || W.get_temperature())
		burst()
=======
	return TRUE

/obj/item/latexballoon/bullet_act(obj/projectile/projectile)
	if(projectile.damage > 0)
		burst()

	return ..()

/obj/item/latexballoon/attackby(obj/item/item, mob/user, params)
	if(istype(item, /obj/item/tank))
		var/obj/item/tank/air_tank = item
		blow(air_tank, user)
		return
	if(item.get_sharpness() || item.get_temperature())
		burst()
		return

	return ..()

#undef INFLATED
#undef POPPED
#undef DEFLATED
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
