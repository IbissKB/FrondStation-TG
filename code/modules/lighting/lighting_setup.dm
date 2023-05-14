
/proc/create_all_lighting_objects()
	for(var/area/A as anything in GLOB.areas)
		if(!A.static_lighting)
			continue

		for(var/turf/T as anything in A.get_contained_turfs())
<<<<<<< HEAD
			if(T.always_lit)
				continue
			new/datum/lighting_object(T)
=======
			if(T.space_lit)
				continue
			new /datum/lighting_object(T)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			CHECK_TICK
		CHECK_TICK
