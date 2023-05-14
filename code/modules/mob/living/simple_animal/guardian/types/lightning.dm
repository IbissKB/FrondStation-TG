<<<<<<< HEAD
//Beam
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/effect/ebeam/chain
	name = "lightning chain"
	layer = LYING_MOB_LAYER
	plane = GAME_PLANE_FOV_HIDDEN

<<<<<<< HEAD
/mob/living/simple_animal/hostile/guardian/beam
=======
//Lightning
/mob/living/simple_animal/hostile/guardian/lightning
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	melee_damage_lower = 7
	melee_damage_upper = 7
	attack_verb_continuous = "shocks"
	attack_verb_simple = "shock"
	melee_damage_type = BURN
	attack_sound = 'sound/machines/defib_zap.ogg'
	damage_coeff = list(BRUTE = 0.7, BURN = 0.7, TOX = 0.7, CLONE = 0.7, STAMINA = 0, OXY = 0.7)
	range = 7
<<<<<<< HEAD
	playstyle_string = "<span class='holoparasite'>As a <b>lightning</b> type, you will apply lightning chains to targets on attack and have a lightning chain to your summoner. Lightning chains will shock anyone near them.</span>"
	magic_fluff_string = "<span class='holoparasite'>..And draw the Tesla, a shocking, lethal source of power.</span>"
	tech_fluff_string = "<span class='holoparasite'>Boot sequence complete. Lightning modules active. Holoparasite swarm online.</span>"
	carp_fluff_string = "<span class='holoparasite'>CARP CARP CARP! Caught one! It's a lightning carp! Everyone else goes zap zap.</span>"
	miner_fluff_string = "<span class='holoparasite'>You encounter... Iron, a conductive master of lightning.</span>"
	var/datum/beam/summonerchain
	var/list/enemychains = list()
	var/successfulshocks = 0

/mob/living/simple_animal/hostile/guardian/beam/AttackingTarget()
	. = ..()
	if(. && isliving(target) && target != src && target != summoner)
		cleardeletedchains()
		for(var/chain in enemychains)
			var/datum/beam/B = chain
			if(B.target == target)
				return //oh this guy already HAS a chain, let's not chain again
		if(enemychains.len > 2)
			var/datum/beam/C = pick(enemychains)
			qdel(C)
			enemychains -= C
		enemychains += Beam(target, "lightning[rand(1,12)]", maxdistance=7, beam_type=/obj/effect/ebeam/chain)

/mob/living/simple_animal/hostile/guardian/beam/Destroy()
	removechains()
	return ..()

/mob/living/simple_animal/hostile/guardian/beam/Manifest()
	. = ..()
	if(.)
		if(summoner)
			summonerchain = Beam(summoner, "lightning[rand(1,12)]", beam_type=/obj/effect/ebeam/chain)
		while(loc != summoner)
			if(successfulshocks > 5)
				successfulshocks = 0
			if(shockallchains())
				successfulshocks++
			SLEEP_CHECK_DEATH(3, src)

/mob/living/simple_animal/hostile/guardian/beam/Recall()
	. = ..()
	if(.)
		removechains()

/mob/living/simple_animal/hostile/guardian/beam/proc/cleardeletedchains()
	if(summonerchain && QDELETED(summonerchain))
		summonerchain = null
	if(enemychains.len)
		for(var/chain in enemychains)
			var/datum/cd = chain
			if(!chain || QDELETED(cd))
				enemychains -= chain

/mob/living/simple_animal/hostile/guardian/beam/proc/shockallchains()
	. = 0
	cleardeletedchains()
	if(summoner)
		if(!summonerchain)
			summonerchain = Beam(summoner, "lightning[rand(1,12)]", beam_type=/obj/effect/ebeam/chain)
		. += chainshock(summonerchain)
	if(enemychains.len)
		for(var/chain in enemychains)
			. += chainshock(chain)

/mob/living/simple_animal/hostile/guardian/beam/proc/removechains()
	if(summonerchain)
		qdel(summonerchain)
		summonerchain = null
	if(enemychains.len)
		for(var/chain in enemychains)
			qdel(chain)
		enemychains = list()

