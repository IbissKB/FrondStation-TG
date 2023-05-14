<<<<<<< HEAD
/obj/item/modular_computer/attack_self(mob/user)
	. = ..()
	ui_interact(user)

// Operates TGUI
/obj/item/modular_computer/ui_interact(mob/user, datum/tgui/ui)
	if(!enabled)
		if(ui)
			ui.close()
		return
	if(!use_power())
		if(ui)
			ui.close()
		return

	if(!user.can_read(src, READING_CHECK_LITERACY))
		return

	if(ishuman(user) && !allow_chunky)
		var/mob/living/carbon/human/human_user = user
		if(human_user.check_chunky_fingers())
			balloon_alert(human_user, "fingers are too big!")
			return
=======
/**
 * update_tablet_open_uis
 *
 * Will search the user to see if they have the tablet open.
 * If they don't, we'll open a new UI depending on the tab the tablet is meant to be on.
 * If they do, we'll update the interface and title, then update all static data and re-send assets.
 *
 * This is best called when you're actually changing the app, as we don't check
 * if we're swapping to the current UI repeatedly.
 * Args:
 * user - The person whose UI we're updating.
 */
/obj/item/modular_computer/proc/update_tablet_open_uis(mob/user)
	var/datum/tgui/active_ui = SStgui.get_open_ui(user, src)
	if(!active_ui)
		if(active_program)
			active_ui = new(user, src, active_program.tgui_id, active_program.filedesc)
		else
			active_ui = new(user, src, "NtosMain")
		return active_ui.open()

	if(active_program)
		active_ui.interface = active_program.tgui_id
		active_ui.title = active_program.filedesc
	else
		active_ui.interface = "NtosMain"

	update_static_data(user, active_ui)
	active_ui.send_assets()

/obj/item/modular_computer/interact(mob/user)
	if(enabled)
		ui_interact(user)
	else
		turn_on(user)

// Operates TGUI
/obj/item/modular_computer/ui_interact(mob/user, datum/tgui/ui)
	if(!enabled || !user.can_read(src, READING_CHECK_LITERACY) || !use_power())
		if(ui)
			ui.close()
		return
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	// Robots don't really need to see the screen, their wireless connection works as long as computer is on.
	if(!screen_on && !issilicon(user))
		if(ui)
			ui.close()
		return

<<<<<<< HEAD
	// If we have an active program switch to it now.
	if(active_program)
		if(ui) // This is the main laptop screen. Since we are switching to program's UI close it for now.
			ui.close()
		active_program.ui_interact(user)
		return

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(honkvirus_amount > 0) // EXTRA annoying, huh!
		honkvirus_amount--
		playsound(src, 'sound/items/bikehorn.ogg', 30, TRUE)

	ui = SStgui.try_update_ui(user, src, ui)
<<<<<<< HEAD
	if (!ui)
		ui = new(user, src, "NtosMain")
		ui.set_autoupdate(TRUE)
		if(ui.open())
			ui.send_asset(get_asset_datum(/datum/asset/simple/headers))

/obj/item/modular_computer/ui_static_data(mob/user)
	. = ..()
	var/list/data = list()

	data["show_imprint"] = istype(src, /obj/item/modular_computer/pda)

=======
	if(!ui)
		update_tablet_open_uis(user)

/obj/item/modular_computer/ui_assets(mob/user)
	var/list/data = list()
	data += get_asset_datum(/datum/asset/simple/headers)
	if(active_program)
		data += active_program.ui_assets(user)
	return data

/obj/item/modular_computer/ui_static_data(mob/user)
	var/list/data = list()
	if(active_program)
		data += active_program.ui_static_data(user)
		return data

	data["show_imprint"] = istype(src, /obj/item/modular_computer/pda)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return data

/obj/item/modular_computer/ui_data(mob/user)
	var/list/data = get_header_data()
<<<<<<< HEAD
	data["device_theme"] = device_theme
=======
	if(active_program)
		data += active_program.ui_data(user)
		return data

	data["pai"] = inserted_pai
	data["has_light"] = has_light
	data["light_on"] = light_on
	data["comp_light_color"] = comp_light_color
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	data["login"] = list(
		IDName = saved_identification || "Unknown",
		IDJob = saved_job || "Unknown",
	)

	data["proposed_login"] = list(
		IDName = computer_id_slot?.registered_name,
		IDJob = computer_id_slot?.assignment,
	)

<<<<<<< HEAD

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	data["removable_media"] = list()
	if(inserted_disk)
		data["removable_media"] += "Eject Disk"
	var/datum/computer_file/program/ai_restorer/airestore_app = locate() in stored_files
	if(airestore_app?.stored_card)
		data["removable_media"] += "intelliCard"

	data["programs"] = list()
<<<<<<< HEAD
	for(var/datum/computer_file/program/P in stored_files)
		var/running = FALSE
		if(P in idle_threads)
			running = TRUE

		data["programs"] += list(list(
			"name" = P.filename,
			"desc" = P.filedesc,
			"running" = running,
			"icon" = P.program_icon,
			"alert" = P.alert_pending,
		))

	data["has_light"] = has_light
	data["light_on"] = light_on
	data["comp_light_color"] = comp_light_color
	data["pai"] = inserted_pai
	return data


