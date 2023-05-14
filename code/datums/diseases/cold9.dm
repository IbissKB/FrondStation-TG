/datum/disease/cold9
	name = "The Cold"
	max_stages = 3
	spread_text = "On contact"
	spread_flags = DISEASE_SPREAD_BLOOD | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS
	cure_text = "Common Cold Anti-bodies & Spaceacillin"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "ICE9-rhinovirus"
	viable_mobtypes = list(/mob/living/carbon/human)
	desc = "If left untreated the subject will slow, as if partly frozen."
	severity = DISEASE_SEVERITY_HARMFUL


<<<<<<< HEAD
/datum/disease/cold9/stage_act(delta_time, times_fired)
=======
/datum/disease/cold9/stage_act(seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	. = ..()
	if(!.)
		return

	switch(stage)
		if(2)
<<<<<<< HEAD
			affected_mob.adjust_bodytemperature(-5 * delta_time)
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("sneeze")
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("cough")
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(DT_PROB(2.5, delta_time))
				to_chat(affected_mob, span_danger("You feel stiff."))
			if(DT_PROB(0.05, delta_time))
=======
			affected_mob.adjust_bodytemperature(-5 * seconds_per_tick)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(SPT_PROB(2.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("You feel stiff."))
			if(SPT_PROB(0.05, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				to_chat(affected_mob, span_notice("You feel better."))
				cure()
				return FALSE
		if(3)
<<<<<<< HEAD
			affected_mob.adjust_bodytemperature(-10 * delta_time)
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("sneeze")
			if(DT_PROB(0.5, delta_time))
				affected_mob.emote("cough")
			if(DT_PROB(0.5, delta_time))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(DT_PROB(5, delta_time))
=======
			affected_mob.adjust_bodytemperature(-10 * seconds_per_tick)
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("sneeze")
			if(SPT_PROB(0.5, seconds_per_tick))
				affected_mob.emote("cough")
			if(SPT_PROB(0.5, seconds_per_tick))
				to_chat(affected_mob, span_danger("Your throat feels sore."))
			if(SPT_PROB(5, seconds_per_tick))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
				to_chat(affected_mob, span_danger("You feel stiff."))
