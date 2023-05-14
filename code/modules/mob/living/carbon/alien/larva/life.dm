

<<<<<<< HEAD
/mob/living/carbon/alien/larva/Life(delta_time = SSMOBS_DT, times_fired)
=======
/mob/living/carbon/alien/larva/Life(seconds_per_tick = SSMOBS_DT, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if (notransform)
		return
	if(!..() || IS_IN_STASIS(src) || (amount_grown >= max_grown))
		return // We're dead, in stasis, or already grown.
	// GROW!
<<<<<<< HEAD
	amount_grown = min(amount_grown + (0.5 * delta_time), max_grown)
=======
	amount_grown = min(amount_grown + (0.5 * seconds_per_tick), max_grown)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	update_icons()


/mob/living/carbon/alien/larva/update_stat()
	if(status_flags & GODMODE)
		return
	if(stat != DEAD)
<<<<<<< HEAD
		if(health<= -maxHealth || !getorgan(/obj/item/organ/internal/brain))
=======
		if(health <= -maxHealth || !get_organ_by_type(/obj/item/organ/internal/brain))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
			death()
			return
		if((HAS_TRAIT(src, TRAIT_KNOCKEDOUT)))
			set_stat(UNCONSCIOUS)
		else
			if(stat == UNCONSCIOUS)
				set_resting(FALSE)
			set_stat(CONSCIOUS)
	update_damage_hud()
	update_health_hud()
