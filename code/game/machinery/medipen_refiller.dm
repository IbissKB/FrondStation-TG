/obj/machinery/medipen_refiller
	name = "Medipen Refiller"
	desc = "A machine that refills used medipens with chemicals."
	icon = 'icons/obj/machines/medipen_refiller.dmi'
	icon_state = "medipen_refiller"
	density = TRUE
	circuit = /obj/item/circuitboard/machine/medipen_refiller
<<<<<<< HEAD
	/// list of medipen subtypes it can refill
	var/list/allowed = list(/obj/item/reagent_containers/hypospray/medipen = /datum/reagent/medicine/epinephrine,
						    /obj/item/reagent_containers/hypospray/medipen/atropine = /datum/reagent/medicine/atropine,
						    /obj/item/reagent_containers/hypospray/medipen/salbutamol = /datum/reagent/medicine/salbutamol,
						    /obj/item/reagent_containers/hypospray/medipen/oxandrolone = /datum/reagent/medicine/oxandrolone,
						    /obj/item/reagent_containers/hypospray/medipen/salacid = /datum/reagent/medicine/sal_acid,
						    /obj/item/reagent_containers/hypospray/medipen/penacid = /datum/reagent/medicine/pen_acid)
	/// var to prevent glitches in the animation
	var/busy = FALSE

/obj/machinery/medipen_refiller/Initialize(mapload)
	. = ..()
	create_reagents(100, TRANSPARENT)
	for(var/obj/item/stock_parts/matter_bin/B in component_parts)
		reagents.maximum_volume += 100 * B.rating
	AddComponent(/datum/component/plumbing/simple_demand)

=======

	///List of medipen subtypes it can refill and the chems needed for it to work.
	var/static/list/allowed_pens = list(
		/obj/item/reagent_containers/hypospray/medipen = /datum/reagent/medicine/epinephrine,
		/obj/item/reagent_containers/hypospray/medipen/atropine = /datum/reagent/medicine/atropine,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = /datum/reagent/medicine/salbutamol,
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = /datum/reagent/medicine/oxandrolone,
		/obj/item/reagent_containers/hypospray/medipen/salacid = /datum/reagent/medicine/sal_acid,
		/obj/item/reagent_containers/hypospray/medipen/penacid = /datum/reagent/medicine/pen_acid,
	)

/obj/machinery/medipen_refiller/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/plumbing/simple_demand)
	register_context()
	CheckParts()

/obj/machinery/medipen_refiller/add_context(atom/source, list/context, obj/item/held_item, mob/user)
	if(held_item)
		if(held_item.tool_behaviour == TOOL_WRENCH)
			context[SCREENTIP_CONTEXT_LMB] = anchored ? "Unsecure" : "Secure"
		else if(held_item.tool_behaviour == TOOL_CROWBAR && panel_open)
			context[SCREENTIP_CONTEXT_LMB] = "Deconstruct"
		else if(held_item.tool_behaviour == TOOL_SCREWDRIVER)
			context[SCREENTIP_CONTEXT_LMB] = panel_open ? "Close panel" : "Open panel"
		else if(is_reagent_container(held_item) && held_item.is_open_container())
			context[SCREENTIP_CONTEXT_LMB] = "Refill machine"
		else if(istype(held_item, /obj/item/reagent_containers/hypospray/medipen) && reagents.has_reagent(allowed_pens[held_item.type]))
			context[SCREENTIP_CONTEXT_LMB] = "Refill medipen"
		else if(istype(held_item, /obj/item/plunger))
			context[SCREENTIP_CONTEXT_LMB] = "Plunge machine"
	return CONTEXTUAL_SCREENTIP_SET
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/medipen_refiller/RefreshParts()
	. = ..()
	var/new_volume = 100
<<<<<<< HEAD
	for(var/obj/item/stock_parts/matter_bin/B in component_parts)
		new_volume += 100 * B.rating
=======
	for(var/datum/stock_part/matter_bin/matter_bin in component_parts)
		new_volume += (100 * matter_bin.tier)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!reagents)
		create_reagents(new_volume, TRANSPARENT)
	reagents.maximum_volume = new_volume
	return TRUE

