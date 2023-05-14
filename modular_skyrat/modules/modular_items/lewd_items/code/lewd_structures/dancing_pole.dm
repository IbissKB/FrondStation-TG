<<<<<<< HEAD
//skyrat-tg got the BEST dancing pole in whole SS13. Be jealous of us!

/obj/structure/pole
=======
/obj/structure/stripper_pole
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "stripper pole"
	desc = "A pole fastened to the ceiling and floor, used to show of one's goods to company."
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/dancing_pole.dmi'
	icon_state = "pole_purple_off"
	base_icon_state = "pole"
	density = TRUE
	anchored = TRUE
	max_integrity = 75
<<<<<<< HEAD
	var/icon_state_inuse
	layer = 4 //make it the same layer as players.
	pseudo_z_axis = 9 //stepping onto the pole makes you raise upwards!
	density = 0 //easy to step up on
	var/pole_on = FALSE //lights model turned off
=======
	layer = BELOW_MOB_LAYER
	pseudo_z_axis = 9 //stepping onto the pole makes you raise upwards!
	density = 0 //easy to step up on
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	light_system = STATIC_LIGHT
	light_range = 3
	light_power = 1
	light_color = COLOR_LIGHT_PINK
	light_on = FALSE
<<<<<<< HEAD
	var/mob/living/actual_user = null
	var/current_pole_color = "purple"
	var/static/list/pole_designs
	var/static/list/polelights = list(
=======
	/// Are the animated lights enabled?
	var/lights_enabled = FALSE
	/// The mob currently using the pole to dance
	var/mob/living/dancer = null
	/// The selected pole color
	var/current_pole_color = "purple"
	/// Possible designs for the pole, populating a radial selection menu
	var/static/list/pole_designs
	/// Possible colors for the pole
	var/static/list/pole_lights = list(
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
								"purple" = COLOR_LIGHT_PINK,
								"cyan" = COLOR_CYAN,
								"red" = COLOR_RED,
								"green" = COLOR_GREEN,
<<<<<<< HEAD
								"white" = COLOR_WHITE)//list of colors to choose

//to change color of pole by using multitool
//create radial menu
/obj/structure/pole/proc/populate_pole_designs()
=======
								"white" = COLOR_WHITE,
								)


/obj/structure/stripper_pole/examine(mob/user)
	. = ..()
	. += "The lights are currently <b>[lights_enabled ? "ON" : "OFF"]</b> and could be [lights_enabled ? "dis" : "en"]abled with <b>Alt-Click</b>."


/// The list of possible designs generated for the radial reskinning menu
/obj/structure/stripper_pole/proc/populate_pole_designs()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	pole_designs = list(
		"purple" = image(icon = src.icon, icon_state = "pole_purple_on"),
		"cyan" = image(icon = src.icon, icon_state = "pole_cyan_on"),
		"red" = image(icon = src.icon, icon_state = "pole_red_on"),
		"green" = image(icon = src.icon, icon_state = "pole_green_on"),
		"white" = image(icon = src.icon, icon_state = "pole_white_on"),
	)

<<<<<<< HEAD
//using multitool on pole
/obj/structure/pole/multitool_act(mob/living/user, obj/item/used_item)
	. = ..()
	if(.)
		return
	var/choice = show_radial_menu(user, src, pole_designs, custom_check = CALLBACK(src, PROC_REF(check_menu), user, used_item), radius = 50, require_near = TRUE)
	if(!choice)
		return FALSE
	current_pole_color = choice
	light_color = polelights[choice]
	update_icon()
	update_brightness()

/obj/structure/pole/proc/check_menu(mob/living/user, obj/item/multitool)
	if(!istype(user))
		return FALSE
	if(user.incapacitated())
		return FALSE
	if(!multitool || !user.is_holding(multitool))
		return FALSE
	return TRUE

//to enable lights by aliclick
/obj/structure/pole/AltClick(mob/user)
	pole_on = !pole_on
	to_chat(user, span_notice("You turn the lights [pole_on? "on. Woah..." : "off."]"))
	playsound(user, pole_on ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)
=======

/obj/structure/stripper_pole/CtrlClick(mob/user)
	. = ..()
	if(. == FALSE)
		return FALSE

	var/choice = show_radial_menu(user, src, pole_designs, radius = 50, require_near = TRUE)
	if(!choice)
		return FALSE
	current_pole_color = choice
	light_color = pole_lights[choice]
	update_icon()
	update_brightness()
	return TRUE


// Alt-click to turn the lights on or off.
/obj/structure/stripper_pole/AltClick(mob/user)
	lights_enabled = !lights_enabled
	balloon_alert(user, "lights [lights_enabled ? "on" : "off"]")
	playsound(user, lights_enabled ? 'sound/weapons/magin.ogg' : 'sound/weapons/magout.ogg', 40, TRUE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	update_icon_state()
	update_icon()
	update_brightness()

<<<<<<< HEAD
/obj/structure/pole/Initialize(mapload)
=======

/obj/structure/stripper_pole/Initialize(mapload)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	update_icon_state()
	update_icon()
	update_brightness()
	if(!length(pole_designs))
		populate_pole_designs()

<<<<<<< HEAD
/obj/structure/pole/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[current_pole_color]_[pole_on? "on" : "off"]"

/obj/structure/pole/proc/update_brightness()
	set_light_on(pole_on)
	update_light()

//trigger dance if character uses LBM
/obj/structure/pole/attack_hand(mob/living/user)
=======

/obj/structure/stripper_pole/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state]_[current_pole_color]_[lights_enabled ? "on" : "off"]"

