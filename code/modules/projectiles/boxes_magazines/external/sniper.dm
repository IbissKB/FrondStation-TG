/obj/item/ammo_box/magazine/sniper_rounds
<<<<<<< HEAD
	name = "sniper rounds (.50)"
=======
	name = "anti-materiel sniper rounds (.50 BMG)"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	icon_state = ".50mag"
	base_icon_state = ".50mag"
	ammo_type = /obj/item/ammo_casing/p50
	max_ammo = 6
	caliber = CALIBER_50

/obj/item/ammo_box/magazine/sniper_rounds/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][ammo_count() ? "-ammo" : ""]"

<<<<<<< HEAD
/obj/item/ammo_box/magazine/sniper_rounds/soporific
	name = "sniper rounds (Zzzzz)"
	desc = "Soporific sniper rounds, designed for happy days and dead quiet nights..."
	icon_state = "soporific"
	ammo_type = /obj/item/ammo_casing/p50/soporific
	max_ammo = 3
	caliber = CALIBER_50

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "sniper rounds (penetrator)"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	ammo_type = /obj/item/ammo_casing/p50/penetrator
	max_ammo = 5

/obj/item/ammo_box/magazine/sniper_rounds/marksman
	name = "sniper rounds (marksman)"
	desc = "An extremely fast sniper round able to pretty much instantly shoot through something."
	ammo_type = /obj/item/ammo_casing/p50/marksman
	max_ammo = 5
=======
/obj/item/ammo_box/magazine/sniper_rounds/surplus
	name = "anti-materiel sniper rounds (.50 BMG Surplus)"
	icon_state = "surplus"
	base_icon_state = "surplus"
	ammo_type = /obj/item/ammo_casing/p50/surplus

/obj/item/ammo_box/magazine/sniper_rounds/disruptor
	name = "anti-materiel sniper rounds (.50 BMG Bzzt)"
	desc = "Disruptor sniper rounds. A special blend of soporific chemicals \
		and a electromagnetic payload to cause anything to come to a grinding halt."
	base_icon_state = "disruptor"
	ammo_type = /obj/item/ammo_casing/p50/disruptor

/obj/item/ammo_box/magazine/sniper_rounds/incendiary
	name = "anti-materiel sniper rounds (.50 BMG incendiary)"
	desc = "Incediary sniper rounds. Causes a massive combustion at the site of impact."
	base_icon_state = "incendiary"
	ammo_type = /obj/item/ammo_casing/p50/incendiary

/obj/item/ammo_box/magazine/sniper_rounds/penetrator
	name = "anti-materiel sniper rounds (.50 BMG penetrator)"
	desc = "An extremely powerful round capable of passing straight through cover and anyone unfortunate enough to be behind it."
	base_icon_state = "penetrator"
	ammo_type = /obj/item/ammo_casing/p50/penetrator

/obj/item/ammo_box/magazine/sniper_rounds/marksman
	name = "anti-materiel sniper rounds (.50 BMG marksman)"
	desc = "An extremely fast sniper round able to pretty much instantly shoot through something."
	base_icon_state = "marksman"
	ammo_type = /obj/item/ammo_casing/p50/marksman
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
