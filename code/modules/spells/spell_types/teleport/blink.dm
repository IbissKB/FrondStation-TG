/datum/action/cooldown/spell/teleport/radius_turf/blink
	name = "Blink"
	desc = "This spell randomly teleports you a short distance."
	button_icon_state = "blink"
	sound = 'sound/magic/blink.ogg'

<<<<<<< HEAD
	school = SCHOOL_FORBIDDEN
=======
	school = SCHOOL_TRANSLOCATION
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	cooldown_time = 2 SECONDS
	cooldown_reduction_per_rank = 0.4 SECONDS

	invocation_type = INVOCATION_NONE

	smoke_type = /datum/effect_system/fluid_spread/smoke
	smoke_amt = 0

	inner_tele_radius = 0
	outer_tele_radius = 6

	post_teleport_sound = 'sound/magic/blink.ogg'
