/obj/item/clothing/under/plasmaman/security
	name = "security plasma envirosuit"
	desc = "A plasmaman containment suit designed for security officers, offering a limited amount of extra protection."
	icon_state = "security_envirosuit"
	inhand_icon_state = null
<<<<<<< HEAD
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 100, FIRE = 95, ACID = 95)
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

=======
	armor_type = /datum/armor/plasmaman_security
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE

/datum/armor/plasmaman_security
	melee = 10
	bio = 100
	fire = 95
	acid = 95

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/under/plasmaman/security/warden
	name = "warden plasma envirosuit"
	desc = "A plasmaman containment suit designed for the warden, white stripes being added to differentiate them from other members of security."
	icon_state = "warden_envirosuit"
	inhand_icon_state = null
