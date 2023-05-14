/**
 * Get the organ object from the mob matching the passed in typepath
 *
 * Arguments:
 * * typepath The typepath of the organ to get
 */
<<<<<<< HEAD
/mob/proc/getorgan(typepath)
=======
/mob/proc/get_organ_by_type(typepath)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return

/**
 * Get organ objects by zone
 *
 * This will return a list of all the organs that are relevant to the zone that is passedin
 *
 * Arguments:
 * * zone [a BODY_ZONE_X define](https://github.com/tgstation/tgstation/blob/master/code/__DEFINES/combat.dm#L187-L200)
 */
<<<<<<< HEAD
/mob/proc/getorganszone(zone)
	return
=======
/mob/proc/get_organs_for_zone(zone)
	return

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/**
 * Returns a list of all organs in specified slot
 *
 * Arguments:
 * * slot Slot to get the organs from
 */
<<<<<<< HEAD
/mob/proc/getorganslot(slot)
	return

/mob/living/carbon/getorgan(typepath)
	return (locate(typepath) in internal_organs + external_organs)

/mob/living/carbon/getorganszone(zone, include_children = FALSE)
	var/valid_organs = list()
	for(var/obj/item/organ/organ as anything in internal_organs + external_organs)
=======
/mob/proc/get_organ_slot(slot)
	return

/mob/living/carbon/get_organ_by_type(typepath)
	return (locate(typepath) in organs)

/mob/living/carbon/get_organs_for_zone(zone, include_children = FALSE)
	var/valid_organs = list()
	for(var/obj/item/organ/organ as anything in organs)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		if(zone == organ.zone)
			valid_organs += organ
		else if(include_children && zone == deprecise_zone(organ.zone))
			valid_organs += organ
	return valid_organs

<<<<<<< HEAD
/mob/living/carbon/getorganslot(slot)
	. = internal_organs_slot[slot]
	if(!.)
		return external_organs_slot[slot]
=======
/mob/living/carbon/get_organ_slot(slot)
	. = organs_slot[slot]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

