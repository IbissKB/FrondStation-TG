
<<<<<<< HEAD
/datum/ai_behavior/break_spine/bane/finish_action(datum/ai_controller/controller, succeeded)
	var/list/bane_quotes = strings("bane.json", "bane")
	var/mob/living/bane = controller.pawn
	bane.say(pick(bane_quotes))
	. = ..()
=======
/datum/ai_behavior/break_spine/bane/finish_action(datum/ai_controller/controller, succeeded, target_key)
	if(succeeded)
		var/list/bane_quotes = strings("bane.json", "bane")
		var/mob/living/bane = controller.pawn
		bane.say(pick(bane_quotes))
	return ..()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
