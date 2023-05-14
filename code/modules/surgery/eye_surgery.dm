/datum/surgery/eye_surgery
	name = "Eye surgery"
	requires_bodypart_type = NONE
	organ_to_manipulate = ORGAN_SLOT_EYES
	possible_locs = list(BODY_ZONE_PRECISE_EYES)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/retract_skin,
		/datum/surgery_step/clamp_bleeders,
		/datum/surgery_step/fix_eyes,
		/datum/surgery_step/close,
	)

//fix eyes
/datum/surgery_step/fix_eyes
	name = "fix eyes (hemostat)"
	implements = list(
		TOOL_HEMOSTAT = 100,
		TOOL_SCREWDRIVER = 45,
		/obj/item/pen = 25)
	time = 64

/datum/surgery/eye_surgery/can_start(mob/user, mob/living/carbon/target)
<<<<<<< HEAD
	var/obj/item/organ/internal/eyes/target_eyes = target.getorganslot(ORGAN_SLOT_EYES)
=======
	var/obj/item/organ/internal/eyes/target_eyes = target.get_organ_slot(ORGAN_SLOT_EYES)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(!target_eyes)
		to_chat(user, span_warning("It's hard to do surgery on someone's eyes when [target.p_they()] [target.p_do()]n't have any."))
		return FALSE
	return TRUE

/datum/surgery_step/fix_eyes/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	display_results(
		user,
		target,
		span_notice("You begin to fix [target]'s eyes..."),
		span_notice("[user] begins to fix [target]'s eyes."),
		span_notice("[user] begins to perform surgery on [target]'s eyes."),
	)
	display_pain(target, "You feel a stabbing pain in your eyes!")

/datum/surgery_step/fix_eyes/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery, default_display_results = FALSE)
<<<<<<< HEAD
	var/obj/item/organ/internal/eyes/target_eyes = target.getorganslot(ORGAN_SLOT_EYES)
=======
	var/obj/item/organ/internal/eyes/target_eyes = target.get_organ_slot(ORGAN_SLOT_EYES)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	user.visible_message(span_notice("[user] successfully fixes [target]'s eyes!"), span_notice("You succeed in fixing [target]'s eyes."))
	display_results(
		user,
		target,
		span_notice("You succeed in fixing [target]'s eyes."),
		span_notice("[user] successfully fixes [target]'s eyes!"),
		span_notice("[user] completes the surgery on [target]'s eyes."),
	)
	display_pain(target, "Your vision blurs, but it seems like you can see a little better now!")
<<<<<<< HEAD
	target.cure_blind(list(EYE_DAMAGE))
	target.set_blindness(0)
	target.cure_nearsighted(list(EYE_DAMAGE))
	target.blur_eyes(35) //this will fix itself slowly.
	target_eyes.setOrganDamage(0)
	return ..()

/datum/surgery_step/fix_eyes/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.getorgan(/obj/item/organ/internal/brain))
=======
	target.remove_status_effect(/datum/status_effect/temporary_blindness)
	target.set_eye_blur_if_lower(70 SECONDS) //this will fix itself slowly.
	target_eyes.set_organ_damage(0) // heals nearsightedness and blindness from eye damage
	return ..()

/datum/surgery_step/fix_eyes/failure(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(target.get_organ_by_type(/obj/item/organ/internal/brain))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		display_results(
			user,
			target,
			span_warning("You accidentally stab [target] right in the brain!"),
			span_warning("[user] accidentally stabs [target] right in the brain!"),
			span_warning("[user] accidentally stabs [target] right in the brain!"),
		)
		display_pain(target, "You feel a visceral stabbing pain right through your head, into your brain!")
		target.adjustOrganLoss(ORGAN_SLOT_BRAIN, 70)
	else
		display_results(
			user,
			target,
			span_warning("You accidentally stab [target] right in the brain! Or would have, if [target] had a brain."),
			span_warning("[user] accidentally stabs [target] right in the brain! Or would have, if [target] had a brain."),
			span_warning("[user] accidentally stabs [target] right in the brain!"),
		)
		display_pain(target, "You feel a visceral stabbing pain right through your head!") // dunno who can feel pain w/o a brain but may as well be consistent.
	return FALSE
