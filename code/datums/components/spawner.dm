/datum/component/spawner
<<<<<<< HEAD
	var/mob_types = list(/mob/living/simple_animal/hostile/carp)
	var/spawn_time = 300 //30 seconds default
	var/list/spawned_mobs = list()
	var/spawn_delay = 0
	var/max_mobs = 5
	var/spawn_text = "emerges from"
	var/list/faction = list("mining")



/datum/component/spawner/Initialize(_mob_types, _spawn_time, _faction, _spawn_text, _max_mobs)
	if(_spawn_time)
		spawn_time=_spawn_time
	if(_mob_types)
		mob_types=_mob_types
	if(_faction)
		faction=_faction
	if(_spawn_text)
		spawn_text=_spawn_text
	if(_max_mobs)
		max_mobs=_max_mobs

	RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(stop_spawning))
	START_PROCESSING(SSprocessing, src)
=======
	/// Time to wait between spawns
	var/spawn_time
	/// Maximum number of atoms we can have active at one time
	var/max_spawned
	/// Visible message to show when something spawns
	var/spawn_text
	/// List of atom types to spawn, picked randomly
	var/list/spawn_types
	/// Faction to grant to mobs (only applies to mobs)
	var/list/faction
	/// List of weak references to things we have already created
	var/list/spawned_things = list()
	/// Time until we next spawn
	COOLDOWN_DECLARE(spawn_delay)

/datum/component/spawner/Initialize(spawn_types = list(), spawn_time = 30 SECONDS, max_spawned = 5, faction = list(FACTION_MINING), spawn_text = null)
	if (!islist(spawn_types))
		CRASH("invalid spawn_types to spawn specified for spawner component!")
	src.spawn_time = spawn_time
	src.spawn_types = spawn_types
	src.faction = faction
	src.spawn_text = spawn_text
	src.max_spawned = max_spawned

	RegisterSignal(parent, COMSIG_PARENT_QDELETING, PROC_REF(stop_spawning))
	START_PROCESSING((spawn_time < 2 SECONDS ? SSfastprocess : SSprocessing), src)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/component/spawner/process()
	try_spawn_mob()

<<<<<<< HEAD

=======
/// Stop spawning mobs
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/component/spawner/proc/stop_spawning(force)
	SIGNAL_HANDLER

	STOP_PROCESSING(SSprocessing, src)
<<<<<<< HEAD
	for(var/mob/living/simple_animal/L in spawned_mobs)
		if(L.nest == src)
			L.nest = null
	spawned_mobs = null

/datum/component/spawner/proc/try_spawn_mob()
	var/atom/P = parent
	if(spawned_mobs.len >= max_mobs)
		return
	if(spawn_delay > world.time)
		return
	spawn_delay = world.time + spawn_time
	var/chosen_mob_type = pick(mob_types)
	var/mob/living/simple_animal/L = new chosen_mob_type(P.loc)
	L.flags_1 |= (P.flags_1 & ADMIN_SPAWNED_1)
	spawned_mobs += L
	L.nest = src
	L.faction = src.faction
	P.visible_message(span_danger("[L] [spawn_text] [P]."))
=======
	spawned_things = list()

/// Try to create a new mob
/datum/component/spawner/proc/try_spawn_mob()
	if(!COOLDOWN_FINISHED(src, spawn_delay))
		return
	validate_references()
	if(length(spawned_things) >= max_spawned)
		return
	var/atom/spawner = parent
	COOLDOWN_START(src, spawn_delay, spawn_time)

	var/chosen_mob_type = pick(spawn_types)
	var/atom/created = new chosen_mob_type(spawner.loc)
	created.flags_1 |= (spawner.flags_1 & ADMIN_SPAWNED_1)
	spawned_things += WEAKREF(created)
	if (isliving(created))
		var/mob/living/created_mob = created
		created_mob.faction = src.faction
		RegisterSignal(created, COMSIG_MOB_STATCHANGE, PROC_REF(mob_stat_changed))

	if (spawn_text)
		spawner.visible_message(span_danger("[created] [spawn_text] [spawner]."))

	RegisterSignal(created, COMSIG_PARENT_QDELETING, PROC_REF(on_deleted))

/// Remove weakrefs to atoms which have been killed or deleted without us picking it up somehow
/datum/component/spawner/proc/validate_references()
	for (var/datum/weakref/weak_thing as anything in spawned_things)
		var/atom/previously_spawned = weak_thing.resolve()
		if (!previously_spawned)
			spawned_things -= weak_thing
			continue
		if (!isliving(previously_spawned))
			continue
		var/mob/living/spawned_mob = previously_spawned
		if (spawned_mob.stat != DEAD)
			continue
		spawned_things -= weak_thing

/// Called when an atom we spawned is deleted, remove it from the list
/datum/component/spawner/proc/on_deleted(atom/source)
	SIGNAL_HANDLER
	spawned_things -= WEAKREF(source)

/// Called when a mob we spawned dies, remove it from the list and unregister signals
/datum/component/spawner/proc/mob_stat_changed(mob/living/source)
	if (source.stat != DEAD)
		return
	spawned_things -= WEAKREF(source)
	UnregisterSignal(source, list(COMSIG_PARENT_QDELETING, COMSIG_MOB_STATCHANGE))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
