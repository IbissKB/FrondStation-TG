GLOBAL_LIST_INIT(atmos_components, typecacheof(list(/obj/machinery/atmospherics)))
//Smart pipes... or are they?
/obj/machinery/atmospherics/pipe/smart
	icon = 'icons/obj/atmospherics/pipes/simple.dmi'
	icon_state = "pipe11-3"

	name = "pipe"
	desc = "A one meter section of regular pipe."

	device_type = QUATERNARY
	construction_type = /obj/item/pipe/quaternary
	pipe_state = "manifold4w"
	///Current active connections
	var/connections = NONE
<<<<<<< HEAD

/obj/machinery/atmospherics/pipe/smart/update_pipe_icon()
	icon = 'icons/obj/atmospherics/pipes/pipes_bitmask.dmi'
	connections = NONE

=======
	///Was this pipe created during map load
	var/map_loaded_pipe = FALSE

/obj/machinery/atmospherics/pipe/smart/Initialize(mapload)
	map_loaded_pipe = mapload
	return ..()

///helper function to append all directions into an single bit flag
/obj/machinery/atmospherics/pipe/smart/proc/append_directions(list/spanning_directions)
	var/bit_flag = NONE
	for(var/i in 1 to length(spanning_directions))
		var/spanning_direction = spanning_directions[i]
		if(!spanning_direction)
			continue
		bit_flag |= spanning_direction
	return bit_flag

/obj/machinery/atmospherics/pipe/smart/update_pipe_icon()
	icon = 'icons/obj/atmospherics/pipes/pipes_bitmask.dmi'

	//find all directions this pipe is connected with other nodes
	connections = NONE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	for(var/i in 1 to device_type)
		if(!nodes[i])
			continue
		var/obj/machinery/atmospherics/node = nodes[i]
		var/connected_dir = get_dir(src, node)
		connections |= connected_dir
<<<<<<< HEAD
	var/bitfield = CARDINAL_TO_FULLPIPES(connections)
	dir = check_binary_direction(connections)

	// If we dont have enough bits to make a proper sprite, add some shortpipe bits
=======

	//set the correct direction for this node in case of binary directions
	switch(connections)
		if(EAST | WEST)
			dir = EAST
		if(SOUTH | NORTH)
			dir = SOUTH
		else
			dir = connections
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	// Smart pipe icons differ from classic pipe icons in that we stop adding
	// short pipe directions as soon as we find a valid sprite, rather than
	// adding in all connectable directions.
	// This prevents a lot of visual clutter, though it does make it harder to
	// notice completely disconnected pipes.
<<<<<<< HEAD
=======
	var/bitfield = CARDINAL_TO_FULLPIPES(connections)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(ISSTUB(connections))
		var/bits_to_add = NONE
		if(connections != NONE)
			bits_to_add |= REVERSE_DIR(connections) & initialize_directions
<<<<<<< HEAD
		var/candidates = initialize_directions
		var/shift = 0
		// Note that candidates "should" never reach 0, as stub pipes are not allowed and break things
		while (ISSTUB(connections | bits_to_add) && (candidates >> shift) != 0)
			bits_to_add |= candidates & (1 << shift)
			shift += 1
		bitfield |= CARDINAL_TO_SHORTPIPES(bits_to_add)

=======

		var/candidate = 0
		var/shift = 0

		// Note that candidates "should" never reach 0, as stub pipes are not allowed and break things
		while (ISSTUB(connections | bits_to_add) && (initialize_directions >> shift)!=0)
			//lets see if this direction is eligable to be added
			candidate = initialize_directions & (1 << shift)
			//we dont want to add connections again else it creates wrong values & its also redundant[bitfield was already initialized with connections so we shoudnt append it again]
			if(!(candidate & connections))
				bits_to_add |= candidate
			shift += 1
		bitfield |= CARDINAL_TO_SHORTPIPES(bits_to_add)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = "[bitfield]_[piping_layer]"

/obj/machinery/atmospherics/pipe/smart/set_init_directions(init_dir)
	if(init_dir)
		initialize_directions = init_dir
	else
		initialize_directions = ALL_CARDINALS

<<<<<<< HEAD
/obj/machinery/atmospherics/pipe/smart/proc/check_binary_direction(direction)
	switch(direction)
		if(EAST|WEST)
			return EAST
		if(SOUTH|NORTH)
			return SOUTH
		else
			return direction

/obj/machinery/atmospherics/pipe/smart/proc/check_manifold_direction(direction)
	switch(direction)
		if(NORTH|SOUTH|EAST)
			return WEST
		if(NORTH|SOUTH|WEST)
			return EAST
		if(NORTH|WEST|EAST)
			return SOUTH
		if(SOUTH|WEST|EAST)
			return NORTH
		else
			return null

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
//mapping helpers
/obj/machinery/atmospherics/pipe/smart/simple
	icon = 'icons/obj/atmospherics/pipes/simple.dmi'
	icon_state = "pipe11-3"

/obj/machinery/atmospherics/pipe/smart/manifold
	icon = 'icons/obj/atmospherics/pipes/manifold.dmi'
	icon_state = "manifold-3"

/obj/machinery/atmospherics/pipe/smart/manifold4w
	icon = 'icons/obj/atmospherics/pipes/manifold.dmi'
	icon_state = "manifold4w-3"
