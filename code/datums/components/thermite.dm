/datum/component/thermite
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS
<<<<<<< HEAD
	///Amoumt of thermite on parent
	var/amount
	///Amount of thermite required to burn through parent
	var/burn_require
	///The thermite overlay
	var/overlay
	///The timer for burning parent
	var/burn_timer
	///The thermite fire overlay
	var/obj/effect/overlay/thermite/fakefire

	///Blacklist of turfs that cannot have thermite on it
=======
	/// Amount of thermite on parent
	var/amount
	/// Amount of thermite required to burn through parent
	var/burn_require
	/// The thermite overlay
	var/thermite_overlay
	/// Callback related to burning, stored so the timer can be easily reset without losing the user
	var/datum/callback/burn_callback
	/// The timer for burning parent, calls burn_callback when done
	var/burn_timer
	/// The thermite fire overlay
	var/obj/effect/overlay/thermite/fakefire

	/// Default thermite overlay, do not touch
	var/static/mutable_appearance/default_thermite_overlay = mutable_appearance('icons/effects/effects.dmi', "thermite")
	/// Blacklist of turfs that cannot have thermite on it
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/static/list/blacklist = typecacheof(list(
		/turf/open/lava,
		/turf/open/space,
		/turf/open/water,
		/turf/open/chasm,
	))
<<<<<<< HEAD
	///List of turfs that are immune to thermite
=======
	/// List of turfs that are immune to thermite
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/static/list/immunelist = typecacheof(list(
		/turf/closed/wall/mineral/diamond,
		/turf/closed/indestructible,
		/turf/open/indestructible,
	))
<<<<<<< HEAD
	///List of turfs that take extra thermite to burn through
=======
	/// List of turfs that take extra thermite to burn through
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/static/list/resistlist = typecacheof(list(
		/turf/closed/wall/r_wall,
	))

<<<<<<< HEAD
/datum/component/thermite/Initialize(_amount)
	if(!istype(parent, /turf) || blacklist[parent.type])
		return COMPONENT_INCOMPATIBLE

	if(immunelist[parent.type])
		amount = 0 //Yeah the overlay can still go on it and be cleaned but you arent burning down a diamond wall
	else
		amount = _amount
=======
/datum/component/thermite/Initialize(amount = 50, thermite_overlay = default_thermite_overlay)
	if(!isturf(parent))
		return COMPONENT_INCOMPATIBLE
	//not actually incompatible, but not valid
	if(blacklist[parent.type])
		qdel(src)
		return

	if(immunelist[parent.type])
		src.amount = 0 //Yeah the overlay can still go on it and be cleaned but you arent burning down a diamond wall
	else
		src.amount = amount
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		if(resistlist[parent.type])
			burn_require = 50
		else
			burn_require = 30

<<<<<<< HEAD
	var/turf/master = parent
	overlay = mutable_appearance('icons/effects/effects.dmi', "thermite")
	master.add_overlay(overlay)

	RegisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(clean_react))
	RegisterSignal(parent, COMSIG_PARENT_ATTACKBY, PROC_REF(attackby_react))
	RegisterSignal(parent, COMSIG_ATOM_FIRE_ACT, PROC_REF(flame_react))

/datum/component/thermite/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT)
	UnregisterSignal(parent, COMSIG_PARENT_ATTACKBY)
	UnregisterSignal(parent, COMSIG_ATOM_FIRE_ACT)
	UnregisterSignal(parent, COMSIG_PARENT_QDELETING)

/datum/component/thermite/Destroy()
	var/turf/master = parent
	master.cut_overlay(overlay)
	return ..()

/datum/component/thermite/InheritComponent(datum/component/thermite/newC, i_am_original, _amount)
	if(!i_am_original)
		return
	if(newC)
		amount += newC.amount
	else
		amount += _amount
	if (burn_timer) // prevent people from skipping a longer timer
		deltimer(burn_timer)
		burn_timer = addtimer(CALLBACK(src, PROC_REF(burn_parent), usr), min(amount * 0.35 SECONDS, 20 SECONDS), TIMER_STOPPABLE)
=======
	src.thermite_overlay = thermite_overlay

/datum/component/thermite/Destroy()
	thermite_overlay = null
	if(burn_callback)
		QDEL_NULL(burn_callback)
	if(burn_timer)
		deltimer(burn_timer)
		burn_timer = null
	if(fakefire)
		QDEL_NULL(fakefire)
	return ..()

/datum/component/thermite/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ATOM_FIRE_ACT, PROC_REF(on_fire_act))
	RegisterSignal(parent, COMSIG_ATOM_UPDATE_OVERLAYS, PROC_REF(on_update_overlays))
	RegisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(clean_react))
	RegisterSignal(parent, COMSIG_PARENT_ATTACKBY, PROC_REF(attackby_react))
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(parent_qdeleting)) //probably necessary because turfs are wack
	var/turf/turf_parent = parent
	turf_parent.update_appearance()

/datum/component/thermite/UnregisterFromParent()
	UnregisterSignal(parent, list(
		COMSIG_ATOM_FIRE_ACT,
		COMSIG_ATOM_UPDATE_OVERLAYS,
		COMSIG_COMPONENT_CLEAN_ACT,
		COMSIG_PARENT_ATTACKBY,
		COMSIG_PARENT_EXAMINE,
		COMSIG_PARENT_QDELETING,
	))
	var/turf/turf_parent = parent
	turf_parent.update_appearance()