/// Turns off/on the pole's ambient light source
/obj/structure/stripper_pole/proc/update_brightness()
	set_light_on(lights_enabled)
	update_light()


//trigger dance if character uses LBM
/obj/structure/stripper_pole/attack_hand(mob/living/user)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(.)
		return
	if(obj_flags & IN_USE)
<<<<<<< HEAD
		to_chat(user, "[src] is already in use!")
		return
	else
		obj_flags |= IN_USE
		actual_user = user
		user.setDir(SOUTH)
		user.Stun(100)
		user.forceMove(src.loc)
		user.visible_message(pick(span_purple("[user] dances on [src]!"), span_purple("[user] flexes their hip-moving skills on [src]!")))
		animatepole(user)
		user.layer = layer //set them to the poles layer
		obj_flags &= ~IN_USE
		user.pixel_y = 0
		user.pixel_z = pseudo_z_axis //incase we are off it when we jump on!
		actual_user = null
		icon_state = "[initial(icon_state)]_[current_pole_color]_[pole_on? "on" : "off"]"

/obj/structure/pole/proc/animatepole(mob/living/user)

=======
		balloon_alert(user, "already in use!")
		return
	obj_flags |= IN_USE
	dancer = user
	user.setDir(SOUTH)
	user.Stun(10 SECONDS)
	user.forceMove(loc)
	user.visible_message(pick(span_purple("[user] dances on [src]!"), span_purple("[user] flexes their hip-moving skills on [src]!")))
	dance_animate(user)
	obj_flags &= ~IN_USE
	user.pixel_y = 0
	user.pixel_z = pseudo_z_axis //incase we are off it when we jump on!
	dancer = null

/// The proc used to make the user 'dance' on the pole. Basically just consists of pixel shifting them around a bunch and sleeping. Could probably be improved a lot.
/obj/structure/stripper_pole/proc/dance_animate(mob/living/user)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(user.loc != src.loc)
		return
	if(!QDELETED(src))
		animate(user, pixel_x = -6, pixel_y = 0, time = 10)
		sleep(2 SECONDS)
		user.dir = 4
	if(!QDELETED(src))
		animate(user, pixel_x = -6, pixel_y = 24, time = 10)
		sleep(1.2 SECONDS)
		src.layer = 4.01 //move the pole infront for now. better to move the pole, because the character moved behind people sitting above otherwise
	if(!QDELETED(src))
		animate(user, pixel_x = 6, pixel_y = 12, time = 5)
		user.dir = 8
		sleep(0.6 SECONDS)
	if(!QDELETED(src))
		animate(user, pixel_x = -6, pixel_y = 4, time = 5)
		user.dir = 4
		src.layer = 4 // move it back.
		sleep(0.6 SECONDS)
	if(!QDELETED(src))
		user.dir = 1
		animate(user, pixel_x = 0, pixel_y = 0, time = 3)
		sleep(0.6 SECONDS)
	if(!QDELETED(src))
		user.do_jitter_animation()
		sleep(0.6 SECONDS)
		user.dir = 2

<<<<<<< HEAD
/obj/structure/pole/Destroy()
	. = ..()
	if(actual_user)
		actual_user.SetStun(0)
		actual_user.pixel_y = 0
		actual_user.pixel_z = pseudo_z_axis
		actual_user.layer = layer
		actual_user.forceMove(get_turf(src))

/obj/item/polepack
	name = "pink stripper pole flatpack"
	desc = "Construction requires a wrench."
	icon = 'modular_skyrat/modules/modular_items/lewd_items/icons/obj/lewd_structures/dancing_pole.dmi'
	throwforce = 0
	icon_state = "pole_base"
	var/unwrapped = 0
	w_class = WEIGHT_CLASS_HUGE

/obj/item/polepack/attackby(obj/item/used_item, mob/user, params) //erecting a pole here.
	add_fingerprint(user)
	if(istype(used_item, /obj/item/wrench))
		if (!(item_flags & IN_INVENTORY) && !(item_flags & IN_STORAGE))
			to_chat(user, span_notice("You begin fastening the frame to the floor and ceiling..."))
			if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
				to_chat(user, span_notice("You assemble the stripper pole."))
				new /obj/structure/pole(get_turf(user))
				qdel(src)
			return
	else
		return ..()

/obj/structure/pole/attackby(obj/item/used_item, mob/user, params) //un-erecting a pole. :(
	add_fingerprint(user)
	if(istype(used_item, /obj/item/wrench))
		to_chat(user, span_notice("You begin unfastening the frame from the floor and ceiling..."))
		if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
			to_chat(user, span_notice("You disassemble the stripper pole."))
			new /obj/item/polepack(get_turf(user))
			qdel(src)
		return
	else
		return ..()
=======

/obj/structure/stripper_pole/Destroy()
	. = ..()
	if(dancer)
		dancer.SetStun(0)
		dancer.pixel_y = 0
		dancer.pixel_x = 0
		dancer.pixel_z = pseudo_z_axis
		dancer.layer = layer
		dancer.forceMove(get_turf(src))
		dancer = null

/obj/structure/stripper_pole/CtrlShiftClick(mob/user)
	. = ..()
	if(. == FALSE)
		return FALSE

	add_fingerprint(user)
	balloon_alert(user, "disassembling...")
	if(!do_after(user, 8 SECONDS, src))
		balloon_alert(user, "disassembly interrupted!")
		return

	balloon_alert(user, "disassembled")
	new /obj/item/construction_kit/pole(get_turf(user))
	qdel(src)
	return TRUE

/obj/structure/stripper_pole/examine(mob/user)
	. = ..()
	. += span_purple("[src] can be disassembled by using Ctrl+Shift+Click")
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
