/datum/antagonist/revenant
	name = "\improper Revenant"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
<<<<<<< HEAD
=======
	antagpanel_category = ANTAG_GROUP_HORRORS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/antagonist/revenant/greet()
	. = ..()
	owner.announce_objectives()

<<<<<<< HEAD
/datum/antagonist/revenant/proc/forge_objectives()
	var/datum/objective/revenant/objective = new
	objective.owner = owner
	objectives += objective
	var/datum/objective/revenant_fluff/objective2 = new
	objective2.owner = owner
	objectives += objective2

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/antagonist/revenant/on_gain()
	forge_objectives()
	. = ..()

/datum/antagonist/revenant/get_preview_icon()
	return finish_preview_icon(icon('icons/mob/simple/mob.dmi', "revenant_idle"))
<<<<<<< HEAD
=======

/datum/antagonist/revenant/forge_objectives()
	var/datum/objective/revenant/objective = new
	objective.owner = owner
	objectives += objective
	var/datum/objective/revenant_fluff/objective2 = new
	objective2.owner = owner
	objectives += objective2
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
