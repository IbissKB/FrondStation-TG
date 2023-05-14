<<<<<<< HEAD
=======
#define X_STAND_OPEN_STATE "open"
#define X_STAND_CLOSED_STATE "close"

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/structure/bed/bdsm_bed
	name = "bdsm bed"
	desc = "A latex bed with D-rings on the sides. Looks comfortable."
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	icon_state = "bdsm_bed"
	max_integrity = 50
<<<<<<< HEAD

/obj/item/bdsm_bed_kit
	name = "bdsm bed construction kit"
	desc = "Construction requires a wrench."
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	throwforce = 0
	icon_state = "bdsm_bed_kit"
	var/unwrapped = 0
	w_class = WEIGHT_CLASS_HUGE

/obj/item/bdsm_bed_kit/attackby(obj/item/used_item, mob/user, params) //constructing a bed here.
	add_fingerprint(user)
	if(istype(used_item, /obj/item/wrench))
		if (!(item_flags & IN_INVENTORY) && !(item_flags & IN_STORAGE))
			to_chat(user, span_notice("You fasten the frame to the floor and begin to inflate the latex pillows..."))
			if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
				to_chat(user, span_notice("You assemble the bdsm bed."))
				var/obj/structure/bed/bdsm_bed/assembled_bed = new
				assembled_bed.loc = loc
				qdel(src)
			return
	else
		return ..()
=======
	flags_1 = NODECONSTRUCT_1

/obj/item/bdsm_bed_kit
	name = "bdsm bed construction kit"
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	throwforce = 0
	icon_state = "bdsm_bed_kit"
	w_class = WEIGHT_CLASS_HUGE

/obj/item/bdsm_bed_kit/CtrlShiftClick(mob/user)
	. = ..()
	if(. == FALSE)
		return FALSE

	add_fingerprint(user)
	if((item_flags & IN_INVENTORY) || (item_flags & IN_STORAGE))
		return FALSE

	to_chat(user, span_notice("You fasten the frame to the floor and begin to inflate the latex pillows..."))
	if(!do_after(user, 8 SECONDS, src))
		to_chat(user, span_warning("You fail to assemble [src]."))
		return FALSE

	to_chat(user, span_notice("You assemble [src]."))
	var/obj/structure/bed/bdsm_bed/assembled_bed = new
	assembled_bed.forceMove(loc)
	qdel(src)

	return TRUE

/obj/item/bdsm_bed_kit/examine(mob/user)
	. = ..()
	. += span_purple("[src] can be assembled by using Ctrl+Shift+Click while [src] is on the floor.")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/structure/bed/bdsm_bed/post_buckle_mob(mob/living/affected_mob)
	density = TRUE
	//Push them up from the normal lying position
	affected_mob.pixel_y = affected_mob.base_pixel_y

/obj/structure/bed/bdsm_bed/post_unbuckle_mob(mob/living/affected_mob)
	density = FALSE
	//Set them back down to the normal lying position
	affected_mob.pixel_y = affected_mob.base_pixel_y + affected_mob.body_position_pixel_y_offset

<<<<<<< HEAD
/obj/structure/bed/bdsm_bed/attackby(obj/item/used_item, mob/user, params) //deconstructing a bed. Aww(
	add_fingerprint(user)
	if(istype(used_item, /obj/item/wrench))
		to_chat(user, span_notice("You begin unfastening the frame of bdsm bed and deflating the latex pillows..."))
		if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
			to_chat(user, span_notice("You disassemble the BDSM bed."))
			var/obj/item/bdsm_bed_kit/created_kit = new
			created_kit.loc = loc
			unbuckle_all_mobs()
			qdel(src)
		return
	else
		return ..()

/obj/structure/bed/bdsm_bed/Destroy()
	. = ..()
	unbuckle_all_mobs(TRUE)
=======
/obj/structure/bed/bdsm_bed/CtrlShiftClick(mob/user)
	. = ..()
	if(. == FALSE)
		return FALSE

	add_fingerprint(user)
	to_chat(user, span_notice("You begin unfastening the frame of [src] and deflating the latex pillows..."))
	if(!do_after(user, 8 SECONDS, src))
		to_chat(user, span_warning("You fail to disassemble [src]."))
		return FALSE

	to_chat(user, span_notice("You disassemble [src]."))
	var/obj/item/construction_kit/bdsm/bed/created_kit = new
	created_kit.forceMove(loc)
	qdel(src)

	return TRUE

