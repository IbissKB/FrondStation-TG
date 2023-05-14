/// List of plane offset + 1 -> mutable appearance to use
/// Fills with offsets as they are generated
GLOBAL_LIST_INIT_TYPED(fullbright_overlays, /mutable_appearance, list(create_fullbright_overlay(0)))

/proc/create_fullbright_overlay(offset)
	var/mutable_appearance/lighting_effect = mutable_appearance('icons/effects/alphacolors.dmi', "white")
	SET_PLANE_W_SCALAR(lighting_effect, LIGHTING_PLANE, offset)
	lighting_effect.layer = LIGHTING_PRIMARY_LAYER
	lighting_effect.blend_mode = BLEND_ADD
<<<<<<< HEAD
=======
	lighting_effect.color = COLOR_STARLIGHT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return lighting_effect

/area
	///Whether this area allows static lighting and thus loads the lighting objects
	var/static_lighting = TRUE

//Non static lighting areas.
//Any lighting area that wont support static lights.
//These areas will NOT have corners generated.

///regenerates lighting objects for turfs in this area, primary use is VV changes
/area/proc/create_area_lighting_objects()
	for(var/turf/T in src)
<<<<<<< HEAD
		if(T.always_lit)
=======
		if(T.space_lit)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			continue
		T.lighting_build_overlay()
		CHECK_TICK

///Removes lighting objects from turfs in this area if we have them, primary use is VV changes
/area/proc/remove_area_lighting_objects()
	for(var/turf/T in src)
<<<<<<< HEAD
		if(T.always_lit)
=======
		if(T.space_lit)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			continue
		T.lighting_clear_overlay()
		CHECK_TICK
