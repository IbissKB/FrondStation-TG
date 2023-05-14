/datum/storage/organ_box

<<<<<<< HEAD
/datum/storage/organ_box/handle_enter(datum/source, obj/item/arrived)
	. = ..()

	if(!istype(arrived))
=======
/datum/storage/organ_box/handle_enter(obj/item/storage/organbox/source, obj/item/arrived)
	. = ..()

	if(!istype(arrived) || !istype(source) || !source.coolant_to_spend())
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
		return

	arrived.freeze()

/datum/storage/organ_box/handle_exit(datum/source, obj/item/gone)
	. = ..()

	if(!istype(gone))
		return

	gone.unfreeze()