/obj/structure/bed/bdsm_bed/Destroy()
	unbuckle_all_mobs(TRUE)
	return ..()

/obj/structure/bed/bdsm_bed/examine(mob/user)
	. = ..()
	. += span_purple("[src] can be disassembled by using Ctrl+Shift+Click")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/*
*	X-STAND
*/

/obj/structure/chair/x_stand
	name = "x stand"
	desc = "A stand for buckling people in an X shape."
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	icon_state = "xstand_open"
	base_icon_state = "xstand"
	max_buckled_mobs = 1
	max_integrity = 75
<<<<<<< HEAD
	var/stand_state = "open"
	var/stand_open = FALSE
	var/list/stand_states = list("open" = "close", "close" = "open")
	var/state_thing = "open"
	var/static/mutable_appearance/xstand_overlay = mutable_appearance('modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi', "xstand_overlay", LYING_MOB_LAYER)
	var/mob/living/carbon/human/current_mob = null
=======
	///What state is the stand currently in? This is here for sprites.
	var/stand_state = "open"
	///What overlay is the stand using when stand_state is set to closed?
	var/static/mutable_appearance/xstand_overlay = mutable_appearance('modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi', "xstand_overlay", LYING_MOB_LAYER)
	///What human is currently buckled in?
	var/mob/living/carbon/human/current_mob = null
	item_chair = null
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

//to make it have model when we constructing the thingy
/obj/structure/chair/x_stand/Initialize(mapload)
	. = ..()
	update_icon_state()
	update_icon()

/obj/structure/chair/x_stand/Destroy()
<<<<<<< HEAD
	. = ..()
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(current_mob)
		if(current_mob.handcuffed)
			current_mob.handcuffed.dropped(current_mob)
		current_mob.set_handcuffed(null)
		current_mob.update_abstract_handcuffed()
	unbuckle_all_mobs(TRUE)
<<<<<<< HEAD
=======
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/structure/chair/x_stand/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[stand_state? "open" : "close"]"

//X-Stand LBM interaction handler
/obj/structure/chair/x_stand/attack_hand(mob/living/user)
<<<<<<< HEAD
	var/mob/living/affected_mob = locate() in src.loc
	// X-Stand is empty?
	if(!has_buckled_mobs())
		// Is there someone on the X-Stand tile?
		if(affected_mob)
			// Can a mob in a X-Stand tile be buckled?
			if(affected_mob.can_buckle_to)
				user_buckle_mob(affected_mob, user, check_loc = TRUE)
			else
				// The X-Stand is empty, but there is a mob in the X-Stand tile that cannot be buckled
				// A place to report the impossibility to buckle the current mob in X-Stand
		else
			// The stand is empty, there is no one in the tile. We just change the state of the stand.
			toggle_mode(user)
	else
		// The X-Stand is not empty. Get the mob in the X-Stand and try to unbuckle it.
		var/mob/living/buckled_mob = buckled_mobs[1]
		user_unbuckle_mob(buckled_mob, user)

=======
	if(has_buckled_mobs())
		var/mob/living/buckled_mob = buckled_mobs[1]
		user_unbuckle_mob(buckled_mob, user)
		return TRUE

	var/mob/living/affected_mob = locate() in loc
	if(!affected_mob)
		toggle_mode(user)
		return TRUE

	// Can a mob in a X-Stand tile be buckled?
	if(affected_mob.can_buckle_to)
		user_buckle_mob(affected_mob, user, check_loc = TRUE)
		return TRUE
	else
		return FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

// Another plug to disable rotation
/obj/structure/chair/x_stand/attack_tk(mob/user)
	return FALSE

// Handler for attempting to unbuckle a mob from a X-Stand
/obj/structure/chair/x_stand/user_unbuckle_mob(mob/living/buckled_mob, mob/living/user)
	// Let's make sure that the X-Stand is in the correct state
