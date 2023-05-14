/turf/closed/wall/material
	name = "wall"
	desc = "A huge chunk of material used to separate rooms."
	icon = 'icons/turf/walls/materialwall.dmi'
	icon_state = "materialwall-0"
	base_icon_state = "materialwall"
	smoothing_flags = SMOOTH_BITMASK
<<<<<<< HEAD
	smoothing_groups = list(SMOOTH_GROUP_WALLS, SMOOTH_GROUP_CLOSED_TURFS, SMOOTH_GROUP_MATERIAL_WALLS) // SKYRAT EDIT CHANGE - Sorting them because /tg/ forgot to
	canSmoothWith = list(SMOOTH_GROUP_MATERIAL_WALLS)
=======
	smoothing_groups = SMOOTH_GROUP_WALLS + SMOOTH_GROUP_CLOSED_TURFS + SMOOTH_GROUP_MATERIAL_WALLS
	canSmoothWith = SMOOTH_GROUP_MATERIAL_WALLS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	rcd_memory = null
	material_flags = MATERIAL_EFFECTS | MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS

/turf/closed/wall/material/break_wall()
	for(var/i in custom_materials)
		var/datum/material/M = i
<<<<<<< HEAD
		new M.sheet_type(src, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
=======
		new M.sheet_type(src, FLOOR(custom_materials[M] / SHEET_MATERIAL_AMOUNT, 1))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return new girder_type(src)

/turf/closed/wall/material/devastate_wall()
	for(var/i in custom_materials)
		var/datum/material/M = i
<<<<<<< HEAD
		new M.sheet_type(src, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
=======
		new M.sheet_type(src, FLOOR(custom_materials[M] / SHEET_MATERIAL_AMOUNT, 1))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/turf/closed/wall/material/mat_update_desc(mat)
	desc = "A huge chunk of [mat] used to separate rooms."

