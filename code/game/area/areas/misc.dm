// Areas that don't fit any of the other files, or only serve one purpose.

/area/space
	icon_state = "space"
	requires_power = TRUE
	always_unpowered = TRUE
	static_lighting = FALSE

	base_lighting_alpha = 255
<<<<<<< HEAD
=======
	base_lighting_color = COLOR_STARLIGHT
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	area_flags = UNIQUE_AREA
	outdoors = TRUE
	ambience_index = AMBIENCE_SPACE
	flags_1 = CAN_BE_DIRTY_1
	sound_environment = SOUND_AREA_SPACE
	ambient_buzz = null //Space is deafeningly quiet

/area/space/nearstation
	icon_state = "space_near"
	area_flags = UNIQUE_AREA | AREA_USES_STARLIGHT
<<<<<<< HEAD
=======
	static_lighting = TRUE
	base_lighting_alpha = 0
	base_lighting_color = COLOR_WHITE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/area/misc/start
	name = "start area"
	icon_state = "start"
	requires_power = FALSE
	static_lighting = FALSE
	base_lighting_alpha = 255
	has_gravity = STANDARD_GRAVITY

/area/misc/testroom
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
<<<<<<< HEAD
=======
	// Mobs should be able to see inside the testroom
	static_lighting = FALSE
	base_lighting_alpha = 255
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "Test Room"
	icon_state = "test_room"
