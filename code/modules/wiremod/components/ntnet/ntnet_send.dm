/**
 * # NTNet Transmitter Component
 *
 * Sends a data package through NTNet
 */

/obj/item/circuit_component/ntnet_send
	display_name = "NTNet Transmitter"
	desc = "Sends a data package through NTNet. If Encryption Key is set then transmitted data will be only picked up by receivers with the same Encryption Key."
	category = "NTNet"

	circuit_flags = CIRCUIT_FLAG_INPUT_SIGNAL

	/// The list type
	var/datum/port/input/option/list_options

	/// Data being sent
	var/datum/port/input/data_package

	/// Encryption key
	var/datum/port/input/enc_key

<<<<<<< HEAD
/obj/item/circuit_component/ntnet_send/Initialize(mapload)
	. = ..()
	init_network_id(__NETWORK_CIRCUITS)

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/circuit_component/ntnet_send/populate_options()
	list_options = add_option_port("List Type", GLOB.wiremod_basic_types)

/obj/item/circuit_component/ntnet_send/populate_ports()
	data_package = add_input_port("Data Package", PORT_TYPE_LIST(PORT_TYPE_ANY))
	enc_key = add_input_port("Encryption Key", PORT_TYPE_STRING)

/obj/item/circuit_component/ntnet_send/pre_input_received(datum/port/input/port)
	if(port == list_options)
		var/new_datatype = list_options.value
		data_package.set_datatype(PORT_TYPE_LIST(new_datatype))

/obj/item/circuit_component/ntnet_send/input_received(datum/port/input/port)
<<<<<<< HEAD
	ntnet_send(list("data" = data_package.value, "enc_key" = enc_key.value, "port" = WEAKREF(data_package)))
=======
	if(!find_functional_ntnet_relay())
		return
	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_CIRCUIT_NTNET_DATA_SENT, list("data" = data_package.value, "enc_key" = enc_key.value, "port" = WEAKREF(data_package)))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
