/obj/effect/decal
	name = "decal"
	plane = FLOOR_PLANE
	anchored = TRUE
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/turf_loc_check = TRUE

/obj/effect/decal/Initialize(mapload)
	. = ..()
	if(turf_loc_check && (!isturf(loc) || NeverShouldHaveComeHere(loc)))
		return INITIALIZE_HINT_QDEL
<<<<<<< HEAD
=======
	var/static/list/loc_connections = list(
		COMSIG_TURF_CHANGED = PROC_REF(handle_turf_change),
	)
	AddElement(/datum/element/connect_loc, loc_connections)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/effect/decal/blob_act(obj/structure/blob/B)
	if(B && B.loc == loc)
		qdel(src)

/obj/effect/decal/proc/NeverShouldHaveComeHere(turf/T)
	return isclosedturf(T) || isgroundlessturf(T)

/obj/effect/decal/ex_act(severity, target)
	qdel(src)
<<<<<<< HEAD
=======
	return TRUE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/effect/decal/fire_act(exposed_temperature, exposed_volume)
	if(!(resistance_flags & FIRE_PROOF)) //non fire proof decal or being burned by lava
		qdel(src)

<<<<<<< HEAD
/obj/effect/decal/HandleTurfChange(turf/T)
	..()
	if(T == loc && NeverShouldHaveComeHere(T))
=======
/obj/effect/decal/proc/handle_turf_change(turf/source, path, list/new_baseturfs, flags, list/post_change_callbacks)
	SIGNAL_HANDLER
	post_change_callbacks += CALLBACK(src, PROC_REF(sanity_check_self))

/obj/effect/decal/proc/sanity_check_self(turf/changed)
	if(changed == loc && NeverShouldHaveComeHere(changed))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		qdel(src)

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/effect/turf_decal
	icon = 'icons/turf/decals.dmi'
	icon_state = "warningline"
	plane = FLOOR_PLANE
	layer = TURF_DECAL_LAYER
	anchored = TRUE

// This is with the intent of optimizing mapload
// See spawners for more details since we use the same pattern
// Basically rather then creating and deleting ourselves, why not just do the bare minimum?
/obj/effect/turf_decal/Initialize(mapload)
	SHOULD_CALL_PARENT(FALSE)
	if(flags_1 & INITIALIZED_1)
		stack_trace("Warning: [src]([type]) initialized multiple times!")
	flags_1 |= INITIALIZED_1

	var/turf/T = loc
	if(!istype(T)) //you know this will happen somehow
		CRASH("Turf decal initialized in an object/nullspace")
<<<<<<< HEAD
	T.AddElement(/datum/element/decal, icon, icon_state, dir, null, null, alpha, color, null, FALSE, null)
=======
	T.AddElement(/datum/element/decal, icon, icon_state, dir, null, layer, alpha, color, null, FALSE, null)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return INITIALIZE_HINT_QDEL

/obj/effect/turf_decal/Destroy(force)
	SHOULD_CALL_PARENT(FALSE)
#ifdef UNIT_TESTS
// If we don't do this, turf decals will end up stacking up on a tile, and break the overlay limit
// I hate it too bestie
	if(GLOB.running_create_and_destroy)
		var/turf/T = loc
<<<<<<< HEAD
		T.RemoveElement(/datum/element/decal, icon, icon_state, dir, null, null, alpha, color, null, FALSE, null)
=======
		T.RemoveElement(/datum/element/decal, icon, icon_state, dir, null, layer, alpha, color, null, FALSE, null)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
#endif
	// Intentionally used over moveToNullspace(), which calls doMove(), which fires
	// off an enormous amount of procs, signals, etc, that this temporary effect object
	// never needs or affects.
	loc = null
	return QDEL_HINT_QUEUE
