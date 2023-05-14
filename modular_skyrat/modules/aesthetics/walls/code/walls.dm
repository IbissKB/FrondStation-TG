/turf/closed/wall
	icon = 'modular_skyrat/modules/aesthetics/walls/icons/wall.dmi'
<<<<<<< HEAD
	canSmoothWith = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_WINDOW_FULLTILE, SMOOTH_GROUP_AIRLOCK)
=======
	canSmoothWith = SMOOTH_GROUP_AIRLOCK + SMOOTH_GROUP_WINDOW_FULLTILE + SMOOTH_GROUP_WALLS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/turf/closed/wall/r_wall
	icon = 'modular_skyrat/modules/aesthetics/walls/icons/reinforced_wall.dmi'

/turf/closed/wall/rust
	icon = 'modular_skyrat/modules/aesthetics/walls/icons/wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/r_wall/rust
	icon = 'modular_skyrat/modules/aesthetics/walls/icons/reinforced_wall.dmi'
	icon_state = "reinforced_wall-0"
	base_icon_state = "reinforced_wall"

/turf/closed/wall/rust/New(loc, ...)
	. = ..()
	var/mutable_appearance/rust = mutable_appearance(icon, "rust")
	add_overlay(rust)

/turf/closed/wall/r_wall/rust/New(loc, ...)
	. = ..()
	var/mutable_appearance/rust = mutable_appearance(icon, "rust")
	add_overlay(rust)

/obj/structure/falsewall/material
	icon = 'modular_skyrat/modules/aesthetics/walls/icons/material_wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/material
	icon = 'modular_skyrat/modules/aesthetics/walls/icons/material_wall.dmi'
	icon_state = "wall-0"
	base_icon_state = "wall"
