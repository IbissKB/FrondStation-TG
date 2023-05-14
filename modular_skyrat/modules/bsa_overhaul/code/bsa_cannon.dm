/*
*	Crew has to build a bluespace cannon
*	Cargo orders part for high price
*	Requires high amount of power
*	Requires high level stock parts
*/
<<<<<<< HEAD

#define SYSTEM_OFFLINE "SYSTEM OFFLINE"
#define SYSTEM_READY "SYSTEM READY"
#define SYSTEM_PREFIRE "SYSTEM PREFIRING"
#define SYSTEM_FIRING "SYSTEM FIRING"
#define SYSTEM_RELOADING "SYSTEM RELOADING"
#define SYSTEM_INTERRUPTED "SYSTEM INTERRUPTED"

#define SUPERWEAPON_RELOAD_TIME (30 SECONDS)

/datum/station_goal/bluespace_cannon
	name = "Bluespace Artillery"

/datum/station_goal/bluespace_cannon/get_report()
	return list(
		"<blockquote>Our military presence is inadequate in your sector.",
		"We need you to construct BSA-[rand(1,99)] Artillery position aboard your station.",
		"",
		"Base parts are available for shipping via cargo.",
		"-Nanotrasen Naval Command</blockquote>",
	).Join("\n")

/datum/station_goal/bluespace_cannon/on_report()
	//Unlock BSA parts
	var/datum/supply_pack/engineering/bsa/P = SSshuttle.supply_packs[/datum/supply_pack/engineering/bsa]
	P.special_enabled = TRUE

/datum/station_goal/bluespace_cannon/check_completion()
	if(..())
		return TRUE
	var/obj/machinery/bsa/full/B = locate()
	if(B && !B.machine_stat)
		return TRUE
	return FALSE

=======
#define BSA_SYSTEM_READY "SYSTEM READY"
#define BSA_SYSTEM_PREFIRE "! SYSTEM PREFIRING !"
#define BSA_SYSTEM_FIRING "SYSTEM FIRING"
#define BSA_SYSTEM_RELOADING "SYSTEM RELOADING"
#define BSA_SYSTEM_LOW_POWER "SYSTEM POWER LOW"
#define BSA_SYSTEM_CHARGE_CAPACITORS "SYSTEM CHARGING CAPACITORS"

#define BSA_RELOAD_TIME 20 SECONDS
#define BSA_FIRE_POWER_THRESHOLD 1000000 // 1 MW


/**
 * BSA parts
 *
 * The parts are only used to build the full machine and are discarded after completion.
 */
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/bsa
	icon = 'icons/obj/machines/particle_accelerator.dmi'
	density = TRUE
	anchored = TRUE

/obj/machinery/bsa/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	default_unfasten_wrench(user, tool, time = 1 SECONDS)
	return TOOL_ACT_TOOLTYPE_SUCCESS

/obj/machinery/bsa/back
	name = "Bluespace Artillery Generator"
	desc = "Generates cannon pulse. Needs to be linked with a fusor."
	icon_state = "power_box"

<<<<<<< HEAD
/obj/machinery/bsa/back/multitool_act(mob/living/user, obj/item/I)
	if(!multitool_check_buffer(user, I)) //make sure it has a data buffer
		return
	var/obj/item/multitool/M = I
	M.buffer = src
	to_chat(user, span_notice("You store linkage information in [I]'s buffer."))
=======
/obj/machinery/bsa/back/multitool_act(mob/living/user, obj/item/tool)
	if(!multitool_check_buffer(user, tool)) //make sure it has a data buffer
		return
	var/obj/item/multitool/multitool = tool
	multitool.buffer = src
	to_chat(user, span_notice("You store linkage information in [multitool]'s buffer."))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return TRUE

/obj/machinery/bsa/front
	name = "Bluespace Artillery Bore"
	desc = "Do not stand in front of cannon during operation. Needs to be linked with a fusor."
	icon_state = "emitter_center"

