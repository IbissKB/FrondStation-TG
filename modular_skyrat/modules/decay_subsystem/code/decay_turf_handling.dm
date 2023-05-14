/turf/open/floor
<<<<<<< HEAD
	turf_flags = CAN_DECAY_BREAK_1 // We do it this way because we can then easily pick what we don't want to be broken.
=======
	turf_flags = IS_SOLID | CAN_DECAY_BREAK_1 // We do it this way because we can then easily pick what we don't want to be broken.
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/turf/closed/wall
	flags_1 = CAN_BE_DIRTY_1

/turf/open/floor/plating
<<<<<<< HEAD
	turf_flags = NONE /// No breaking the plating

/turf/open/floor/glass
	turf_flags = NONE /// No breaking the glass (doesn't leave plating behind)
=======
	turf_flags = IS_SOLID /// No breaking the plating

/turf/open/floor/glass
	turf_flags = IS_SOLID /// No breaking the glass (doesn't leave plating behind)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/turf/open/misc/asteroid
	turf_flags = NONE /// They shouldn't break and they shouldn't be dirty, it's literally already a dirty turf.
