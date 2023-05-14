///This component lets you make specific mobs tameable by feeding them
/datum/component/tameable
<<<<<<< HEAD
	///Are we domesticated?
	var/tame = FALSE
=======
	///If true, this atom can only be domesticated by one person
	var/unique
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	///What the mob eats, typically used for taming or animal husbandry.
	var/list/food_types
	///Starting success chance for taming.
	var/tame_chance
	///Added success chance after every failed tame attempt.
	var/bonus_tame_chance
<<<<<<< HEAD
	///For effects once soemthing is tamed
	var/datum/callback/after_tame

/datum/component/tameable/Initialize(food_types, tame_chance, bonus_tame_chance, datum/callback/after_tame)
=======
	///Current chance to tame on interaction
	var/current_tame_chance
	///For effects once soemthing is tamed
	var/datum/callback/after_tame

/datum/component/tameable/Initialize(food_types, tame_chance, bonus_tame_chance, datum/callback/after_tame, unique = TRUE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!isatom(parent)) //yes, you could make a tameable toolbox.
		return COMPONENT_INCOMPATIBLE

	if(food_types)
		src.food_types = food_types
	if(tame_chance)
		src.tame_chance = tame_chance
<<<<<<< HEAD
=======
		src.current_tame_chance = tame_chance
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(bonus_tame_chance)
		src.bonus_tame_chance = bonus_tame_chance
	if(after_tame)
		src.after_tame = after_tame
<<<<<<< HEAD

=======
	src.unique = unique
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	RegisterSignal(parent, COMSIG_PARENT_ATTACKBY, PROC_REF(try_tame))
	RegisterSignal(parent, COMSIG_SIMPLEMOB_SENTIENCEPOTION, PROC_REF(on_tame)) //Instantly succeeds
	RegisterSignal(parent, COMSIG_SIMPLEMOB_TRANSFERPOTION, PROC_REF(on_tame)) //Instantly succeeds

/datum/component/tameable/proc/try_tame(datum/source, obj/item/food, mob/living/attacker, params)
	SIGNAL_HANDLER
	if(!is_type_in_list(food, food_types))
		return
	if(isliving(source))
		var/mob/living/potentially_dead_horse = source
		if(potentially_dead_horse.stat == DEAD)
			to_chat(attacker, span_warning("[parent] is dead!"))
			return COMPONENT_CANCEL_ATTACK_CHAIN

<<<<<<< HEAD
	attacker.visible_message(span_notice("[attacker] hand-feeds [food] to [parent]."), span_notice("You hand-feed [food] to [parent]."))
	qdel(food)
	if(tame)
		return COMPONENT_CANCEL_ATTACK_CHAIN
	if (prob(tame_chance)) //note: lack of feedback message is deliberate, keep them guessing!
		on_tame(attacker)
	else
		tame_chance += bonus_tame_chance
	return COMPONENT_CANCEL_ATTACK_CHAIN

///Ran once taming succeeds
/datum/component/tameable/proc/on_tame(mob/living/tamer)
	SIGNAL_HANDLER
	tame = TRUE

	after_tame?.Invoke(tamer)//Run custom behavior if needed

	if (isliving(parent) && isliving(tamer))
		var/mob/living/tamed = parent
		INVOKE_ASYNC(tamed, TYPE_PROC_REF(/mob/living, befriend), tamer)

	qdel(src)
=======
	var/atom/atom_parent = source
	atom_parent.balloon_alert(attacker, "fed")
	if(unique || !already_friends(attacker))
		if(prob(current_tame_chance)) //note: lack of feedback message is deliberate, keep them guessing!
			on_tame(source, attacker, food)
		else
			current_tame_chance += bonus_tame_chance

	qdel(food)
	return COMPONENT_CANCEL_ATTACK_CHAIN

/// Check if the passed mob is already considered one of our friends
/datum/component/tameable/proc/already_friends(mob/living/potential_friend)
	if(!isliving(parent))
		return FALSE // Figure this out when we actually need it
	var/mob/living/living_parent = parent
	return living_parent.faction.Find(REF(potential_friend))

///Ran once taming succeeds
/datum/component/tameable/proc/on_tame(datum/source, mob/living/tamer, atom/food)
	SIGNAL_HANDLER
	after_tame?.Invoke(tamer, food)//Run custom behavior if needed

	if(isliving(parent) && isliving(tamer))
		var/mob/living/tamed = parent
		INVOKE_ASYNC(tamed, TYPE_PROC_REF(/mob/living, befriend), tamer)

	if(unique)
		qdel(src)
	else
		current_tame_chance = tame_chance
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
