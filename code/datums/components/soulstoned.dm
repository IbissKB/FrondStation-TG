//adds godmode while in the container, prevents moving, and clears these effects up after leaving the stone
/datum/component/soulstoned
	var/atom/movable/container

/datum/component/soulstoned/Initialize(atom/movable/container)
<<<<<<< HEAD
	if(!isanimal(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/simple_animal/S = parent

	src.container = container

	S.forceMove(container)
	S.fully_heal()
	ADD_TRAIT(S, TRAIT_IMMOBILIZED, SOULSTONE_TRAIT)
	ADD_TRAIT(S, TRAIT_HANDS_BLOCKED, SOULSTONE_TRAIT)
	S.status_flags |= GODMODE

	RegisterSignal(S, COMSIG_MOVABLE_MOVED, PROC_REF(free_prisoner))
=======
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/stoned = parent

	src.container = container

	stoned.forceMove(container)
	stoned.fully_heal()
	stoned.add_traits(list(TRAIT_IMMOBILIZED, TRAIT_HANDS_BLOCKED), SOULSTONE_TRAIT)
	stoned.status_flags |= GODMODE

	RegisterSignal(stoned, COMSIG_MOVABLE_MOVED, PROC_REF(free_prisoner))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/component/soulstoned/proc/free_prisoner()
	SIGNAL_HANDLER

<<<<<<< HEAD
	var/mob/living/simple_animal/S = parent
	if(S.loc != container)
		qdel(src)

/datum/component/soulstoned/UnregisterFromParent()
	var/mob/living/simple_animal/S = parent
	S.status_flags &= ~GODMODE
	REMOVE_TRAIT(S, TRAIT_IMMOBILIZED, SOULSTONE_TRAIT)
	REMOVE_TRAIT(S, TRAIT_HANDS_BLOCKED, SOULSTONE_TRAIT)
=======
	var/mob/living/stoned = parent
	if(stoned.loc != container)
		qdel(src)

/datum/component/soulstoned/UnregisterFromParent()
	var/mob/living/stoned = parent
	stoned.status_flags &= ~GODMODE
	stoned.remove_traits(list(TRAIT_IMMOBILIZED, TRAIT_HANDS_BLOCKED), SOULSTONE_TRAIT)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
