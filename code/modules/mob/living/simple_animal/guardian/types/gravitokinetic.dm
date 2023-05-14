//gravitokinetic
/mob/living/simple_animal/hostile/guardian/gravitokinetic
	melee_damage_lower = 15
	melee_damage_upper = 15
	damage_coeff = list(BRUTE = 0.75, BURN = 0.75, TOX = 0.75, CLONE = 0.75, STAMINA = 0, OXY = 0.75)
<<<<<<< HEAD
	playstyle_string = "<span class='holoparasite'>As a <b>gravitokinetic</b> type, you can alt click to make the gravity on the ground stronger, and punching applies this effect to a target.</span>"
	magic_fluff_string = "<span class='holoparasite'>..And draw the Singularity, an anomalous force of terror.</span>"
	tech_fluff_string = "<span class='holoparasite'>Boot sequence complete. Gravitokinetic modules loaded. Holoparasite swarm online.</span>"
	carp_fluff_string = "<span class='holoparasite'>CARP CARP CARP! Caught one! It's a gravitokinetic carp! Now do you understand the gravity of the situation?</span>"
	miner_fluff_string = "<span class='holoparasite'>You encounter... Bananium, a master of gravity business.</span>"
	var/list/gravito_targets = list()
	var/gravity_power_range = 10 //how close the stand must stay to the target to keep the heavy gravity
=======
	playstyle_string = span_holoparasite("As a <b>gravitokinetic</b> type, you can right-click to make the gravity on the ground stronger, and punching applies this effect to a target.")
	magic_fluff_string = span_holoparasite("..And draw the Singularity, an anomalous force of terror.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Gravitokinetic modules loaded. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's a gravitokinetic carp! Now do you understand the gravity of the situation?")
	miner_fluff_string = span_holoparasite("You encounter... Bananium, a master of gravity business.")
	creator_name = "Gravitokinetic"
	creator_desc = "Attacks will apply crushing gravity to the target. Can target the ground as well to slow targets advancing on you, but this will affect the user."
	creator_icon = "gravitokinetic"
	/// Targets we have applied our effects on.
	var/list/gravity_targets = list()
	/// Distance in which our ability works
	var/gravity_power_range = 10
	/// Gravity added on punches.
	var/punch_gravity = 5
	/// Gravity added to turfs.
	var/turf_gravity = 3

/mob/living/simple_animal/hostile/guardian/gravitokinetic/Initialize(mapload, theme)
	. = ..()
	AddElement(/datum/element/forced_gravity, 1)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/set_summoner(mob/to_who, different_person)
	. = ..()
	to_who.AddElement(/datum/element/forced_gravity, 1)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/cut_summoner(different_person)
	summoner.RemoveElement(/datum/element/forced_gravity, 1)
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

///Removes gravity from affected mobs upon guardian death to prevent permanent effects
/mob/living/simple_animal/hostile/guardian/gravitokinetic/death()
	. = ..()
<<<<<<< HEAD
	for(var/i in gravito_targets)
		remove_gravity(i)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/AttackingTarget()
	. = ..()
	if(isliving(target) && target != src && target != summoner)
		to_chat(src, "[span_danger("<B>Your punch has applied heavy gravity to [target]!")]</B>")
		add_gravity(target, 5)
		to_chat(target, span_userdanger("Everything feels really heavy!"))

/mob/living/simple_animal/hostile/guardian/gravitokinetic/AltClickOn(atom/A)
	if(isopenturf(A) && is_deployed() && stat != DEAD && in_range(src, A) && !incapacitated())
		var/turf/T = A
		if(isspaceturf(T))
			to_chat(src, span_warning("You cannot add gravity to space!"))
			return
		visible_message(span_danger("[src] slams their fist into the [T]!"), span_notice("You modify the gravity of the [T]."))
		do_attack_animation(T)
		add_gravity(T, 3)
		return
	return ..()

