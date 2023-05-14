/datum/action/cooldown/spell/shapeshift/wizard
	name = "Wild Shapeshift"
	desc = "Take on the shape of another for a time to use their natural abilities. \
		Once you've made your choice, it cannot be changed."

	cooldown_time = 20 SECONDS
	cooldown_reduction_per_rank = 3.75 SECONDS

	invocation = "RAC'WA NO!"
	invocation_type = INVOCATION_SHOUT
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC

	possible_shapes = list(
		/mob/living/basic/mouse,
		/mob/living/basic/pet/dog/corgi,
<<<<<<< HEAD
		/mob/living/simple_animal/hostile/carp/ranged/chaos,
		/mob/living/simple_animal/bot/secbot/ed209,
		/mob/living/simple_animal/hostile/giant_spider/viper/wizard,
=======
		/mob/living/basic/carp/magic/chaos,
		/mob/living/simple_animal/bot/secbot/ed209,
		/mob/living/basic/giant_spider/viper/wizard,
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		/mob/living/simple_animal/hostile/construct/juggernaut/mystic,
	)