<<<<<<< HEAD
	if(stand_state == "open")
		toggle_mode(user)
	var/mob/living/affected_mob = unbuckle_mob(buckled_mob)
	if(affected_mob)
		if(affected_mob != user)
			if(!do_after(user, 5 SECONDS, affected_mob)) // Timer for unbuckling one mob with another mob
				// Place to describe failed attempt
				return FALSE
			// Description of a successful attempt
			affected_mob.visible_message(span_notice("[user] unbuckles [affected_mob] from [src]."),\
				span_notice("[user] unbuckles you from [src]."),\
				span_hear("You hear metal clanking."))
			// Description of a successful mob attempt to unbuckle one mob with another mob
		else
			// Description of a successful mob attempt to unbuckle itself
			user.visible_message(span_notice("You unbuckle yourself from [src]."),\
				span_hear("You hear metal clanking."))
		add_fingerprint(user)
		if(isliving(affected_mob.pulledby))
			var/mob/living/pulling_mob = affected_mob.pulledby
			pulling_mob.set_pull_offsets(affected_mob, pulling_mob.grab_state)
		toggle_mode(user)
	return affected_mob

// Handler for attempting to buckle a mob into a X-Stand
/obj/structure/chair/x_stand/user_buckle_mob(mob/living/affected_mob, mob/user, check_loc = TRUE)
	// Let's make sure that the X-Stand is in the correct state
	if(stand_state == "close")
=======
	if(stand_state == X_STAND_OPEN_STATE)
		toggle_mode(user)

	if(!buckled_mob)
		return FALSE

	if(buckled_mob != user)
		if(!do_after(user, 5 SECONDS, buckled_mob)) // Timer for unbuckling one mob with another mob
			to_chat(user, span_warning("You fail to unbuckle [buckled_mob] from [src]."))
			return FALSE

		buckled_mob.visible_message(span_notice("[user] unbuckles [buckled_mob] from [src]."),\
			span_notice("[user] unbuckles you from [src]."),\
			span_hear("You hear metal clanking."))

	else
		if(!do_after(user, 10 SECONDS, buckled_mob)) // Timer for unbuckling one mob with another mob
			to_chat(user, span_warning("You fail to unbuckle yourself from [src]."))
			return FALSE

		user.visible_message(span_notice("You unbuckle yourself from [src]."),\
			span_hear("You hear metal clanking."))

	unbuckle_mob(buckled_mob)

	add_fingerprint(user)
	if(isliving(buckled_mob.pulledby))
		var/mob/living/pulling_mob = buckled_mob.pulledby
		pulling_mob.set_pull_offsets(buckled_mob, buckled_mob.grab_state)

	toggle_mode(user)
	return buckled_mob