<<<<<<< HEAD
/obj/machinery/bsa/front/multitool_act(mob/living/user, obj/item/I)
	if(!multitool_check_buffer(user, I)) //make sure it has a data buffer
		return
	var/obj/item/multitool/M = I
	M.buffer = src
	to_chat(user, span_notice("You store linkage information in [I]'s buffer."))
=======
/obj/machinery/bsa/front/multitool_act(mob/living/user, obj/item/tool)
	if(!multitool_check_buffer(user, tool)) //make sure it has a data buffer
		return
	var/obj/item/multitool/multitool = tool
	multitool.buffer = src
	to_chat(user, span_notice("You store linkage information in [multitool]'s buffer."))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return TRUE

/obj/machinery/bsa/middle
	name = "Bluespace Artillery Fusor"
	desc = "Contents classified by Nanotrasen Naval Command. Needs to be linked with the other BSA parts using a multitool."
	icon_state = "fuel_chamber"
<<<<<<< HEAD
	var/obj/machinery/bsa/back/back
	var/obj/machinery/bsa/front/front

/obj/machinery/bsa/middle/multitool_act(mob/living/user, obj/item/I)
	if(!multitool_check_buffer(user, I))
		return
	var/obj/item/multitool/M = I
	if(M.buffer)
		if(istype(M.buffer, /obj/machinery/bsa/back))
			back = M.buffer
			M.buffer = null
			to_chat(user, span_notice("You link [src] with [back]."))
		else if(istype(M.buffer, /obj/machinery/bsa/front))
			front = M.buffer
			M.buffer = null
			to_chat(user, span_notice("You link [src] with [front]."))
	else
		to_chat(user, span_warning("[I]'s data buffer is empty!"))
	return TRUE

/obj/machinery/bsa/middle/proc/check_completion()
	if(!front || !back)
		return "No linked parts detected!"
	if(!front.anchored || !back.anchored || !anchored)
		return "Linked parts unwrenched!"
	if(front.y != y || back.y != y || !(front.x > x && back.x < x || front.x < x && back.x > x) || front.z != z || back.z != z)
=======
	/// Our linked back piece
	var/datum/weakref/back_piece
	/// Our linked front piece
	var/datum/weakref/front_piece

/obj/machinery/bsa/middle/multitool_act(mob/living/user, obj/item/tool)
	if(!multitool_check_buffer(user, tool))
		return
	var/obj/item/multitool/multitool = tool
	if(multitool.buffer)
		if(istype(multitool.buffer, /obj/machinery/bsa/back))
			back_piece = WEAKREF(multitool.buffer)
			to_chat(user, span_notice("You link [src] with [multitool.buffer]."))
			multitool.buffer = null
		else if(istype(multitool.buffer, /obj/machinery/bsa/front))
			front_piece = WEAKREF(multitool.buffer)
			to_chat(user, span_notice("You link [src] with [multitool.buffer]."))
			multitool.buffer = null
	else
		to_chat(user, span_warning("[multitool]'s data buffer is empty!"))
	return TRUE

/obj/machinery/bsa/middle/proc/check_completion()
	var/obj/machinery/bsa/back/back_part = back_piece?.resolve()
	var/obj/machinery/bsa/front/front_part = front_piece?.resolve()
	if(!front_part || !back_part)
		return "Some parts are missing!"
	if(!front_part.anchored || !back_part.anchored || !anchored)
		return "Linked parts unwrenched!"
	if(front_part.y != y || back_part.y != y || !(front_part.x > x && back_part.x < x || front_part.x < x && back_part.x > x) || front_part.z != z || back_part.z != z)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return "Parts misaligned!"
	if(!has_space())
		return "Not enough free space!"

/obj/machinery/bsa/middle/proc/has_space()
	var/cannon_dir = get_cannon_direction()
	var/x_min
	var/x_max
	switch(cannon_dir)
		if(EAST)
			x_min = x - 4 //replace with defines later
			x_max = x + 6
		if(WEST)
			x_min = x + 4
			x_max = x - 6

