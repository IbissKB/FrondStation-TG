/// Gives the target critically bad wounds
/datum/smite/boneless
	name = ":B:oneless"

/datum/smite/boneless/effect(client/user, mob/living/target)
	. = ..()

	if (!iscarbon(target))
		to_chat(user, span_warning("This must be used on a carbon mob."), confidential = TRUE)
		return

	var/mob/living/carbon/carbon_target = target
<<<<<<< HEAD
	for(var/_limb in carbon_target.bodyparts)
		var/obj/item/bodypart/limb = _limb
		var/type_wound = pick(list(/datum/wound/blunt/critical, /datum/wound/blunt/severe, /datum/wound/blunt/critical, /datum/wound/blunt/severe, /datum/wound/blunt/moderate))
=======
	for(var/obj/item/bodypart/limb as anything in carbon_target.bodyparts)
		var/type_wound = pick(list(
			/datum/wound/blunt/critical,
			/datum/wound/blunt/severe,
			/datum/wound/blunt/critical,
			/datum/wound/blunt/severe,
			/datum/wound/blunt/moderate,
		))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		limb.force_wound_upwards(type_wound, smited = TRUE)
