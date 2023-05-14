// This is for all the berets that /tg/ didn't want. You're welcome, they should look better.

<<<<<<< HEAD
/obj/item/clothing/head/hos/beret
=======
/obj/item/clothing/head/hats/hos/beret
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "head of security beret"
	desc = "A robust beret for the Head of Security, for looking stylish while not sacrificing protection."
	icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_colors = "#3F3C40#FFCE5B"

<<<<<<< HEAD
/obj/item/clothing/head/hos/beret/syndicate
=======
/obj/item/clothing/head/hats/hos/beret/syndicate
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	name = "syndicate beret"
	desc = "A black beret with thick armor padding inside. Stylish and robust."
	greyscale_colors = "#3F3C40#DB2929"

/obj/item/clothing/head/beret/sec/navywarden
	name = "warden's beret"
	desc = "A special beret with the Warden's insignia emblazoned on it. For wardens with class."
	icon_state = "beret_badge_fancy_twist"
	greyscale_config = /datum/greyscale_config/beret_badge_fancy
	greyscale_config_worn = /datum/greyscale_config/beret_badge_fancy/worn
	greyscale_colors = "#3C485A#FF0000#00AEEF"
<<<<<<< HEAD
	armor = list(MELEE = 40, BULLET = 30, LASER = 30, ENERGY = 40, BOMB = 25, BIO = 0, FIRE = 30, ACID = 50, WOUND = 6)
	strip_delay = 60

=======
	armor_type = /datum/armor/sec_navywarden
	strip_delay = 60

/datum/armor/sec_navywarden
	melee = 40
	bullet = 30
	laser = 30
	energy = 40
	bomb = 25
	fire = 30
	acid = 50
	wound = 6

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/head/beret/sec/navyofficer
	desc = "A special beret with the security insignia emblazoned on it. For officers with class."
	icon_state = "beret_badge_bolt"
	greyscale_colors = "#3C485A#FF0000"


//Medical

/obj/item/clothing/head/beret/medical
	name = "medical beret"
	desc = "A medical-flavored beret for the doctor in you!"
	icon_state = "beret_badge_med"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#5A96BB"
=======
	greyscale_colors = "#FFFFFF#5FA4CC"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	flags_1 = NONE

/obj/item/clothing/head/beret/medical/paramedic
	name = "paramedic beret"
	desc = "For finding corpses in style!"
<<<<<<< HEAD
	greyscale_colors = "#16313D#5893B5"
=======
	greyscale_colors = "#364660#5FA4CC"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/medical/chemist
	name = "chemist beret"
	desc = "Not acid-proof!"
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#FF3300"
=======
	greyscale_colors = "#FFFFFF#D15B1B"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/medical/virologist
	name = "virologist beret"
	desc = "Sneezing in this expensive beret would be a waste of a good beret."
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#006600"
=======
	greyscale_colors = "#FFFFFF#198019"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7


//Engineering

/obj/item/clothing/head/beret/engi
	name = "engineering beret"
	desc = "Might not protect you from radiation, but definitely will protect you from looking unfashionable!"
	icon_state = "beret_badge_engi"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
<<<<<<< HEAD
	greyscale_colors = "#FFBC30#EFEFEF"
=======
	greyscale_colors = "#ff8200#ffe12f"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	flags_1 = NONE

/obj/item/clothing/head/beret/atmos
	name = "atmospheric beret"
	desc = "While \"pipes\" and \"style\" might not rhyme, this beret sure makes you feel like they should!"
	icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
<<<<<<< HEAD
	greyscale_colors = "#FFDE15#00A5FF"
	flags_1 = NONE


=======
	greyscale_colors = "#59D7FF#ffe12f"
	flags_1 = NONE

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
// From this point forth will be berets that are made especially for Skyrat. Those are loosely based off of the ones that were ported initially, but they might not be 1:1

/obj/item/clothing/head/beret/engi/ce
	name = "chief engineer's beret"
	desc = "A fancy beret designed exactly to the Chief Engineer's tastes, minus the LEDs."
<<<<<<< HEAD
	greyscale_colors = "#575603#00B9D4"

/obj/item/clothing/head/beret/engi/ce/alt
	name = "chief engineer's beret"
	desc = "A fancy beret designed exactly to the Chief Engineer's tastes, minus the LEDs. This one is made out of white fabric. Fancy."
	greyscale_colors = "#FFFFFF#00FF00"
=======
	greyscale_colors = "#FFFFFF#2E992E"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/medical/cmo
	name = "chief medical officer's beret"
	desc = "A beret custom-fit to the Chief Medical Officer, repaired once or twice after Runtime got a hold of it."
<<<<<<< HEAD
	greyscale_colors = "#3299CC#34CCEE"
=======
	greyscale_colors = "#5EB8B8#5FA4CC"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/medical/cmo/alt
	name = "chief medical officer's beret"
	desc = "A beret custom-fit to the Chief Medical Officer, repaired once or twice after Runtime got a hold of it. This one is made out of white fabric. Fancy."
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#34CCEE"
=======
	greyscale_colors = "#FFFFFF#199393"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/science/fancy
	desc = "A science-themed beret for our hardworking scientists. This one comes with a fancy badge!"
	icon_state = "beret_badge"
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	greyscale_config_worn_teshari = /datum/greyscale_config/beret_badge/worn/teshari
<<<<<<< HEAD
	greyscale_colors = "#8D008F#FFFFFF"
=======
	greyscale_colors = "#7E1980#FFFFFF"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/science/fancy/robo
	name = "robotics beret"
	desc = "A sleek black beret designed with high-durability nano-mesh fiber - or so the roboticists claim."
<<<<<<< HEAD
	greyscale_colors = "#4F4F4F#730000"
=======
	greyscale_colors = "#3E3E48#88242D"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/science/rd/alt
	name = "research director's beret"
	desc = "A custom-tailored beret for the Research Director. Lamarr thinks it looks great. This one is made out of white fabric. Fancy."
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#8D008F"
=======
	greyscale_colors = "#FFFFFF#7E1980"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/cargo/qm
	name = "quartermaster's beret"
	desc = "A beret that helps the QM keep telling themselves that they're an official head of staff."
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	icon_state = "beret_badge"
<<<<<<< HEAD
	greyscale_colors = "#714711#EBF755"
=======
	greyscale_colors = "#cf932f#FFCE5B"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/beret/cargo/qm/alt
	name = "quartermaster's beret"
	desc = "A beret that helps the QM keep telling themselves that they're an official head of staff. This one is made out of white fabric. Fancy"
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#EBF755"
=======
	greyscale_colors = "#FFFFFF#FFCE5B"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/caphat/beret/alt
	name = "captain's beret"
	desc = "For the Captains known for their sense of fashion. This one is made out of white fabric. Fancy"
	greyscale_colors = "#FFFFFF#FFCE5B"

/obj/item/clothing/head/hopcap/beret
	name = "head of personnel's beret"
	desc = "A fancy beret designed by NT's Personnel division for their favorite head's head."
	greyscale_config = /datum/greyscale_config/beret_badge
	greyscale_config_worn = /datum/greyscale_config/beret_badge/worn
	icon_state = "beret_badge"
<<<<<<< HEAD
	greyscale_colors = "#006086#D60000"
=======
	greyscale_colors = "#3e5c88#88242D"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/head/hopcap/beret/alt
	name = "head of personnel's beret"
	desc = "A fancy beret designed by NT's Personnel division for their favorite head's head. This one is made out of white fabric. Fancy"
<<<<<<< HEAD
	greyscale_colors = "#FFFFFF#D60000"
=======
	greyscale_colors = "#FFFFFF#88242D"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