<<<<<<< HEAD
	for(var/turf/T in block(locate(x_min,y-1,z),locate(x_max,y+1,z)))
		if(T.density || isspaceturf(T))
=======
	for(var/turf/our_turf in block(locate(x_min, y - 1, z),locate(x_max, y + 1, z)))
		if(our_turf.density || isspaceturf(our_turf))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			return FALSE
	return TRUE

/obj/machinery/bsa/middle/proc/get_cannon_direction()
<<<<<<< HEAD
	if(front.x > x && back.x < x)
		return EAST
	else if(front.x < x && back.x > x)
		return WEST

=======
	var/obj/machinery/bsa/back/back_part = back_piece?.resolve()
	var/obj/machinery/bsa/front/front_part = front_piece?.resolve()
	if(!back_part || !front_part)
		return FALSE
	if(front_part.x > x && back_part.x < x)
		return EAST
	else if(front_part.x < x && back_part.x > x)
		return WEST


/**
 * The full BSA cannon
 *
 * This operates by charging a "capacitor" bank which is then discharged in the beam.
 * The capacitor bank is charged during the power up phase, it essentially drains the connected powernet until it reaches it's target power, and then fires.
 */
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/machinery/bsa/full
	name = "Bluespace Artillery"
	desc = "Long range bluespace artillery."
	icon = 'icons/obj/lavaland/cannon.dmi'
	icon_state = "cannon_west"
<<<<<<< HEAD
	var/static/mutable_appearance/top_layer
	use_power = NO_POWER_USE
	var/ex_power = 5
	var/power_used_per_shot = 20000000 //enough to kil standard apc - todo : make this use wires instead and scale explosion power with it
	var/ready
	var/system_state = SYSTEM_OFFLINE
	max_integrity = 2000
	var/obj/machinery/computer/bsa_control/control_unit
=======
	use_power = NO_POWER_USE // We use power when we're fired.
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	pixel_y = -32
	pixel_x = -192
	bound_width = 352
	bound_x = -192
	appearance_flags = NONE //Removes default TILE_BOUND
<<<<<<< HEAD
=======
	max_integrity = 2000

	/// A reference to our topmost mutable layer
	var/static/mutable_appearance/top_layer
	/// The total collected power, this is calculated in the "power up" phase of the superweapon.
	var/capacitor_power = 0
	/// The cap on how much power we can suck from the powernet per cycle
	var/power_suck_cap = 1000000 // 1 MEGAWATT
	/// The set target power
	var/target_power = 1000000
	/// How much charge our capacitors can hold
	var/max_charge = 100000000
	/// The current system state
	var/system_state = BSA_SYSTEM_READY
	/// Our connected control computer
	var/obj/machinery/computer/bsa_control/control_computer

/obj/machinery/bsa/full/Initialize(mapload, cannon_direction = WEST)
	. = ..()
	top_layer = top_layer || mutable_appearance(icon, layer = ABOVE_MOB_LAYER)
	switch(cannon_direction)
		if(WEST)
			setDir(WEST)
			top_layer.icon_state = "top_west"
			icon_state = "cannon_west"
		if(EAST)
			setDir(EAST)
			pixel_x = -128
			bound_x = -128
			top_layer.icon_state = "top_east"
			icon_state = "cannon_east"
	add_overlay(top_layer)
	reload()
	START_PROCESSING(SSobj, src)

/obj/machinery/bsa/full/Destroy()
	control_computer = null
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/bsa/full/wrench_act(mob/living/user, obj/item/I)
	return FALSE

/obj/machinery/bsa/full/proc/get_front_turf()
	switch(dir)
		if(WEST)
			return locate(x - 7,y,z)
		if(EAST)
			return locate(x + 7,y,z)
	return get_turf(src)

