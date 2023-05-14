///If not held, teleport somewhere else
/datum/idle_behavior/idle_ghost_item
	///Chance for item to teleport somewhere else
	var/teleport_chance = 4

<<<<<<< HEAD
/datum/idle_behavior/idle_ghost_item/perform_idle_behavior(delta_time, datum/ai_controller/controller)
	var/obj/item/item_pawn = controller.pawn
	if(ismob(item_pawn.loc)) //Being held. dont teleport
		return
	if(DT_PROB(teleport_chance, delta_time))
=======
/datum/idle_behavior/idle_ghost_item/perform_idle_behavior(seconds_per_tick, datum/ai_controller/controller)
	var/obj/item/item_pawn = controller.pawn
	if(ismob(item_pawn.loc)) //Being held. dont teleport
		return
	if(SPT_PROB(teleport_chance, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		playsound(item_pawn.loc, 'sound/items/haunted/ghostitemattack.ogg', 100, TRUE)
		do_teleport(item_pawn, get_turf(item_pawn), 4, channel = TELEPORT_CHANNEL_MAGIC)
