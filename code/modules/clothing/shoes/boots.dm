/obj/item/clothing/shoes/combat //basic syndicate combat boots for nuke ops and mob corpses
	name = "combat boots"
	desc = "High speed, low drag combat boots."
	icon_state = "jackboots"
	inhand_icon_state = "jackboots"
<<<<<<< HEAD
	armor = list(MELEE = 25, BULLET = 25, LASER = 25, ENERGY = 25, BOMB = 50, BIO = 90, FIRE = 70, ACID = 50)
=======
	armor_type = /datum/armor/shoes_combat
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	strip_delay = 40
	resistance_flags = NONE
	lace_time = 12 SECONDS

<<<<<<< HEAD
/obj/item/clothing/shoes/combat/Initialize(mapload)
	. = ..()

	create_storage(type = /datum/storage/pockets/shoes)
=======
/datum/armor/shoes_combat
	melee = 25
	bullet = 25
	laser = 25
	energy = 25
	bomb = 50
	bio = 90
	fire = 70
	acid = 50

/obj/item/clothing/shoes/combat/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/shoes)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/combat/swat //overpowered boots for death squads
	name = "\improper SWAT boots"
	desc = "High speed, no drag combat boots."
<<<<<<< HEAD
	clothing_flags = NOSLIP
	armor = list(MELEE = 40, BULLET = 30, LASER = 25, ENERGY = 25, BOMB = 50, BIO = 100, FIRE = 90, ACID = 50)
=======
	clothing_traits = list(TRAIT_NO_SLIP_WATER)
	armor_type = /datum/armor/combat_swat

/datum/armor/combat_swat
	melee = 40
	bullet = 30
	laser = 25
	energy = 25
	bomb = 50
	bio = 100
	fire = 90
	acid = 50
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/jackboots
	name = "jackboots"
	desc = "Nanotrasen-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "jackboots"
	inhand_icon_state = "jackboots"
	strip_delay = 30
	equip_delay_other = 50
	resistance_flags = NONE
<<<<<<< HEAD
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 90, FIRE = 0, ACID = 0)
	can_be_tied = FALSE

/obj/item/clothing/shoes/jackboots/Initialize(mapload)
	. = ..()

	create_storage(type = /datum/storage/pockets/shoes)
=======
	armor_type = /datum/armor/shoes_jackboots
	can_be_tied = FALSE

/datum/armor/shoes_jackboots
	bio = 90

/obj/item/clothing/shoes/jackboots/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/shoes)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/jackboots/fast
	slowdown = -1

/obj/item/clothing/shoes/jackboots/sec
	icon_state = "jackboots_sec"

/obj/item/clothing/shoes/winterboots
	name = "winter boots"
	desc = "Boots lined with 'synthetic' animal fur."
	icon_state = "winterboots"
	inhand_icon_state = null
<<<<<<< HEAD
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 80, FIRE = 0, ACID = 0)
=======
	armor_type = /datum/armor/shoes_winterboots
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	cold_protection = FEET|LEGS
	min_cold_protection_temperature = SHOES_MIN_TEMP_PROTECT
	heat_protection = FEET|LEGS
	max_heat_protection_temperature = SHOES_MAX_TEMP_PROTECT
	lace_time = 8 SECONDS

<<<<<<< HEAD
/obj/item/clothing/shoes/winterboots/Initialize(mapload)
	. = ..()

	create_storage(type = /datum/storage/pockets/shoes)
=======
/datum/armor/shoes_winterboots
	bio = 80

/obj/item/clothing/shoes/winterboots/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/shoes)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/winterboots/ice_boots
	name = "ice hiking boots"
	desc = "A pair of winter boots with special grips on the bottom, designed to prevent slipping on frozen surfaces."
	icon_state = "iceboots"
	inhand_icon_state = null
<<<<<<< HEAD
	clothing_flags = NOSLIP_ICE
=======
	clothing_traits = list(TRAIT_NO_SLIP_ICE, TRAIT_NO_SLIP_SLIDE)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

// A pair of ice boots intended for general crew EVA use - see EVA winter coat for comparison.
/obj/item/clothing/shoes/winterboots/ice_boots/eva
	name = "\proper Endotherm hiking boots"
	desc = "A heavy pair of boots with grips applied to the bottom to keep the wearer vertical while walking in freezing conditions."
	icon_state = "iceboots_eva"
	w_class = WEIGHT_CLASS_BULKY
	slowdown = 0.25
<<<<<<< HEAD
	armor = list(MELEE = 10, BULLET = 0, LASER = 10, ENERGY = 10, BOMB = 0, BIO = 50, FIRE = 50, ACID = 10)
	strip_delay = 4 SECONDS
	equip_delay_other = 4 SECONDS
	clothing_flags = NOSLIP_ICE|THICKMATERIAL
	resistance_flags = NONE

=======
	armor_type = /datum/armor/ice_boots_eva
	strip_delay = 4 SECONDS
	equip_delay_other = 4 SECONDS
	clothing_flags = THICKMATERIAL
	resistance_flags = NONE

/datum/armor/ice_boots_eva
	melee = 10
	laser = 10
	energy = 10
	bio = 50
	fire = 50
	acid = 10

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/clothing/shoes/workboots
	name = "work boots"
	desc = "Nanotrasen-issue Engineering lace-up work boots for the especially blue-collar."
	icon_state = "workboots"
	inhand_icon_state = "jackboots"
<<<<<<< HEAD
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 80, FIRE = 0, ACID = 0)
	strip_delay = 20
	equip_delay_other = 40
	lace_time = 8 SECONDS
	species_exception = list(/datum/species/golem/uranium)
=======
	armor_type = /datum/armor/shoes_workboots
	strip_delay = 20
	equip_delay_other = 40
	lace_time = 8 SECONDS

/datum/armor/shoes_workboots
	bio = 80
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/workboots/Initialize(mapload)
	. = ..()

<<<<<<< HEAD
	create_storage(type = /datum/storage/pockets/shoes)
=======
	create_storage(storage_type = /datum/storage/pockets/shoes)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/workboots/mining
	name = "mining boots"
	desc = "Steel-toed mining boots for mining in hazardous environments. Very good at keeping toes uncrushed."
	icon_state = "explorer"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/shoes/russian
	name = "russian boots"
	desc = "Comfy shoes."
	icon_state = "rus_shoes"
	inhand_icon_state = null
	lace_time = 8 SECONDS

/obj/item/clothing/shoes/russian/Initialize(mapload)
	. = ..()

<<<<<<< HEAD
	create_storage(type = /datum/storage/pockets/shoes)
=======
	create_storage(storage_type = /datum/storage/pockets/shoes)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/clothing/shoes/discoshoes
	name = "green lizardskin shoes"
	desc = "They may have lost some of their lustre over the years, but these green lizardskin shoes fit you perfectly."
	icon_state = "lizardskin_shoes"
	inhand_icon_state = null

/obj/item/clothing/shoes/kim
	name = "aerostatic boots"
	desc = "A crisp, clean set of boots for working long hours on the beat."
	icon_state = "aerostatic_boots"
	inhand_icon_state = null