/obj/machinery/bsa/full/proc/get_back_turf()
	switch(dir)
		if(WEST)
			return locate(x + 5,y,z)
		if(EAST)
			return locate(x - 5,y,z)
	return get_turf(src)

/obj/machinery/bsa/full/proc/get_target_turf()
	switch(dir)
		if(WEST)
			return locate(1,y,z)
		if(EAST)
			return locate(world.maxx,y,z)
	return get_turf(src)

<<<<<<< HEAD
/obj/machinery/bsa/full/Initialize(mapload, cannon_direction = WEST)
	. = ..()
	top_layer = top_layer || mutable_appearance(icon, layer = ABOVE_MOB_LAYER)
	switch(cannon_direction)
		if(WEST)
			setDir(WEST)
			top_layer.icon_state = "top_west"
			icon_state = "cannon_west"
		if(EAST)
			setDir(EAST)
			pixel_x = -128
			bound_x = -128
			top_layer.icon_state = "top_east"
			icon_state = "cannon_east"
	add_overlay(top_layer)
	reload()

/obj/machinery/bsa/full/proc/pre_fire(mob/user, turf/bullseye)
	if(system_state == SYSTEM_READY)
		priority_announce("BLUESPACE TARGETING PARAMETERS SET, PREIGNITION STARTING... FIRING IN T-20 SECONDS!", "BLUESPACE ARTILLERY", ANNOUNCER_BLUESPACEARTY)
		alert_sound_to_playing('modular_skyrat/modules/bsa_overhaul/sound/superlaser_prefire.ogg', override_volume = TRUE)
		system_state = SYSTEM_PREFIRE
		message_admins("[user] has started the fire cycle of [src]! Firing at: [ADMIN_VERBOSEJMP(bullseye)]")
		set_light(5, 5, COLOR_BLUE_LIGHT)
		addtimer(CALLBACK(src, PROC_REF(fire), user, bullseye), 20 SECONDS, TIMER_CLIENT_TIME)
		START_PROCESSING(SSobj, src)
	return system_state

/obj/machinery/bsa/full/process()
	if(system_state == SYSTEM_PREFIRE) //We drain this while either action is being performed.
		if(isnull(control_unit.core))
			system_state = SYSTEM_INTERRUPTED
			STOP_PROCESSING(SSobj, src)
		var/obj/structure/cable/attached = control_unit.core.attached
		var/datum/powernet/PN = attached.powernet
		if(PN)
			// found a powernet, so drain up to max power from it
			var/drained = min(power_used_per_shot, attached.newavail())
			attached.add_delayedload(drained)
			// if tried to drain more than available on powernet
			// now look for APCs and drain their cells
			if(drained < power_used_per_shot)
				for(var/obj/machinery/power/terminal/T in PN.nodes)
					if(istype(T.master, /obj/machinery/power/apc))
						var/obj/machinery/power/apc/A = T.master
						if(A.operating && A.cell)
							A.cell.charge = max(0, A.cell.charge - 50)
							if(A.charging == 2) // If the cell was full
								A.charging = 1 // It's no longer full
					if(drained >= power_used_per_shot)
						break
		else
			system_state = SYSTEM_INTERRUPTED
			STOP_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)

/obj/machinery/bsa/full/proc/fire(mob/user, turf/bullseye)
	if(!system_state == SYSTEM_PREFIRE || !control_unit.core || machine_stat)
		minor_announce("BLUESPACE ARTILLERY FIRE FAILURE!", "BLUESPACE ARTILLERY", TRUE)
		system_state = SYSTEM_READY
		return
	system_state = SYSTEM_FIRING
	reload()
	use_power(power_used_per_shot)
	var/turf/point = get_front_turf()
	var/turf/target = get_target_turf()
	var/atom/movable/blocker
	for(var/T in get_line(get_step(point, dir), target))
		var/turf/tile = T
		if(SEND_SIGNAL(tile, COMSIG_ATOM_BSA_BEAM) & COMSIG_ATOM_BLOCKS_BSA_BEAM)
			blocker = tile
		else
			for(var/AM in tile)
				var/atom/movable/stuff = AM
				if(SEND_SIGNAL(stuff, COMSIG_ATOM_BSA_BEAM) & COMSIG_ATOM_BLOCKS_BSA_BEAM)
					blocker = stuff
					break
		if(blocker)
			target = tile
			break
		else
			SSexplosions.highturf += tile //also fucks everything else on the turf
