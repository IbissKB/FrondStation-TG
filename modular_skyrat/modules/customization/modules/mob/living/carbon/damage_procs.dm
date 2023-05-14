<<<<<<< HEAD
/mob/living/carbon/adjustOxyLoss(amount, updating_health = TRUE, forced = FALSE, required_biotype)
=======
/mob/living/carbon/adjustOxyLoss(amount, updating_health = TRUE, forced = FALSE, required_biotype, required_respiration_type)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(HAS_TRAIT(src, TRAIT_OXYIMMUNE)) //Prevents oxygen damage
		amount = min(amount, 0)
	return ..()
