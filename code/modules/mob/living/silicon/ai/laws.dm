
/mob/living/silicon/ai/proc/show_laws_verb()
	set category = "AI Commands"
	set name = "Show Laws"
<<<<<<< HEAD
=======
	set desc = "Check what your laws are privately. \
		Also ensures all synced cyborgs are up to date with your laws, reminds them of your laws."
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	if(usr.stat == DEAD)
		return //won't work if dead
	src.show_laws()

<<<<<<< HEAD
/mob/living/silicon/ai/show_laws(everyone = 0)
	var/who

	if (everyone)
		who = world
	else
		who = src
	to_chat(who, "<b>Obey these laws:</b>")

	src.laws_sanity_check()
	src.laws.show_laws(who)
	if(!everyone)
		for(var/mob/living/silicon/robot/R in connected_robots)
			if(R.lawupdate)
				R.lawsync()
				R.show_laws()
				R.law_change_counter++

=======
/mob/living/silicon/ai/show_laws()
	. = ..()
	try_sync_laws() // Yes we lawsync borgs EVERY TIME WE CHECK LAWS

/mob/living/silicon/ai/try_sync_laws()
	for(var/mob/living/silicon/robot/borgo in connected_robots)
		if(borgo.try_sync_laws())
			to_chat(borgo, span_bold("Your AI has reminded you of your laws:"))
			borgo.show_laws()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
