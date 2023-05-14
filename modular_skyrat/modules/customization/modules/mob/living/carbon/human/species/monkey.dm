<<<<<<< HEAD
/datum/species/monkey/prepare_human_for_preview(mob/living/carbon/human/monke)
	monke.update_mutant_bodyparts(force_update = TRUE)
	monke.update_body(is_creating = TRUE)
=======
/datum/species/monkey
	default_mutant_bodyparts = list("tail" = "Monkey")

/datum/species/monkey/prepare_human_for_preview(mob/living/carbon/human/monke)
	regenerate_organs(monke, src, visual_only = TRUE)
	monke.update_body(is_creating = TRUE)

/datum/species/monkey/get_custom_worn_icon(item_slot, obj/item/item)
	return item.worn_icon_monkey

/datum/species/monkey/set_custom_worn_icon(item_slot, obj/item/item, icon/icon)
	item.worn_icon_monkey = icon
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
