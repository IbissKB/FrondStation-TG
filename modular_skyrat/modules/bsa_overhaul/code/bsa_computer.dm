<<<<<<< HEAD
//CONTROL COMPUTER
=======
/**
 * The control computer
 *
 * Responsible for cannon firing protocols.
 */
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/computer/bsa_control
	name = "bluespace artillery control"
	use_power = NO_POWER_USE
	circuit = /obj/item/circuitboard/computer/bsa_control
	icon = 'modular_skyrat/modules/fixing_missing_icons/particle_accelerator.dmi'
	icon_state = "control_boxp"
<<<<<<< HEAD
	var/obj/machinery/bsa_powercore/core //The moveable power core link
	var/obj/machinery/bsa/full/cannon
	var/notice
	var/target
=======
	/// A weakref to our cannon
	var/datum/weakref/connected_cannon
	/// The current system status of the gun
	var/notice
	/// Our target... WHY NOT WEEKREFF
	var/atom/target
	/// Are we allowing the gun to target areas?
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/area_aim = FALSE //should also show areas for targeting

	connectable = FALSE //connecting_computer change: since icon_state is not a typical console, it cannot be connectable.

<<<<<<< HEAD
/obj/machinery/computer/bsa_control/multitool_act(mob/living/user, obj/item/I)
	if(!multitool_check_buffer(user, I))
		return
	var/obj/item/multitool/M = I
	if(M.buffer)
		if(istype(M.buffer, /obj/machinery/bsa_powercore))
			if(!cannon)
				to_chat(user, span_warning("There is no cannon linked to this control unit!"))
				return FALSE
			if(core)
				to_chat(user, span_warning("There is already a core linked to this control unit!"))
				return FALSE
			core = M.buffer
			core.control_unit = src
			M.buffer = null
			to_chat(user, span_notice("You link [src] with [core]."))
	else
		to_chat(user, span_warning("[I]'s data buffer is empty!"))
	return TRUE
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/computer/bsa_control/ui_state(mob/user)
	return GLOB.physical_state

/obj/machinery/computer/bsa_control/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
<<<<<<< HEAD
		ui = new(user, src, "BluespaceArtillery", name)
=======
		ui = new(user, src, "BluespaceArtillerySkyrat", name)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		ui.open()

/obj/machinery/computer/bsa_control/ui_data()
	var/list/data = list()
<<<<<<< HEAD
	data["ready"] = cannon ? cannon.ready : FALSE
	data["connected"] = cannon
	data["notice"] = notice
	data["unlocked"] = GLOB.bsa_unlock
=======
	var/obj/machinery/bsa/full/cannon = connected_cannon?.resolve()

	data["connected"] = cannon
	data["notice"] = notice
	data["unlocked"] = GLOB.bsa_unlock
	data["powernet_power"] = cannon?.get_available_powercap()
	data["power_suck_cap"] = cannon?.power_suck_cap
	data["status"] = cannon?.system_state
	data["capacitor_charge"] = cannon?.capacitor_power
	data["target_capacitor_charge"] = cannon?.target_power
	data["max_capacitor_charge"] = cannon?.max_charge
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(target)
		data["target"] = get_target_name()
	return data

/obj/machinery/computer/bsa_control/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("build")
<<<<<<< HEAD
			cannon = deploy()
=======
			deploy()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			. = TRUE
		if("fire")
			fire(usr)
			. = TRUE
		if("recalibrate")
			calibrate(usr)
			. = TRUE
<<<<<<< HEAD
	update_appearance()

=======
		if("charge")
			charge()
		if("capacitor_target_change")
			change_capacitor_target(params["capacitor_target"])
	update_appearance()

/obj/machinery/computer/bsa_control/emag_act(mob/user, obj/item/card/emag/emag_card)
	if(obj_flags & EMAGGED)
		return
	obj_flags |= EMAGGED
	to_chat(user, span_warning("You emag [src] and hear the focusing crystal short out."))

/**
 * Changes the target charge for the internal capacitors
 */
/obj/machinery/computer/bsa_control/proc/change_capacitor_target(new_target)
	var/obj/machinery/bsa/full/cannon = connected_cannon?.resolve()
	if(!cannon)
		return
	cannon.target_power = new_target

/**
 * Takes power from the powernet and inserts it into the gun.
 */
/obj/machinery/computer/bsa_control/proc/charge()
	var/obj/machinery/bsa/full/cannon = connected_cannon?.resolve()
	if(!cannon)
		return
	if(cannon.system_state != BSA_SYSTEM_READY && cannon.system_state != BSA_SYSTEM_LOW_POWER)
		return
	cannon.system_state = BSA_SYSTEM_CHARGE_CAPACITORS

/**
 * Sets a target for the gun to use.
 */
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/computer/bsa_control/proc/calibrate(mob/user)
	if(!GLOB.bsa_unlock)
		return
	var/list/gps_locators = list()
