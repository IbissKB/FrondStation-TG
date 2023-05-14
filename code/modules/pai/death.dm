/mob/living/silicon/pai/death(gibbed)
	if(stat == DEAD)
		return
	set_stat(DEAD)
	update_sight()
	clear_fullscreens()
	/**
	* New pAI's get a brand new mind to prevent meta stuff from their previous
	* life. This new mind causes problems down the line if it's not deleted here.
	*/
	ghostize()
<<<<<<< HEAD
=======

	if (!QDELETED(card) && loc != card)
		card.forceMove(drop_location())
		card.pai = null
		card.emotion_icon = initial(card.emotion_icon)
		card.update_appearance()

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	qdel(src)
