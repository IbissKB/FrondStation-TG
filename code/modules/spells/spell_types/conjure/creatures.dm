/datum/action/cooldown/spell/conjure/creature
	name = "Summon Creature Swarm"
	desc = "This spell tears the fabric of reality, allowing horrific daemons to spill forth."
	sound = 'sound/magic/summonitems_generic.ogg'

	school = SCHOOL_CONJURATION
	cooldown_time = 2 MINUTES

	invocation = "IA IA"
	invocation_type = INVOCATION_SHOUT
	spell_requirements = NONE

	summon_radius = 3
<<<<<<< HEAD
	summon_type = list(/mob/living/simple_animal/hostile/netherworld)
=======
	summon_type = list(/mob/living/basic/creature)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	summon_amount = 10
