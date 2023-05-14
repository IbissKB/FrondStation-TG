<<<<<<< HEAD
/obj/machinery/power/apc/unlocked
	locked = FALSE

/obj/machinery/power/apc/syndicate //general syndicate access
	req_access = list(ACCESS_SYNDICATE)

/obj/machinery/power/apc/away //general away mission access
	req_access = list(ACCESS_AWAY_GENERAL)

/obj/machinery/power/apc/highcap/five_k
	cell_type = /obj/item/stock_parts/cell/upgraded/plus

/obj/machinery/power/apc/highcap/ten_k
	cell_type = /obj/item/stock_parts/cell/high
=======
///Used to change name for apcs on away missions
/obj/machinery/power/apc/worn_out
	name = "Worn out APC"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/machinery/power/apc/auto_name
	auto_name = TRUE

<<<<<<< HEAD
/obj/machinery/power/apc/sm_apc
	auto_name = TRUE
	cell_type = /obj/item/stock_parts/cell/high

MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/auto_name, APC_PIXEL_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/highcap/five_k, APC_PIXEL_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/highcap/ten_k, APC_PIXEL_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/sm_apc, APC_PIXEL_OFFSET)
=======
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/worn_out, APC_PIXEL_OFFSET)
MAPPING_DIRECTIONAL_HELPERS(/obj/machinery/power/apc/auto_name, APC_PIXEL_OFFSET)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
