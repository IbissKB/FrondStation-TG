/**
 * # NTNet Receiver Component
 *
 * Receives data through NTNet.
 */
/obj/item/circuit_component/ntnet_receive
	display_name = "NTNet Receiver"
	desc = "Receives data packages through NTNet. If Encryption Key is set then only signals with the same Encryption Key will be received."
	category = "NTNet"

	circuit_flags = CIRCUIT_FLAG_OUTPUT_SIGNAL //trigger_output

	/// The list type
	var/datum/port/input/option/list_options

	/// Data being received
	var/datum/port/output/data_package

	/// Encryption key
	var/datum/port/input/enc_key

<<<<<<< HEAD
/obj/item/circuit_component/ntnet_receive/Initialize(mapload)
	. = ..()
	init_network_id(__NETWORK_CIRCUITS)

=======
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/obj/item/circuit_component/ntnet_receive/populate_options()
	list_options = add_option_port("List Type", GLOB.wiremod_basic_types)

/obj/item/circuit_component/ntnet_receive/populate_ports()
	data_package = add_output_port("Data Package", PORT_TYPE_LIST(PORT_TYPE_ANY))
	enc_key = add_input_port("Encryption Key", PORT_TYPE_STRING)
<<<<<<< HEAD
	RegisterSignal(src, COMSIG_COMPONENT_NTNET_RECEIVE, PROC_REF(ntnet_receive))
=======
	RegisterSignal(SSdcs, COMSIG_GLOB_CIRCUIT_NTNET_DATA_SENT, PROC_REF(ntnet_receive))
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/obj/item/circuit_component/ntnet_receive/pre_input_received(datum/port/input/port)
	if(port == list_options)
		var/new_datatype = list_options.value
		data_package.set_datatype(PORT_TYPE_LIST(new_datatype))


<<<<<<< HEAD
/obj/item/circuit_component/ntnet_receive/proc/ntnet_receive(datum/source, datum/netdata/data)
	SIGNAL_HANDLER

	if(data.data["enc_key"] != enc_key.value)
		return

	var/datum/weakref/ref = data.data["port"]
=======
/obj/item/circuit_component/ntnet_receive/proc/ntnet_receive(obj/item/circuit_component/ntnet_send/source, list/data)
	SIGNAL_HANDLER

	if(!find_functional_ntnet_relay())
		return
	if(data["enc_key"] != enc_key.value)
		return

	var/datum/weakref/ref = data["port"]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	var/datum/port/input/port = ref?.resolve()
	if(!port)
		return

	var/datum/circuit_datatype/datatype_handler = data_package.datatype_handler
	if(!datatype_handler?.can_receive_from_datatype(port.datatype))
		return

<<<<<<< HEAD
	data_package.set_output(data.data["data"])
=======
	data_package.set_output(data["data"])
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	trigger_output.set_output(COMPONENT_SIGNAL)
