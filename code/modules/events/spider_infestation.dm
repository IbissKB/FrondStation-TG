/datum/round_event_control/spider_infestation
	name = "Spider Infestation"
	typepath = /datum/round_event/spider_infestation
	weight = 10
	max_occurrences = 1
	min_players = 20
	dynamic_should_hijack = TRUE
	category = EVENT_CATEGORY_ENTITIES
	description = "Spawns spider eggs, ready to hatch."
<<<<<<< HEAD
=======
	min_wizard_trigger_potency = 5
	max_wizard_trigger_potency = 7
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/round_event/spider_infestation
	announce_when = 400
	var/spawncount = 2

/datum/round_event/spider_infestation/setup()
	announce_when = rand(announce_when, announce_when + 50)

/datum/round_event/spider_infestation/announce(fake)
	priority_announce("Unidentified lifesigns detected coming aboard [station_name()]. Secure any exterior access, including ducting and ventilation.", "Lifesign Alert", ANNOUNCER_ALIENS)

/datum/round_event/spider_infestation/start()
	create_midwife_eggs(spawncount)

/proc/create_midwife_eggs(amount)
<<<<<<< HEAD
	var/list/spawn_locs = list()
	for(var/x in GLOB.xeno_spawn)
		var/turf/spawn_turf = x
		var/light_amount = spawn_turf.get_lumcount()
		if(light_amount < SHADOW_SPECIES_LIGHT_THRESHOLD)
			spawn_locs += spawn_turf
	if(spawn_locs.len < amount)
		message_admins("Not enough valid spawn locations found in GLOB.xeno_spawn, aborting spider spawning...")
		return MAP_ERROR
	var/turf/spawn_loc = pick_n_take(spawn_locs)
	while(amount > 0)
		var/obj/effect/mob_spawn/ghost_role/spider/midwife/new_eggs = new /obj/effect/mob_spawn/ghost_role/spider/midwife(spawn_loc)
=======
	while(amount > 0)
		var/turf/spawn_loc = find_maintenance_spawn(atmos_sensitive = TRUE, require_darkness = TRUE)
		if(isnull(spawn_loc))
			return //Admins will have already been notified of the spawning failure at this point
		var/obj/effect/mob_spawn/ghost_role/spider/midwife/new_eggs = new (spawn_loc)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		new_eggs.amount_grown = 98
		amount--
	log_game("Midwife spider eggs were spawned via an event.")
	return TRUE

