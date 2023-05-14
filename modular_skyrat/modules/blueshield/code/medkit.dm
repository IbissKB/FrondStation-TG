/obj/item/storage/medkit/tactical/blueshield
	name = "blueshield combat medical kit"
	desc = "Blue boy to the rescue!"
<<<<<<< HEAD
=======
	color = "#AAAAFF"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/storage/medkit/tactical/blueshield/PopulateContents()
	if(empty)
		return
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/healthanalyzer(src)
<<<<<<< HEAD
	new /obj/item/pinpointer/crew(src)
=======
	new /obj/item/sensor_device/blueshield(src)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