=======
// Firing procs

/**
 * Collect charge
 *
 * Cycles the powernet and sucks power from it and shoves it into the capacitors.
 */
/obj/machinery/bsa/full/proc/charge_capacitors()
	if(capacitor_power >= target_power)
		if(capacitor_power < BSA_FIRE_POWER_THRESHOLD)
			system_state = BSA_SYSTEM_LOW_POWER
		else
			system_state = BSA_SYSTEM_READY
		return
	var/area/our_area = get_area(src)
	if(!our_area) //wtf
		return
	var/obj/machinery/power/apc/our_apc = our_area.apc
	if(!our_apc)
		return
	var/obj/machinery/power/terminal/our_terminal = our_apc.terminal
	if(!our_terminal)
		return
	var/datum/powernet/our_powernet = our_terminal.powernet
	if(!our_powernet)
		return

	var/charge_to_pull = power_suck_cap

	var/charge_to_full = max_charge - capacitor_power

	if(charge_to_full < power_suck_cap)
		charge_to_pull = charge_to_full

	var/max_power_draw = charge_to_pull > our_powernet.avail ? our_powernet.avail : charge_to_pull

	our_powernet.avail -= max_power_draw

	capacitor_power += max_power_draw

/**
 * Gets the currently available power cap
 */
/obj/machinery/bsa/full/proc/get_available_powercap()
	var/area/our_area = get_area(src)
	if(!our_area) //wtf
		return
	var/obj/machinery/power/apc/our_apc = our_area.apc
	if(!our_apc)
		return
	var/obj/machinery/power/terminal/our_terminal = our_apc.terminal
	if(!our_terminal)
		return
	var/datum/powernet/our_powernet = our_terminal.powernet
	if(!our_powernet)
		return

	return our_powernet.avail

/obj/machinery/bsa/full/process()
	if(system_state == BSA_SYSTEM_CHARGE_CAPACITORS)
		charge_capacitors()
		if(capacitor_power >= target_power)
			return

/obj/machinery/bsa/full/proc/pre_fire(mob/user, turf/bullseye)
	if(system_state != BSA_SYSTEM_READY)
		return
	system_state = BSA_SYSTEM_PREFIRE
	priority_announce("BLUESPACE TARGETING PARAMETERS SET, PREIGNITION STARTING... CAPACITOR CHARGE AT [round(capacitor_power / 1000000, 0.1)] MW, FIRING IN T-20 SECONDS!", "BLUESPACE ARTILLERY", ANNOUNCER_BLUESPACEARTY)
	alert_sound_to_playing('modular_skyrat/modules/bsa_overhaul/sound/superlaser_prefire.ogg', override_volume = TRUE)
	message_admins("[user] has started the fire cycle of [src]! Firing at: [ADMIN_VERBOSEJMP(bullseye)]")
	set_light(5, 5, COLOR_BLUE_LIGHT)
	addtimer(CALLBACK(src, PROC_REF(fire), user, bullseye), 20 SECONDS, TIMER_CLIENT_TIME)