/mob/living/simple_animal/hostile/guardian/beam/proc/chainshock(datum/beam/B)
=======
	playstyle_string = span_holoparasite("As a <b>lightning</b> type, you will apply lightning chains to targets on attack and have a lightning chain to your summoner. Lightning chains will shock anyone near them.")
	magic_fluff_string = span_holoparasite("..And draw the Tesla, a shocking, lethal source of power.")
	tech_fluff_string = span_holoparasite("Boot sequence complete. Lightning modules active. Holoparasite swarm online.")
	carp_fluff_string = span_holoparasite("CARP CARP CARP! Caught one! It's a lightning carp! Everyone else goes zap zap.")
	miner_fluff_string = span_holoparasite("You encounter... Iron, a conductive master of lightning.")
	creator_name = "Lightning"
	creator_desc = "Attacks apply lightning chains to targets. Has a lightning chain to the user. Lightning chains shock everything near them, doing constant damage."
	creator_icon = "lightning"
	/// Beam datum of our lightning chain to the summoner.
	var/datum/beam/summonerchain
	/// List of all lightning chains attached to enemies.
	var/list/enemychains = list()
	/// Amount of shocks we've given through the chain to the summoner.
	var/successfulshocks = 0
	/// Cooldown between shocks.
	COOLDOWN_DECLARE(shock_cooldown)

/mob/living/simple_animal/hostile/guardian/lightning/AttackingTarget(atom/attacked_target)
	. = ..()
	if(!. || !isliving(target) || target == summoner || hasmatchingsummoner(target))
		return
	cleardeletedchains()
	for(var/datum/beam/chain as anything in enemychains)
		if(chain.target == target)
			return //oh this guy already HAS a chain, let's not chain again
	if(length(enemychains) > 2)
		var/datum/beam/enemy_chain = pick(enemychains)
		qdel(enemy_chain)
		enemychains -= enemy_chain
	enemychains += Beam(target, "lightning[rand(1,12)]", maxdistance=7, beam_type=/obj/effect/ebeam/chain)

/mob/living/simple_animal/hostile/guardian/lightning/manifest_effects()
	START_PROCESSING(SSfastprocess, src)
	if(summoner)
		summonerchain = Beam(summoner, "lightning[rand(1,12)]", beam_type=/obj/effect/ebeam/chain)

/mob/living/simple_animal/hostile/guardian/lightning/recall_effects()
	STOP_PROCESSING(SSfastprocess, src)
	removechains()

/mob/living/simple_animal/hostile/guardian/lightning/process(seconds_per_tick)
	if(!COOLDOWN_FINISHED(src, shock_cooldown))
		return
	if(successfulshocks > 5)
		successfulshocks = 0
	if(shockallchains())
		successfulshocks++
	COOLDOWN_START(src, shock_cooldown, 0.3 SECONDS)

/mob/living/simple_animal/hostile/guardian/lightning/proc/cleardeletedchains()
	if(summonerchain && QDELETED(summonerchain))
		summonerchain = null
	for(var/datum/chain as anything in enemychains)
		if(QDELETED(chain))
			enemychains -= chain

/mob/living/simple_animal/hostile/guardian/lightning/proc/shockallchains()
	. = 0
	cleardeletedchains()
	if(summonerchain)
		. += chainshock(summonerchain)
	for(var/chain in enemychains)
		. += chainshock(chain)

/mob/living/simple_animal/hostile/guardian/lightning/proc/removechains()
	QDEL_NULL(summonerchain)
	for(var/chain in enemychains)
		qdel(chain)
	enemychains = list()

/mob/living/simple_animal/hostile/guardian/lightning/proc/chainshock(datum/beam/B) //fuck you, fuck this
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = 0
	var/list/turfs = list()
	for(var/E in B.elements)
		var/obj/effect/ebeam/chainpart = E
		if(chainpart && chainpart.x && chainpart.y && chainpart.z)
			var/turf/T = get_turf_pixel(chainpart)
			turfs |= T
			if(T != get_turf(B.origin) && T != get_turf(B.target))
				for(var/turf/TU in circle_range(T, 1))
					turfs |= TU
	for(var/turf in turfs)
		var/turf/T = turf
		for(var/mob/living/L in T)
			if(L.stat != DEAD && L != src && L != summoner)
				if(hasmatchingsummoner(L)) //if the summoner matches don't hurt them
					continue
				if(successfulshocks > 4)
					L.electrocute_act(0)
					L.visible_message(
						span_danger("[L] was shocked by the lightning chain!"), \
						span_userdanger("You are shocked by the lightning chain!"), \
						span_hear("You hear a heavy electrical crack.") \
					)
				L.adjustFireLoss(1.2) //adds up very rapidly
				. = 1
