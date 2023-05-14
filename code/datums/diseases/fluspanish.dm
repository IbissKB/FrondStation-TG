/datum/disease/fluspanish
	name = "Spanish inquisition Flu"
	max_stages = 3
	spread_text = "Airborne"
	cure_text = "Spaceacillin & Anti-bodies to the common flu"
	cures = list(/datum/reagent/medicine/spaceacillin)
	cure_chance = 5
	agent = "1nqu1s1t10n flu virion"
	viable_mobtypes = list(/mob/living/carbon/human)
	spreading_modifier = 0.75
	desc = "If left untreated the subject will burn to death for being a heretic."
	severity = DISEASE_SEVERITY_DANGEROUS


<<<<<<< HEAD
/datum/disease/fluspanish/stage_act(delta_time, times_fired)
=======
/datum/disease/fluspanish/stage_act(seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
<<<<<<< HEAD
			affected_mob.adjust_bodytemperature(5 * delta_time)
			if(DT_PROB(2.5, delta_time))
				affected_mob.emote("sneeze")
			if(DT_PROB(2.5, delta_time))
				affected_mob.emote("cough")
			if(DT_PROB(0.5, delta_time))
=======
			affected_mob.adjust_bodytemperature(5 * seconds_per_tick)
			if(SPT_PROB(2.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(2.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				to_chat(affected_mob, span_danger("You're burning in your own skin!"))
				affected_mob.take_bodypart_damage(0, 5, updating_health = FALSE)

		if(3)
<<<<<<< HEAD
			affected_mob.adjust_bodytemperature(10 * delta_time)
			if(DT_PROB(2.5, delta_time))
				affected_mob.emote("sneeze")
			if(DT_PROB(2.5, delta_time))
				affected_mob.emote("cough")
			if(DT_PROB(2.5, delta_time))
=======
			affected_mob.adjust_bodytemperature(10 * seconds_per_tick)
			if(SPT_PROB(2.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(2.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(2.5, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				to_chat(affected_mob, span_danger("You're burning in your own skin!"))
				affected_mob.take_bodypart_damage(0, 5, updating_health = FALSE)