/// Initiates the fire sequence of the gun providing it has the required power.
/obj/machinery/bsa/full/proc/fire(mob/user, turf/bullseye)
	// Check if the system is already firing or if the machine is broken
	if(system_state != BSA_SYSTEM_PREFIRE || machine_stat)
		minor_announce("BLUESPACE ARTILLERY FIRE FAILURE!", "BLUESPACE ARTILLERY", TRUE)
		system_state = BSA_SYSTEM_READY
		return
	system_state = BSA_SYSTEM_FIRING
	// We need to reload the chamber so it's ready to fire another one
	reload()
	// The turf directly in front of the gun.
	var/turf/point = get_front_turf()
	// the target turf
	var/turf/target = get_target_turf()
	// Anything that blocks the BSA beam, if it's blocked, it hits that thing
	var/atom/movable/blocker
	// Now we absolutely destroy everything in the beams path.
	for(var/turf/iterating_turf as anything in get_line(get_step(point, dir), target))
		if(SEND_SIGNAL(iterating_turf, COMSIG_ATOM_BSA_BEAM) & COMSIG_ATOM_BLOCKS_BSA_BEAM)
			blocker = iterating_turf
		else
			for(var/atom/movable/iterating_atom in iterating_turf)
				if(SEND_SIGNAL(iterating_atom, COMSIG_ATOM_BSA_BEAM) & COMSIG_ATOM_BLOCKS_BSA_BEAM)
					blocker = iterating_atom
					break
		if(blocker)
			target = iterating_turf
			break
		else
			SSexplosions.highturf += iterating_turf //also fucks everything else on the turf
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	point.Beam(target, icon_state = "bsa_beam", time = 5 SECONDS, maxdistance = world.maxx) //ZZZAP
	new /obj/effect/temp_visual/bsa_splash(point, dir)

	if(!blocker)
		message_admins("[ADMIN_LOOKUPFLW(user)] has launched an artillery strike targeting [ADMIN_VERBOSEJMP(bullseye)].")
		log_game("[key_name(user)] has launched an artillery strike targeting [AREACOORD(bullseye)].")
		minor_announce("BLUESPACE ARTILLERY FIRE SUCCESSFUL! DIRECT HIT!", "BLUESPACE ARTILLERY", TRUE)
<<<<<<< HEAD
		explosion(bullseye, ex_power, ex_power*2, ex_power*4)
		alert_sound_to_playing('modular_skyrat/modules/bsa_overhaul/sound/superlaser_firing.ogg', override_volume = TRUE)
	else
		message_admins("[ADMIN_LOOKUPFLW(user)] has launched an artillery strike targeting [ADMIN_VERBOSEJMP(bullseye)] but it was blocked by [blocker] at [ADMIN_VERBOSEJMP(target)].")
		log_game("[key_name(user)] has launched an artillery strike targeting [AREACOORD(bullseye)] but it was blocked by [blocker] at [AREACOORD(target)].")
		minor_announce("BLUESPACE ARTILLERY FIRE FAILURE!", "BLUESPACE ARTILLERY", TRUE)

/obj/machinery/bsa/full/proc/reload()
	system_state = SYSTEM_RELOADING
	set_light(0)
	STOP_PROCESSING(SSobj, src)
	addtimer(CALLBACK(src, PROC_REF(ready_cannon)), SUPERWEAPON_RELOAD_TIME)

/obj/machinery/bsa/full/proc/ready_cannon()
	system_state = SYSTEM_READY
	STOP_PROCESSING(SSobj, src)

/obj/machinery/bsa/full/Destroy()
	if(control_unit)
		if(control_unit.cannon)
			control_unit.cannon = null
		control_unit = null
	. = ..()
=======
		create_calculated_explosion(bullseye)
		alert_sound_to_playing('modular_skyrat/modules/bsa_overhaul/sound/superlaser_firing.ogg', override_volume = TRUE)
		capacitor_power = 0
	else
		message_admins("[ADMIN_LOOKUPFLW(user)] has launched an artillery strike targeting [ADMIN_VERBOSEJMP(bullseye)] but it was blocked by [blocker] at [ADMIN_VERBOSEJMP(target)].")
		log_game("[key_name(user)] has launched an artillery strike targeting [AREACOORD(bullseye)] but it was blocked by [blocker] at [AREACOORD(target)].")
		minor_announce("BLUESPACE ARTILLERY MALFUNCTION!", "BLUESPACE ARTILLERY", TRUE)