<<<<<<< HEAD
///  handles the messages and animation, calls refill to end the animation
/obj/machinery/medipen_refiller/attackby(obj/item/I, mob/user, params)
	if(busy)
		to_chat(user, span_danger("The machine is busy."))
		return
	if(is_reagent_container(I) && I.is_open_container())
		var/obj/item/reagent_containers/RC = I
		var/units = RC.reagents.trans_to(src, RC.amount_per_transfer_from_this, transfered_by = user)
		if(units)
			to_chat(user, span_notice("You transfer [units] units of the solution to the [name]."))
			return
		else
			to_chat(user, span_danger("The [name] is full."))
			return
	if(istype(I, /obj/item/reagent_containers/hypospray/medipen))
		var/obj/item/reagent_containers/hypospray/medipen/P = I
		if(!(LAZYFIND(allowed, P.type)))
			to_chat(user, span_danger("Error! Unknown schematics."))
			return
		if(P.reagents?.reagent_list.len)
			to_chat(user, span_notice("The medipen is already filled."))
			return
		if(reagents.has_reagent(allowed[P.type], 10))
			busy = TRUE
			add_overlay("active")
			addtimer(CALLBACK(src, PROC_REF(refill), P, user), 20)
			qdel(P)
			return
		to_chat(user, span_danger("There aren't enough reagents to finish this operation."))
		return
	..()
=======
/obj/machinery/medipen_refiller/attackby(obj/item/weapon, mob/user, params)
	if(DOING_INTERACTION(user, src))
		balloon_alert(user, "already interacting!")
		return
	if(is_reagent_container(weapon) && weapon.is_open_container())
		var/obj/item/reagent_containers/reagent_container = weapon
		if(!length(reagent_container.reagents.reagent_list))
			balloon_alert(user, "nothing to transfer!")
			return
		var/units = reagent_container.reagents.trans_to(src, reagent_container.amount_per_transfer_from_this, transfered_by = user)
		if(units)
			balloon_alert(user, "[units] units transfered")
		else
			balloon_alert(user, "reagent storage full!")
		return
	if(istype(weapon, /obj/item/reagent_containers/hypospray/medipen))
		var/obj/item/reagent_containers/hypospray/medipen/medipen = weapon
		if(!(LAZYFIND(allowed_pens, medipen.type)))
			balloon_alert(user, "medipen incompatible!")
			return
		if(medipen.reagents?.reagent_list.len)
			balloon_alert(user, "medipen full!")
			return
		if(!reagents.has_reagent(allowed_pens[medipen.type], 10))
			balloon_alert(user, "not enough reagents!")
			return
		add_overlay("active")
		if(do_after(user, 2 SECONDS, src))
			medipen.reagents.maximum_volume = initial(medipen.reagents.maximum_volume)
			medipen.add_initial_reagents()
			reagents.remove_reagent(allowed_pens[medipen.type], 10)
			balloon_alert(user, "refilled")
			use_power(active_power_usage)
		cut_overlays()
		return
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/medipen_refiller/plunger_act(obj/item/plunger/P, mob/living/user, reinforced)
	to_chat(user, span_notice("You start furiously plunging [name]."))
	if(do_after(user, 30, target = src))
		to_chat(user, span_notice("You finish plunging the [name]."))
		reagents.expose(get_turf(src), TOUCH)
		reagents.clear_reagents()

/obj/machinery/medipen_refiller/wrench_act(mob/living/user, obj/item/tool)
<<<<<<< HEAD
	. = ..()
	default_unfasten_wrench(user, tool)
	return TOOL_ACT_TOOLTYPE_SUCCESS

/obj/machinery/medipen_refiller/crowbar_act(mob/user, obj/item/I)
	..()
	default_deconstruction_crowbar(I)
	return TRUE

/obj/machinery/medipen_refiller/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(!.)
		return default_deconstruction_screwdriver(user, "medipen_refiller_open", "medipen_refiller", I)

/// refills the medipen
/obj/machinery/medipen_refiller/proc/refill(obj/item/reagent_containers/hypospray/medipen/P, mob/user)
	new P.type(loc)
	reagents.remove_reagent(allowed[P.type], 10)
	cut_overlays()
	busy = FALSE
	to_chat(user, span_notice("Medipen refilled."))
	use_power(active_power_usage)
=======
	default_unfasten_wrench(user, tool)
	return TOOL_ACT_TOOLTYPE_SUCCESS

/obj/machinery/medipen_refiller/crowbar_act(mob/living/user, obj/item/tool)
	default_deconstruction_crowbar(tool)
	return TRUE

/obj/machinery/medipen_refiller/screwdriver_act(mob/living/user, obj/item/tool)
	return default_deconstruction_screwdriver(user, "[initial(icon_state)]_open", initial(icon_state), tool)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
