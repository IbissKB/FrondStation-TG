/datum/uplink_category/species
	name = "Species Restricted"
	weight = 1

/datum/uplink_item/species_restricted
	category = /datum/uplink_category/species
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
<<<<<<< HEAD
	surplus = 0
=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/datum/uplink_item/species_restricted/moth_lantern
	name = "Extra-Bright Lantern"
	desc = "We heard that moths such as yourself really like lamps, so we decided to grant you early access to a prototype \
	Syndicate brand \"Extra-Bright Lantern™\". Enjoy."
	cost = 2
	item = /obj/item/flashlight/lantern/syndicate
	restricted_species = list(SPECIES_MOTH)
<<<<<<< HEAD
=======
	surplus = 0
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
