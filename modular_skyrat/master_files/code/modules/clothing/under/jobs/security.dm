/obj/item/clothing/under/rank/security
	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/clothing/under/security_digi.dmi' // Anything that was in the security.dmi, should be in the security_digi.dmi

/obj/item/clothing/under/rank/security/skyrat
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'

/obj/item/clothing/under/rank/security/head_of_security/skyrat
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'

//DEBATE MOVING *ALL* SECURITY STUFF HERE? Even overrides, at least as a like, sub-file?

/*
*	SECURITY OFFICER
*/

/obj/item/clothing/under/rank/security/skyrat/utility
	name = "security utility uniform"
	desc = "A utility uniform worn by Lopland-certified Security officers."
	icon_state = "util_sec"
<<<<<<< HEAD
=======
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION | CLOTHING_MONKEY_VARIATION
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/skyrat/utility/redsec
	desc = "A utility uniform worn by trained Security officers."
	icon_state = "util_sec_old"
<<<<<<< HEAD
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/skyrat/utility/redsec/syndicate //MOVE ALL /SYNDICATES TO THE SYNDICATE.DM WHEN THE .dmi IS MADE (soon, after centcom.dmi)
	armor = list(MELEE = 10, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, FIRE = 50, ACID = 40) //Same stats as the tactical turtleneck.
	has_sensor = NO_SENSORS

=======
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/skyrat/utility/redsec/syndicate
	armor_type = /datum/armor/redsec_syndicate
	has_sensor = NO_SENSORS

/obj/item/clothing/under/rank/security/peacekeeper/trousers
	name = "security trousers"
	desc = "Some Peacekeeper-blue combat trousers. Probably should pair it with a vest for safety."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "workpants_blue"
	body_parts_covered = GROIN|LEGS
	can_adjust = FALSE
	female_sprite_flags = FEMALE_UNIFORM_NO_BREASTS

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/*
*	HEAD OF SECURITY
*/

<<<<<<< HEAD
=======
/datum/armor/redsec_syndicate
	melee = 10
	fire = 50
	acid = 40

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/under/rank/security/head_of_security/skyrat/imperial //Rank pins of the Grand General
	desc = "A tar black naval suit and a rank badge denoting the Officer of The Internal Security Division. Be careful your underlings don't bump their head on a door."
	name = "head of security's naval jumpsuit"
	icon_state = "imphos"
<<<<<<< HEAD
=======

/*
*	PRISONER
*/

/obj/item/clothing/under/rank/prisoner
	greyscale_config_worn_monkey = /datum/greyscale_config/jumpsuit_prison_worn/monkey
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