// Handler for attempting to buckle a mob into a X-Stand
/obj/structure/chair/x_stand/user_buckle_mob(mob/living/affected_mob, mob/user, check_loc = TRUE)
	if(stand_state == X_STAND_CLOSED_STATE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		toggle_mode(user)
		//return  // Uncomment if it is necessary to "open" the X-Stand as a separate action before buckling

	// Is buckling even possible? Do a full suite of checks.
	if(!is_user_buckle_possible(affected_mob, user, check_loc))
		return FALSE
	add_fingerprint(user)

<<<<<<< HEAD
	// If the mob we're attempting to buckle is not stood on this atom's turf and it isn't the user buckling themselves,
	// we'll try it with a 2 second do_after delay.
	if(affected_mob != user)
		// Place to describe an attempt to buckle a mob
		affected_mob.visible_message(span_warning("[user] starts buckling [affected_mob] to [src]!"),\
			span_userdanger("[user] starts buckling you to [src]!"),\
			span_hear("You hear metal clanking."))
		if(!do_after(user, 5 SECONDS, affected_mob)) // Timer to buckle one mob by another
			// Place to describe a failed buckling attempt
			return FALSE

		// Sanity check before we attempt to buckle. Is everything still in a kosher state for buckling after the 3 seconds have elapsed?
		// Covers situations where, for example, the chair was moved or there's some other issue.
		if(!is_user_buckle_possible(affected_mob, user, check_loc))
			// A place to report the inability to buckle a mob
			return FALSE


		// Place to insert a description of a successful attempt for a user mob
		if(buckle_mob(affected_mob, check_loc = check_loc))
			// Description of a successful attempt to buckle a mob by another mob
			affected_mob.visible_message(span_warning("[user] starts buckling [affected_mob] to [src]!"),\
				span_userdanger("[user] starts buckling you to [src]!"),\
				span_hear("You hear metal clanking."))
		toggle_mode(user)

	else
		if(!do_after(user, 10 SECONDS, affected_mob)) // Timer to buckle the mob itself
			// Place to describe failed attempt
			return FALSE

		// Sanity check before we attempt to buckle. Is everything still in a kosher state for buckling after the 3 seconds have elapsed?
		// Covers situations where, for example, the chair was moved or there's some other issue.
		if(!is_user_buckle_possible(affected_mob, user, check_loc))
			// Place to report the inability to buckle
			return FALSE

		if(buckle_mob(affected_mob, check_loc = check_loc))
			user.visible_message(span_warning("You buckles yourself to [src]!"),\
				span_hear("You hear metal clanking."))
		toggle_mode(user)

// X-Stand state switch processing
/obj/structure/chair/x_stand/proc/toggle_mode(mob/user)
	state_thing = stand_states[state_thing]
	switch(state_thing)
		if("open")
			stand_state = "open"
			cut_overlay(xstand_overlay)
		if("close")
			stand_state = "close"
			add_overlay(xstand_overlay)
=======
	if(affected_mob == user)
		if(!do_after(user, 10 SECONDS, affected_mob)) // Timer to buckle the mob itself
			to_chat(user, span_warning("You fail to buckle yourself to [src]!"))
			return FALSE

		if(!is_user_buckle_possible(affected_mob, user, check_loc))
			to_chat(user, span_warning("You are unable to buckle yourself to [src]!"))
			return FALSE

		if(buckle_mob(affected_mob, check_loc = check_loc))
			user.visible_message(span_warning("You buckle yourself to [src]!"),\
				span_hear("You hear metal clanking."))

		toggle_mode(user)
		return TRUE

	affected_mob.visible_message(span_warning("[user] starts buckling [affected_mob] to [src]!"),\
		span_userdanger("[user] starts buckling you to [src]!"),\
		span_hear("You hear metal clanking."))

	if(!do_after(user, 5 SECONDS, affected_mob)) // Timer to buckle one mob by another
		to_chat(user, span_warning("You fail to buckle [affected_mob] to [src]!"))
		return FALSE

	// Sanity check before we attempt to buckle. Is everything still in a kosher state for buckling after the 3 seconds have elapsed?
	// Covers situations where, for example, the chair was moved or there's some other issue.
	if(!is_user_buckle_possible(affected_mob, user, check_loc))
		to_chat(user, span_warning("You are unable to buckle [affected_mob] to [src]!"))
		return FALSE

	// Place to insert a description of a successful attempt for a user mob
	if(!buckle_mob(affected_mob, check_loc = check_loc))
		return FALSE

	affected_mob.visible_message(span_warning("[user] buckled [affected_mob] to [src]!"),\
		span_userdanger("[user] buckled you to [src]!"),\
		span_hear("You hear metal clanking."))

	toggle_mode(user)
	return TRUE

// X-Stand state switch processing
/obj/structure/chair/x_stand/proc/toggle_mode(mob/user)
	if(stand_state == X_STAND_CLOSED_STATE)
		stand_state = X_STAND_OPEN_STATE
		cut_overlay(xstand_overlay)
	else
		stand_state = X_STAND_CLOSED_STATE
		add_overlay(xstand_overlay)

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	add_fingerprint(user)
	update_icon_state()
	update_icon()
	playsound(loc, 'sound/weapons/magin.ogg', 20, TRUE)

<<<<<<< HEAD

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
//Place the mob in the desired position after buckling
/obj/structure/chair/x_stand/post_buckle_mob(mob/living/affected_mob)
	affected_mob.pixel_y = affected_mob.base_pixel_y
	affected_mob.pixel_x = affected_mob.base_pixel_x
	affected_mob.layer = BELOW_MOB_LAYER

	if(LAZYLEN(buckled_mobs))
		if(ishuman(buckled_mobs[1]))
			current_mob = buckled_mobs[1]

<<<<<<< HEAD
	if(current_mob)
		if(current_mob.handcuffed)
			current_mob.handcuffed.forceMove(loc)
			current_mob.handcuffed.dropped(current_mob)
			current_mob.set_handcuffed(null)
			current_mob.update_handcuffed()
		current_mob.set_handcuffed(new /obj/item/restraints/handcuffs/milker(current_mob))
		current_mob.handcuffed.parented_struct = src
		current_mob.update_abstract_handcuffed()
=======
	if(!current_mob)
		return FALSE

	if(current_mob.handcuffed)
		current_mob.handcuffed.forceMove(loc)
		current_mob.handcuffed.dropped(current_mob)
		current_mob.set_handcuffed(null)
		current_mob.update_handcuffed()

	var/obj/item/restraints/handcuffs/milker/cuffs = new (current_mob)
	current_mob.set_handcuffed(cuffs)
	cuffs.parent_chair = WEAKREF(src)
	current_mob.update_abstract_handcuffed()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

//Restore the position of the mob after unbuckling.
/obj/structure/chair/x_stand/post_unbuckle_mob(mob/living/affected_mob)
	affected_mob.pixel_x = affected_mob.base_pixel_x + affected_mob.body_position_pixel_x_offset
	affected_mob.pixel_y = affected_mob.base_pixel_y + affected_mob.body_position_pixel_y_offset
	affected_mob.layer = initial(affected_mob.layer)

<<<<<<< HEAD
	if(current_mob)
		if(current_mob.handcuffed)
			current_mob.handcuffed.dropped(current_mob)
		current_mob.set_handcuffed(null)
		current_mob.update_abstract_handcuffed()
=======
	if(!current_mob)
		return FALSE

	if(current_mob.handcuffed)
		current_mob.handcuffed.dropped(current_mob)

	current_mob.set_handcuffed(null)
	current_mob.update_abstract_handcuffed()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	current_mob = null

/*
*	X-STAND CONSTRUCTION KIT
*/

<<<<<<< HEAD
/obj/item/x_stand_kit
	name = "xstand construction kit"
	desc = "Construction requires a wrench."
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	throwforce = 0
	icon_state = "xstand_kit"
	var/unwrapped = 0
	w_class = WEIGHT_CLASS_HUGE

/obj/item/x_stand_kit/attackby(obj/item/used_item, mob/user, params) //constructing a bed here.
	add_fingerprint(user)
	if(istype(used_item, /obj/item/wrench))
		if (!(item_flags & IN_INVENTORY) && !(item_flags & IN_STORAGE))
			to_chat(user, span_notice("You begin fastening the frame to the floor."))
			if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
				to_chat(user, span_notice("You assemble the x-stand."))
				new /obj/structure/chair/x_stand(get_turf(user))
				qdel(src)
			return
	else
		return ..()

/obj/structure/chair/x_stand/attackby(obj/item/used_item, mob/user, params) //deconstructing a bed. Aww(
	add_fingerprint(user)
	if(istype(used_item, /obj/item/wrench))
		to_chat(user, span_notice("You begin unfastening the frame of x-stand..."))
		if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
			to_chat(user, span_notice("You disassemble the x-stand."))
			new /obj/item/x_stand_kit(get_turf(user))
			unbuckle_all_mobs()
			qdel(src)
		return
	else
		return ..()
=======
/obj/structure/chair/x_stand/CtrlShiftClick(mob/user)
	. = ..()
	if(. == FALSE)
		return FALSE

	add_fingerprint(user)
	to_chat(user, span_notice("You begin unfastening the frame of [src]..."))
	if(!do_after(user, 8 SECONDS, src))
		return FALSE

	to_chat(user, span_notice("You disassemble [src]."))
	new /obj/item/construction_kit/bdsm/x_stand(loc)
	unbuckle_all_mobs()
	qdel(src)
	return TRUE

/obj/structure/chair/x_stand/examine(mob/user)
	. = ..()
	. += span_purple("[src] can be disassembled by using Ctrl+Shift+Click")

#undef X_STAND_CLOSED_STATE
#undef X_STAND_OPEN_STATE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
