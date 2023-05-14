/obj/machinery/rnd/production/circuit_imprinter
	name = "circuit imprinter"
	desc = "Manufactures circuit boards for the construction of machines."
	icon_state = "circuit_imprinter"
	circuit = /obj/item/circuitboard/machine/circuit_imprinter
	production_animation = "circuit_imprinter_ani"
	allowed_buildtypes = IMPRINTER

/obj/machinery/rnd/production/circuit_imprinter/calculate_efficiency()
	. = ..()

	var/rating = 0

<<<<<<< HEAD
	for(var/obj/item/stock_parts/manipulator/manipulator in component_parts)
		rating += manipulator.rating // There is only one.
=======
	for(var/datum/stock_part/servo/servo in component_parts)
		rating += servo.tier // There is only one.
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

	efficiency_coeff = 0.5 ** max(rating - 1, 0) // One sheet, half sheet, quarter sheet, eighth sheet.

/obj/machinery/rnd/production/circuit_imprinter/offstation
	name = "ancient circuit imprinter"
	desc = "Manufactures circuit boards for the construction of machines. Its ancient construction may limit its ability to print all known technology."
	allowed_buildtypes = AWAY_IMPRINTER
	circuit = /obj/item/circuitboard/machine/circuit_imprinter/offstation
	charges_tax = FALSE
