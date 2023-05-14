/obj/structure/flippedtable
	name = "flipped table"
	desc = "A flipped table."
	icon = 'modular_skyrat/modules/tableflip/icons/flipped_tables.dmi'
	icon_state = "table"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	opacity = FALSE
	var/table_type = /obj/structure/table
<<<<<<< HEAD
	/// Custom materials that the original table used, if any
	var/list/table_materials = list()
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/structure/flippedtable/Initialize(mapload)
	. = ..()

	var/static/list/loc_connections = list(
		COMSIG_ATOM_EXIT = PROC_REF(on_exit),
	)

	AddElement(/datum/element/connect_loc, loc_connections)

/obj/structure/flippedtable/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	var/attempted_dir = get_dir(loc, target)
	if(table_type == /obj/structure/table/glass) //Glass table, jolly ranchers pass
		if(istype(mover) && (mover.pass_flags & PASSGLASS))
			return TRUE
	if(istype(mover, /obj/projectile))
		var/obj/projectile/projectile = mover
		//Lets through bullets shot from behind the cover of the table
		if(projectile.trajectory && angle2dir_cardinal(projectile.trajectory.angle) == dir)
			return TRUE
		return FALSE
	if(attempted_dir == dir)
		return FALSE
	else if(attempted_dir != dir)
		return TRUE

/obj/structure/flippedtable/proc/on_exit(datum/source, atom/movable/leaving, atom/new_location)
	SIGNAL_HANDLER

	if(table_type == /obj/structure/table/glass) //Glass table, jolly ranchers pass
		if(istype(leaving) && (leaving.pass_flags & PASSGLASS))
			return

	if(istype(leaving, /obj/projectile))
		return

	if(get_dir(leaving.loc, new_location) == dir)
		return COMPONENT_ATOM_BLOCK_EXIT

/obj/structure/flippedtable/CtrlShiftClick(mob/user)
	. = ..()
	if(!istype(user) || !user.can_interact_with(src) || iscorticalborer(user)) //skyrat edit: no borer flipping
		return FALSE
	user.visible_message(span_danger("[user] starts flipping [src]!"), span_notice("You start flipping over the [src]!"))
	if(do_after(user, max_integrity * 0.25))
		var/obj/structure/table/new_table = new table_type(src.loc)
		new_table.update_integrity(src.get_integrity())
<<<<<<< HEAD
		if(table_materials)
			new_table.set_custom_materials(table_materials)
=======
		if(custom_materials)
			new_table.set_custom_materials(custom_materials)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		user.visible_message(span_danger("[user] flips over the [src]!"), span_notice("You flip over the [src]!"))
		playsound(src, 'sound/items/trayhit2.ogg', 100)
		qdel(src)

//TABLES

/obj/structure/table/CtrlShiftClick(mob/living/user)
	. = ..()
	if(!istype(user) || !user.can_interact_with(src) || isobserver(user) || iscorticalborer(user))
		return
	if(!can_flip)
		return
	user.visible_message(span_danger("[user] starts flipping [src]!"), span_notice("You start flipping over the [src]!"))
	if(!do_after(user, max_integrity * 0.25))
		return

	var/obj/structure/flippedtable/flipped_table = new flipped_table_type(src.loc)
	flipped_table.name = "flipped [src.name]"
<<<<<<< HEAD
	flipped_table.desc = "[src.desc] It is flipped!"
=======
	flipped_table.desc = "[src.desc]<br> It's been flipped on its side!"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	flipped_table.icon_state = src.base_icon_state
	var/new_dir = get_dir(user, flipped_table)
	flipped_table.dir = new_dir
	if(new_dir == NORTH)
		flipped_table.layer = BELOW_MOB_LAYER
	flipped_table.max_integrity = src.max_integrity
	flipped_table.update_integrity(src.get_integrity())
	flipped_table.table_type = src.type
<<<<<<< HEAD
	if(custom_materials)
		flipped_table.table_materials = src.custom_materials
=======
	if(istype(src, /obj/structure/table/greyscale)) //Greyscale tables need greyscale flags!
		flipped_table.material_flags = MATERIAL_EFFECTS | MATERIAL_COLOR
	//Finally, add the custom materials, so the flags still apply to it
	flipped_table.set_custom_materials(custom_materials)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	user.visible_message(span_danger("[user] flips over the [src]!"), span_notice("You flip over the [src]!"))
	playsound(src, 'sound/items/trayhit2.ogg', 100)
	qdel(src)

/obj/structure/table
	var/flipped_table_type = /obj/structure/flippedtable
	var/can_flip = TRUE

/obj/structure/table/rolling
	can_flip = FALSE

<<<<<<< HEAD
=======
/obj/structure/table/wood/shuttle_bar
	can_flip = FALSE

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/structure/table/reinforced //It's bolted to the ground mate
	can_flip = FALSE

/obj/structure/table/optable
	can_flip = FALSE
<<<<<<< HEAD
=======

/obj/structure/table/survival_pod
	can_flip = FALSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