// Handles user's GUI input
/obj/item/modular_computer/ui_act(action, params)
=======
	for(var/datum/computer_file/program/program in stored_files)
		data["programs"] += list(list(
			"name" = program.filename,
			"desc" = program.filedesc,
			"header_program" = program.header_program,
			"running" = !!(program in idle_threads),
			"icon" = program.program_icon,
			"alert" = program.alert_pending,
		))

	return data

// Handles user's GUI input
/obj/item/modular_computer/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(.)
		return

<<<<<<< HEAD
	switch(action)
		if("PC_exit")
			kill_program()
=======
	if(ishuman(usr) && !allow_chunky)
		var/mob/living/carbon/human/human_user = usr
		if(human_user.check_chunky_fingers())
			balloon_alert(human_user, "fingers are too big!")
			return TRUE

	switch(action)
		if("PC_exit")
			active_program.kill_program()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			return TRUE
		if("PC_shutdown")
			shutdown_computer()
			return TRUE
		if("PC_minimize")
<<<<<<< HEAD
			var/mob/user = usr
			if(!active_program)
				return

			idle_threads.Add(active_program)
			active_program.program_state = PROGRAM_STATE_BACKGROUND // Should close any existing UIs

			active_program = null
			update_appearance()
			if(user && istype(user))
				ui_interact(user) // Re-open the UI on this computer. It should show the main screen now.

		if("PC_killprogram")
			var/prog = params["name"]
			var/datum/computer_file/program/P = null
			var/mob/user = usr
			P = find_file_by_name(prog)

			if(!istype(P) || P.program_state == PROGRAM_STATE_KILLED)
				return

			P.kill_program(forced = TRUE)
			to_chat(user, span_notice("Program [P.filename].[P.filetype] with PID [rand(100,999)] has been killed."))

		if("PC_runprogram")
			open_program(usr, find_file_by_name(params["name"]))

		if("PC_toggle_light")
			return toggle_flashlight()
=======
			if(!active_program)
				return
			active_program.background_program()
			return TRUE

		if("PC_killprogram")
			var/prog = params["name"]
			var/datum/computer_file/program/killed_program = find_file_by_name(prog)

			if(!istype(killed_program))
				return

			killed_program.kill_program()
			to_chat(usr, span_notice("Program [killed_program.filename].[killed_program.filetype] with PID [rand(100,999)] has been killed."))
			return TRUE

		if("PC_runprogram")
			open_program(usr, find_file_by_name(params["name"]))
			return TRUE

		if("PC_toggle_light")
			toggle_flashlight()
			return TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

		if("PC_light_color")
			var/mob/user = usr
			var/new_color
			while(!new_color)
				new_color = input(user, "Choose a new color for [src]'s flashlight.", "Light Color",light_color) as color|null
				if(!new_color)
					return
				if(is_color_dark(new_color, 50) ) //Colors too dark are rejected
					to_chat(user, span_warning("That color is too dark! Choose a lighter one."))
					new_color = null
<<<<<<< HEAD
			return set_flashlight_color(new_color)
=======
			set_flashlight_color(new_color)
			return TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

		if("PC_Eject_Disk")
			var/param = params["name"]
			var/mob/user = usr
			switch(param)
				if("Eject Disk")
					if(!inserted_disk)
						return

					user.put_in_hands(inserted_disk)
					inserted_disk = null
					playsound(src, 'sound/machines/card_slide.ogg', 50)
					return TRUE

				if("intelliCard")
					var/datum/computer_file/program/ai_restorer/airestore_app = locate() in stored_files
					if(!airestore_app)
						return

					if(airestore_app.try_eject(user))
						playsound(src, 'sound/machines/card_slide.ogg', 50)
						return TRUE

				if("ID")
<<<<<<< HEAD
					if(RemoveID())
=======
					if(RemoveID(user))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
						playsound(src, 'sound/machines/card_slide.ogg', 50)
						return TRUE

		if("PC_Imprint_ID")
			saved_identification = computer_id_slot.registered_name
			saved_job = computer_id_slot.assignment
			UpdateDisplay()
			playsound(src, 'sound/machines/terminal_processing.ogg', 15, TRUE)

		if("PC_Pai_Interact")
			switch(params["option"])
				if("eject")
					usr.put_in_hands(inserted_pai)
					to_chat(usr, span_notice("You remove [inserted_pai] from the [name]."))
					inserted_pai = null
					update_appearance(UPDATE_ICON)
				if("interact")
					inserted_pai.attack_self(usr)
<<<<<<< HEAD
			return UI_UPDATE
		else
			return
=======
			return TRUE

	if(active_program)
		return active_program.ui_act(action, params, ui, state)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/modular_computer/ui_host()
	if(physical)
		return physical
	return src
