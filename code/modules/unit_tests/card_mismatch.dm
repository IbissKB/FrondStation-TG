/datum/unit_test/card_mismatch

/datum/unit_test/card_mismatch/Run()
<<<<<<< HEAD
	var/message = SStrading_card_game.checkCardpacks(SStrading_card_game.card_packs)
	message += SStrading_card_game.checkCardDatums()
=======
	var/message = SStrading_card_game.check_cardpacks(SStrading_card_game.card_packs)
	message += SStrading_card_game.check_card_datums()
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	TEST_ASSERT(!message, message)
