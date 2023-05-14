/datum/species/mush/prepare_human_for_preview(mob/living/carbon/human/shrooman)
<<<<<<< HEAD
	shrooman.dna.species.mutant_bodyparts["caps"] = list(MUTANT_INDEX_NAME = "Round", MUTANT_INDEX_COLOR_LIST = list("#FF4B19"))
	shrooman.update_mutant_bodyparts(TRUE)
=======
	shrooman.dna.mutant_bodyparts["caps"] = list(MUTANT_INDEX_NAME = "Round", MUTANT_INDEX_COLOR_LIST = list("#FF4B19"))
	regenerate_organs(shrooman, src, visual_only = TRUE)
	shrooman.update_body(TRUE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