/datum/component/thermite/InheritComponent(datum/component/thermite/new_comp, i_am_original, amount)
	if(!i_am_original)
		return
	src.amount += amount
	if(burn_timer) // prevent people from skipping a longer timer
		deltimer(burn_timer)
		burn_timer = addtimer(burn_callback, min(amount * 0.35 SECONDS, 20 SECONDS), TIMER_STOPPABLE)

/// Alerts the user that this turf is, in fact, covered with thermite.
/datum/component/thermite/proc/on_examine(turf/source, mob/user, list/examine_list)
	SIGNAL_HANDLER

	examine_list += span_warning("[source.p_theyre(TRUE)] covered in thermite.")

/// Used to maintain the thermite overlay on the parent [/turf].
/datum/component/thermite/proc/on_update_overlays(turf/parent_turf, list/overlays)
	SIGNAL_HANDLER

	if(thermite_overlay)
		overlays += thermite_overlay
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/**
 * Used to begin the thermite burning process
 *
 * Arguments:
 * * mob/user - The user igniting the thermite
 */
/datum/component/thermite/proc/thermite_melt(mob/user)
<<<<<<< HEAD
	var/turf/master = parent
	master.cut_overlay(overlay)
	playsound(master, 'sound/items/welder.ogg', 100, TRUE)
	fakefire = new(master)
	burn_timer = addtimer(CALLBACK(src, PROC_REF(burn_parent), user), min(amount * 0.35 SECONDS, 20 SECONDS), TIMER_STOPPABLE)
	UnregisterFromParent()
	RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(delete_fire)) //in case parent gets deleted, get ready to delete the fire
=======
	var/turf/parent_turf = parent
	playsound(parent_turf, 'sound/items/welder.ogg', 100, TRUE)
	fakefire = new(parent_turf)
	burn_callback = CALLBACK(src, PROC_REF(burn_parent), user)
	burn_timer = addtimer(burn_callback, min(amount * 0.35 SECONDS, 20 SECONDS), TIMER_STOPPABLE)
	//unregister everything mechanical, we are burning up
	UnregisterSignal(parent, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_PARENT_ATTACKBY, COMSIG_ATOM_FIRE_ACT))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/**
 * Used to actually melt parent
 *
 * Arguments:
 * * mob/user - The user that ignited the thermite
 */
/datum/component/thermite/proc/burn_parent(mob/user)
<<<<<<< HEAD
	var/turf/master = parent
	delete_fire()
	if(user)
		master.add_hiddenprint(user)
	if(amount >= burn_require)
		master = master.Melt()
		master.burn_tile()
	qdel(src)

/**
 * Used to delete the fake fire overlay
 */
/datum/component/thermite/proc/delete_fire()
	SIGNAL_HANDLER

	if(!QDELETED(fakefire))
		qdel(fakefire)

/**
 * wash reaction, used to clean off thermite from parent
=======
	var/turf/parent_turf = parent
	if(fakefire)
		QDEL_NULL(fakefire)
	if(user)
		parent_turf.add_hiddenprint(user)
	if(amount >= burn_require)
		parent_turf = parent_turf.Melt()
		parent_turf.burn_tile()
	burn_timer = null
	qdel(src)

/**
 * Wash reaction, used to clean off thermite from parent
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
 */
/datum/component/thermite/proc/clean_react(datum/source, strength)
	SIGNAL_HANDLER

	//Thermite is just some loose powder, you could probably clean it with your hands. << todo?
	qdel(src)
<<<<<<< HEAD
=======

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return COMPONENT_CLEANED

/**
 * fire_act reaction, has to be the correct temperature
 *
 * Arguments:
 * * datum/source - The source of the flame
 * * exposed_temperature - The temperature of the flame hitting the thermite
 * * exposed_volume - The volume of the flame
 */
<<<<<<< HEAD
/datum/component/thermite/proc/flame_react(datum/source, exposed_temperature, exposed_volume)
	SIGNAL_HANDLER

	if(exposed_temperature > 1922) // This is roughly the real life requirement to ignite thermite
=======
/datum/component/thermite/proc/on_fire_act(datum/source, exposed_temperature, exposed_volume)
	SIGNAL_HANDLER

	// This is roughly the real life requirement to ignite thermite
	// (honestly not really sure what the point of this is, considering a god damn lighter can ignite this)
	if(exposed_temperature >= 1922)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		thermite_melt()

/**
 * attackby reaction, ignites the thermite if its a flame creating object
 *
 * Arguments:
 * * datum/source - The source of the attack
 * * obj/item/thing - Item being attacked by
 * * mob/user - The user behind the attack
 * * params - params
 */
<<<<<<< HEAD

/datum/component/thermite/proc/attackby_react(datum/source, obj/item/thing, mob/user, params)
	SIGNAL_HANDLER

	if(thing.get_temperature())
		thermite_melt(user)
=======
/datum/component/thermite/proc/attackby_react(datum/source, obj/item/thing, mob/user, params)
	SIGNAL_HANDLER

	if(thing.get_temperature() >= FIRE_MINIMUM_TEMPERATURE_TO_EXIST)
		thermite_melt(user)

/// Signal handler for COMSIG_PARENT_QDELETING, necessary because turfs can be weird with qdel()
/datum/component/thermite/proc/parent_qdeleting(datum/source)
	SIGNAL_HANDLER

	if(!QDELING(src))
		qdel(src)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