/// Reloads the BSA.
/obj/machinery/bsa/full/proc/reload()
	system_state = BSA_SYSTEM_RELOADING
	set_light(0)
	STOP_PROCESSING(SSobj, src)
	addtimer(CALLBACK(src, .proc/ready_cannon), BSA_RELOAD_TIME)

/obj/machinery/bsa/full/proc/ready_cannon()
	if(capacitor_power < BSA_FIRE_POWER_THRESHOLD)
		system_state = BSA_SYSTEM_LOW_POWER
	else
		system_state = BSA_SYSTEM_READY
	STOP_PROCESSING(SSobj, src)

/obj/machinery/bsa/full/proc/create_calculated_explosion(atom/target)
	var/calculated_explosion_power = capacitor_power / 10000000 // Maximum explosion range of 10, 20, 40

	explosion(target, calculated_explosion_power, calculated_explosion_power * 2, calculated_explosion_power * 4, ignorecap = TRUE) // This should ignore cap so we can achieve our maximum potential
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/structure/filler
	name = "big machinery part"
	density = TRUE
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	var/obj/machinery/parent

/obj/structure/filler/ex_act()
	return

/obj/structure/filler/Destroy()
	parent = null
	. = ..()

<<<<<<< HEAD
/obj/machinery/bsa_powercore
	name = "artillery powercore"
	desc = "A core that transfers power from the local power net and transfers it to nearby artillery pieces."
	icon = 'modular_skyrat/modules/bsa_overhaul/icons/bsa_parts.dmi'
	icon_state = "powercore_off"
	density = TRUE
	///The attached power cable that the power core will SUCC energy from.
	var/obj/machinery/computer/bsa_control/control_unit
	var/obj/structure/cable/attached

/obj/machinery/bsa_powercore/multitool_act(mob/living/user, obj/item/I)
	if(!multitool_check_buffer(user, I)) //make sure it has a data buffer
		return
	var/obj/item/multitool/M = I
	M.buffer = src
	to_chat(user, span_notice("You store linkage information in [I]'s buffer."))
	return TRUE

/obj/machinery/bsa_powercore/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 10)
	if(anchored)
		var/turf/T = loc
		if(isturf(T) && T.underfloor_accessibility >= UNDERFLOOR_INTERACTABLE)
			attached = locate() in T
			if(!attached)
				set_light(0)
				to_chat(user, span_warning("[src] must be placed over an exposed, powered cable node!"))
			else
				set_light(5)
				to_chat(user, span_notice("You attach [src] to the cable below."))
	else
		attached = null
	update_appearance()
	return TRUE

/obj/machinery/bsa_powercore/Destroy()
	if(control_unit)
		control_unit.core = null
		control_unit = null
	attached = null
	. = ..()

/obj/machinery/bsa_powercore/update_icon(updates)
	. = ..()
	if(attached)
		icon_state = "powercore_on"
	else
		icon_state = "powercore_off"

/obj/item/circuitboard/machine/bsa/powercore
	name = "Bluespace Artillery Powercore (Machine Board)"
	greyscale_colors = CIRCUIT_COLOR_COMMAND
	build_path = /obj/machinery/bsa_powercore
	req_components = list(
		/obj/item/stock_parts/capacitor/quadratic = 5,
		/obj/item/stock_parts/cell/bluespace = 1,
		/obj/item/stack/cable_coil = 2)

#undef SYSTEM_OFFLINE
#undef SYSTEM_READY
#undef SYSTEM_PREFIRE
#undef SYSTEM_FIRING
#undef SYSTEM_RELOADING
#undef SYSTEM_INTERRUPTED
#undef SUPERWEAPON_RELOAD_TIME
=======


>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
