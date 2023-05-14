/datum/antagonist/nightmare
	name = "\improper Nightmare"
<<<<<<< HEAD
	antagpanel_category = "Nightmare"
=======
	antagpanel_category = ANTAG_GROUP_ABOMINATIONS
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	job_rank = ROLE_NIGHTMARE
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	show_to_ghosts = TRUE
	ui_name = "AntagInfoNightmare"
	suicide_cry = "FOR THE DARKNESS!!"
	preview_outfit = /datum/outfit/nightmare

<<<<<<< HEAD
=======
/datum/antagonist/nightmare/greet()
	. = ..()
	owner.announce_objectives()

/datum/antagonist/nightmare/on_gain()
	forge_objectives()
	. = ..()

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/datum/outfit/nightmare
	name = "Nightmare (Preview only)"

/datum/outfit/nightmare/post_equip(mob/living/carbon/human/human, visualsOnly)
	human.set_species(/datum/species/shadow/nightmare)
<<<<<<< HEAD
=======

/datum/objective/nightmare_fluff

/datum/objective/nightmare_fluff/New()
	var/list/explanation_texts = list(
		"Consume the last glimmer of light from the space station.",
		"Bring judgment upon the daywalkers.",
		"Extinguish the flame of this hellscape.",
		"Reveal the true nature of the shadows.",
		"From the shadows, all shall perish.",
		"Conjure nightfall by blade or by flame.",
		"Bring the darkness to the light."
	)
	explanation_text = pick(explanation_texts)
	..()

/datum/objective/nightmare_fluff/check_completion()
	return owner.current.stat != DEAD

/datum/antagonist/nightmare/forge_objectives()
	var/datum/objective/nightmare_fluff/objective = new
	objective.owner = owner
	objectives += objective
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
