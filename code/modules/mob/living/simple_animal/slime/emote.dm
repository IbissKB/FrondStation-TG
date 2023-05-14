/datum/emote/slime
	mob_type_allowed_typecache = /mob/living/simple_animal/slime
	mob_type_blacklist_typecache = list()

/datum/emote/slime/bounce
	key = "bounce"
	key_third_person = "bounces"
	message = "bounces in place."

/datum/emote/slime/jiggle
	key = "jiggle"
	key_third_person = "jiggles"
	message = "jiggles!"

/datum/emote/slime/light
	key = "light"
	key_third_person = "lights"
	message = "lights up for a bit, then stops."

/datum/emote/slime/vibrate
	key = "vibrate"
	key_third_person = "vibrates"
	message = "vibrates!"

/datum/emote/slime/mood
	key = "moodnone"
<<<<<<< HEAD
	var/mood = null
=======
	///Mood key, will set the slime's emote to this.
	var/mood_key
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/emote/slime/mood/run_emote(mob/user, params, type_override, intentional)
	. = ..()
	if(!.)
		return
	var/mob/living/simple_animal/slime/slime_user = user
<<<<<<< HEAD
	slime_user.mood = mood
=======
	slime_user.current_mood = mood_key
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	slime_user.regenerate_icons()

/datum/emote/slime/mood/sneaky
	key = "moodsneaky"
<<<<<<< HEAD
	mood = "mischievous"

/datum/emote/slime/mood/smile
	key = "moodsmile"
	mood = ":3"

/datum/emote/slime/mood/cat
	key = "moodcat"
	mood = ":33"

/datum/emote/slime/mood/pout
	key = "moodpout"
	mood = "pout"

/datum/emote/slime/mood/sad
	key = "moodsad"
	mood = "sad"

/datum/emote/slime/mood/angry
	key = "moodangry"
	mood = "angry"
=======
	mood_key = "mischievous"

/datum/emote/slime/mood/smile
	key = "moodsmile"
	mood_key = ":3"

/datum/emote/slime/mood/cat
	key = "moodcat"
	mood_key = ":33"

/datum/emote/slime/mood/pout
	key = "moodpout"
	mood_key = "pout"

/datum/emote/slime/mood/sad
	key = "moodsad"
	mood_key = "sad"

/datum/emote/slime/mood/angry
	key = "moodangry"
	mood_key = "angry"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
