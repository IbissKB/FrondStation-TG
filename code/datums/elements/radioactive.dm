#define DELAY_BETWEEN_RADIATION_PULSES (3 SECONDS)

/// This atom will regularly pulse radiation.
/// As this is only applied on uranium objects for now, this defaults to uranium constants.
/datum/element/radioactive
	element_flags = ELEMENT_DETACH_ON_HOST_DESTROY

	var/list/radioactive_objects = list()

/datum/element/radioactive/New()
	START_PROCESSING(SSdcs, src)

/datum/element/radioactive/Attach(datum/target)
	. = ..()

	radioactive_objects[target] = world.time

/datum/element/radioactive/Detach(datum/source, ...)
	radioactive_objects -= source

	return ..()

<<<<<<< HEAD
/datum/element/radioactive/process(delta_time)
=======
/datum/element/radioactive/process(seconds_per_tick)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	for (var/radioactive_object in radioactive_objects)
		if (world.time - radioactive_objects[radioactive_object] < DELAY_BETWEEN_RADIATION_PULSES)
			continue

		radiation_pulse(
			radioactive_object,
			max_range = 3,
			threshold = RAD_LIGHT_INSULATION,
			chance = URANIUM_IRRADIATION_CHANCE,
			minimum_exposure_time = URANIUM_RADIATION_MINIMUM_EXPOSURE_TIME,
		)

		radioactive_objects[radioactive_object] = world.time

#undef DELAY_BETWEEN_RADIATION_PULSES
