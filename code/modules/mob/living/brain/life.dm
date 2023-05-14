
<<<<<<< HEAD
/mob/living/brain/Life(delta_time = SSMOBS_DT, times_fired)
=======
/mob/living/brain/Life(seconds_per_tick = SSMOBS_DT, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if (notransform)
		return
	if(!loc)
		return
	. = ..()
<<<<<<< HEAD
	handle_emp_damage(delta_time, times_fired)
=======
	handle_emp_damage(seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/mob/living/brain/update_stat()
	if(status_flags & GODMODE)
		return
	if(health > HEALTH_THRESHOLD_DEAD)
		return
	if(stat != DEAD)
		death()
	var/obj/item/organ/internal/brain/BR
	if(container?.brain)
		BR = container.brain
	else if(istype(loc, /obj/item/organ/internal/brain))
		BR = loc
	if(BR)
<<<<<<< HEAD
		BR.setOrganDamage(BRAIN_DAMAGE_DEATH) //beaten to a pulp

/mob/living/brain/proc/handle_emp_damage(delta_time, times_fired)
=======
		BR.set_organ_damage(BRAIN_DAMAGE_DEATH) //beaten to a pulp

/mob/living/brain/proc/handle_emp_damage(seconds_per_tick, times_fired)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!emp_damage)
		return

	if(stat == DEAD)
		emp_damage = 0
	else
<<<<<<< HEAD
		emp_damage = max(emp_damage - (0.5 * delta_time), 0)

/mob/living/brain/handle_traits(delta_time, times_fired)
	return



=======
		emp_damage = max(emp_damage - (0.5 * seconds_per_tick), 0)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
