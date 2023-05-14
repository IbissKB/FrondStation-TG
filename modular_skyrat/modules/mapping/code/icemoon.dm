/*----- Template for ruins, prevents needing to re-type the filepath prefix -----*/
/datum/map_template/ruin/icemoon/underground/skyrat/
	prefix = "_maps/RandomRuins/IceRuins/skyrat/"
/*------*/

/datum/map_template/ruin/icemoon/underground/skyrat/syndicate_base
	name = "Syndicate Ice Base"
	id = "ice-base"
	description = "A secret base researching illegal bioweapons, it is closely guarded by an elite team of syndicate agents."
	suffix = "icemoon_underground_syndicate_base1_skyrat.dmm"
	allow_duplicates = FALSE
<<<<<<< HEAD
	never_spawn_with = list(/datum/map_template/ruin/lavaland/skyrat/syndicate_base, /datum/map_template/ruin/rockplanet/syndicate_base)
=======
	never_spawn_with = list(/datum/map_template/ruin/lavaland/skyrat/syndicate_base)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	always_place = TRUE

/datum/map_template/ruin/icemoon/underground/skyrat/mining_site_below
	name = "Mining Site Underground"
	id = "miningsite-underground"
	description = "The Iceminer arena."
	suffix = "icemoon_underground_mining_site_skyrat.dmm"
	always_place = TRUE

<<<<<<< HEAD
/datum/map_template/ruin/icemoon/underground/skyrat/ashwalker_nest
	name = "Ice Walker Nest"
	id = "ash-walker-ice"
	description = "A forboding dark stoned castle, it has seen better days but at least the current occupants patched the walls."
	prefix = "_maps/RandomRuins/IceRuins/skyrat/"
	suffix = "icemoon_underground_ash_walker1_skyrat.dmm"
=======
/datum/map_template/ruin/icemoon/underground/skyrat/icewalker_camp
	name = "Ice Walker Camp"
	id = "primitive_catgirl_den"
	description = "A small, at times abandoned looking camp. Make no mistake however, as the inhabitants are usually just hibernating in a hole nearby"
	prefix = "_maps/RandomRuins/IceRuins/skyrat/"
	suffix = "icemoon_underground_icewalker_den.dmm"
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	always_place = TRUE
	allow_duplicates = FALSE