/mob/living/simple_animal/hostile/guardian/gravitokinetic/Recall(forced)
	. = ..()
	to_chat(src, "[span_danger("<B>You have released your gravitokinetic powers!")]</B>")
	for(var/i in gravito_targets)
		remove_gravity(i)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/Manifest(forced)
	. = ..()
	//just make sure to reapply a gravity immunity wherever you summon. it can be overridden but not by you at least
	summoner.AddElement(/datum/element/forced_gravity, 1)
	AddElement(/datum/element/forced_gravity, 1)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	for(var/i in gravito_targets)
		if(get_dist(src, i) > gravity_power_range)
			remove_gravity(i)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/add_gravity(atom/A, new_gravity = 3)
	if(gravito_targets[A])
		return
	A.AddElement(/datum/element/forced_gravity, new_gravity)
	gravito_targets[A] = new_gravity
	RegisterSignal(A, COMSIG_MOVABLE_MOVED, PROC_REF(__distance_check))
	playsound(src, 'sound/effects/gravhit.ogg', 100, TRUE)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/remove_gravity(atom/target)
	if(isnull(gravito_targets[target]))
		return
	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)
	target.RemoveElement(/datum/element/forced_gravity, gravito_targets[target])
	gravito_targets -= target

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/__distance_check(atom/movable/AM, OldLoc, Dir, Forced)
	SIGNAL_HANDLER
	if(get_dist(src, AM) > gravity_power_range)
		remove_gravity(AM)
=======
	for(var/gravity_target in gravity_targets)
		remove_gravity(gravity_target)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/AttackingTarget(atom/attacked_target)
	. = ..()
	if(isliving(target) && !hasmatchingsummoner(attacked_target) && target != src && target != summoner && !gravity_targets[target])
		to_chat(src, span_bolddanger("Your punch has applied heavy gravity to [target]!"))
		add_gravity(target, punch_gravity)
		to_chat(target, span_userdanger("Everything feels really heavy!"))

/mob/living/simple_animal/hostile/guardian/gravitokinetic/UnarmedAttack(atom/attack_target, proximity_flag, list/modifiers)
	if(LAZYACCESS(modifiers, RIGHT_CLICK) && proximity_flag && !gravity_targets[target])
		slam_turf(attack_target)
		return
	return ..()

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/slam_turf(turf/open/slammed)
	if(!isopenturf(slammed) || isgroundlessturf(slammed))
		to_chat(src, span_warning("You cannot add gravity to this!"))
		return
	visible_message(span_danger("[src] slams their fist into the [slammed]!"), span_notice("You modify the gravity of the [slammed]."))
	do_attack_animation(slammed)
	add_gravity(slammed, turf_gravity)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/recall_effects()
	to_chat(src, span_bolddanger("You have released your gravitokinetic powers!"))
	for(var/gravity_target in gravity_targets)
		remove_gravity(gravity_target)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
	. = ..()
	for(var/gravity_target in gravity_targets)
		if(get_dist(src, gravity_target) > gravity_power_range)
			remove_gravity(gravity_target)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/add_gravity(atom/target, new_gravity = 3)
	if(gravity_targets[target])
		return
	target.AddElement(/datum/element/forced_gravity, new_gravity)
	gravity_targets[target] = new_gravity
	RegisterSignal(target, COMSIG_MOVABLE_MOVED, PROC_REF(distance_check))
	playsound(src, 'sound/effects/gravhit.ogg', 100, TRUE)

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/remove_gravity(atom/target)
	if(isnull(gravity_targets[target]))
		return
	UnregisterSignal(target, COMSIG_MOVABLE_MOVED)
	target.RemoveElement(/datum/element/forced_gravity, gravity_targets[target])
	gravity_targets -= target

/mob/living/simple_animal/hostile/guardian/gravitokinetic/proc/distance_check(atom/movable/moving_target, old_loc, dir, forced)
	SIGNAL_HANDLER
	if(get_dist(src, moving_target) > gravity_power_range)
		remove_gravity(moving_target)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