<<<<<<< HEAD
	for(var/datum/component/gps/G in GLOB.GPS_list) //nulls on the list somehow
		if(G.tracking)
			gps_locators[G.gpstag] = G
=======
	for(var/datum/component/gps/iterating_gps in GLOB.GPS_list) //nulls on the list somehow
		if(iterating_gps.tracking)
			gps_locators[iterating_gps.gpstag] = iterating_gps
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	var/list/options = gps_locators
	if(area_aim)
		options += GLOB.teleportlocs
	var/victim = tgui_input_list(user, "Select target", "Artillery Targeting", options)
	if(isnull(victim))
		return
	if(isnull(options[victim]))
		return
	target = options[victim]

<<<<<<< HEAD
=======
/**
 * Returns the targets name, simple.
 */
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/computer/bsa_control/proc/get_target_name()
	if(istype(target, /area))
		return get_area_name(target, TRUE)
	else if(istype(target, /datum/component/gps))
<<<<<<< HEAD
		var/datum/component/gps/G = target
		return G.gpstag

/obj/machinery/computer/bsa_control/proc/get_impact_turf()
	if(istype(target, /area))
		return pick(get_area_turfs(target))
	else if(istype(target, /datum/component/gps))
		var/datum/component/gps/G = target
		return get_turf(G.parent)

/obj/machinery/computer/bsa_control/proc/fire(mob/user)
	if(!core)
		notice = "Core not detected!"
=======
		var/datum/component/gps/gps = target
		return gps.gpstag

/**
 * Locates the impact turf based off of if it's an area or a GPS.
 */
/obj/machinery/computer/bsa_control/proc/get_impact_turf()
	if(obj_flags & EMAGGED)
		return get_turf(src)
	else if(istype(target, /area))
		return pick(get_area_turfs(target))
	else if(istype(target, /datum/component/gps))
		var/datum/component/gps/gps = target
		return get_turf(gps.parent)

/**
 * Initiates the cannon fire protocol
 */
/obj/machinery/computer/bsa_control/proc/fire(mob/user)
	var/obj/machinery/bsa/full/cannon = connected_cannon?.resolve()
	if(!cannon)
		notice = "System error"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return
	if((cannon.machine_stat & BROKEN))
		notice = "Cannon integrity failure!"
		return
	if((cannon.machine_stat & NOPOWER))
		notice = "Cannon unpowered!"
		return
<<<<<<< HEAD
	notice = cannon.pre_fire(user, get_impact_turf())

/obj/machinery/computer/bsa_control/proc/deploy(force=FALSE)
	var/obj/machinery/bsa/full/prebuilt = locate() in range(7) //In case of adminspawn
	if(prebuilt)
		prebuilt.control_unit = src
		return prebuilt
=======
	var/turf/target_turf = get_impact_turf()
	notice = cannon.pre_fire(user, target_turf)

/**
 * Deploy
 *
 * Deploys the cannon and deletes the old parts.
 */
/obj/machinery/computer/bsa_control/proc/deploy(force=FALSE)
	var/obj/machinery/bsa/full/prebuilt = locate() in range(7) //In case of adminspawn
	if(prebuilt)
		prebuilt.control_computer = src
		connected_cannon = WEAKREF(prebuilt)
		return
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	var/obj/machinery/bsa/middle/centerpiece = locate() in range(7)
	if(!centerpiece)
		notice = "No BSA parts detected nearby."
		return null
	notice = centerpiece.check_completion()
	if(notice)
		return null
	//Totally nanite construction system not an immersion breaking spawning
<<<<<<< HEAD
	var/datum/effect_system/fluid_spread/smoke/s = new
	s.set_up(4, location = get_turf(centerpiece))
	s.start()
	var/obj/machinery/bsa/full/cannon = new(get_turf(centerpiece),centerpiece.get_cannon_direction())
	cannon.control_unit = src
	qdel(centerpiece.front)
	qdel(centerpiece.back)
	qdel(centerpiece)
	return cannon

/obj/machinery/computer/bsa_control/Destroy()
	if(cannon)
		cannon.control_unit = null
		cannon = null
	core = null
	. = ..()
=======
	var/datum/effect_system/fluid_spread/smoke/smoke = new
	smoke.set_up(4, location = get_turf(centerpiece))
	smoke.start()
	var/obj/machinery/bsa/full/cannon = new(get_turf(centerpiece), centerpiece.get_cannon_direction())
	cannon.control_computer = src
	if(centerpiece.front_piece)
		qdel(centerpiece.front_piece.resolve())
	if(centerpiece.back_piece)
		qdel(centerpiece.back_piece.resolve())
	qdel(centerpiece)
	connected_cannon = WEAKREF(cannon)

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
