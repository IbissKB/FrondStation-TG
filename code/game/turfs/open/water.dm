/turf/open/water
	gender = PLURAL
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/chasm/lavaland
<<<<<<< HEAD
	initial_gas_mix = OPENTURF_LOW_PRESSURE
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	planetary_atmos = TRUE
	slowdown = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	turf_flags = NO_RUST
<<<<<<< HEAD

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/water/jungle
<<<<<<< HEAD
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS

//This version of the beach turf uses low pressure, inherieted from above
/turf/open/water/beach
	gender = PLURAL
	desc = "You get the feeling that nobody's bothered to actually make this water functional..."
	icon = 'icons/misc/beach.dmi'
=======

/turf/open/water/beach
	gender = PLURAL
	desc = "You get the feeling that nobody's bothered to actually make this water functional..."
	icon = 'icons/turf/beach.dmi'
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "water"
	base_icon_state = "water"
	baseturfs = /turf/open/water/beach

/turf/open/water/beach/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/lazy_fishing_spot, FISHING_SPOT_PRESET_BEACH)
<<<<<<< HEAD

//Same turf, but instead used in the Beach Biodome
/turf/open/water/beach/biodome
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
