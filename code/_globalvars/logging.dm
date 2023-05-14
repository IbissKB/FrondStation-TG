GLOBAL_LIST_EMPTY(active_turfs_startlist)

<<<<<<< HEAD
GLOBAL_LIST_EMPTY(admin_log)
GLOBAL_PROTECT(admin_log)

GLOBAL_LIST_EMPTY(adminlog)
GLOBAL_PROTECT(adminlog)

GLOBAL_LIST_EMPTY(bombers)
GLOBAL_PROTECT(bombers)

GLOBAL_LIST_EMPTY(combatlog)
GLOBAL_PROTECT(combatlog)

GLOBAL_VAR(config_error_log)
GLOBAL_PROTECT(config_error_log)

GLOBAL_VAR(demo_log)
GLOBAL_PROTECT(demo_log)

GLOBAL_VAR(dynamic_log)
GLOBAL_PROTECT(dynamic_log)

GLOBAL_VAR(filter_log)
GLOBAL_PROTECT(filter_log)

#ifdef REFERENCE_DOING_IT_LIVE
GLOBAL_LIST_EMPTY(harddel_log)
GLOBAL_PROTECT(harddel_log)
#endif

GLOBAL_LIST_EMPTY(IClog)
GLOBAL_PROTECT(IClog)

/// Keeps last 100 signals here in format: "[src] used [REF(src)] @ location [src.loc]: [freq]/[code]"
GLOBAL_LIST_EMPTY(lastsignalers)
GLOBAL_PROTECT(lastsignalers)

/// Stores who uploaded laws to which silicon-based lifeform, and what the law was
GLOBAL_LIST_EMPTY(lawchanges)
GLOBAL_PROTECT(lawchanges)
GLOBAL_VAR(log_directory)
GLOBAL_PROTECT(log_directory)

GLOBAL_VAR(lua_log)
GLOBAL_PROTECT(lua_log)

GLOBAL_LIST_EMPTY(OOClog)
GLOBAL_PROTECT(OOClog)

GLOBAL_VAR(perf_log)
GLOBAL_PROTECT(perf_log)
=======
GLOBAL_VAR(round_id)
GLOBAL_PROTECT(round_id)

/// The directory in which ALL log files should be stored
GLOBAL_VAR(log_directory)
GLOBAL_PROTECT(log_directory)

#define DECLARE_LOG_NAMED(log_var_name, log_file_name, start)\
GLOBAL_VAR(##log_var_name);\
GLOBAL_PROTECT(##log_var_name);\
/world/_initialize_log_files(temp_log_override = null){\
	..();\
	GLOB.##log_var_name = temp_log_override || "[GLOB.log_directory]/[##log_file_name].log";\
	if(!temp_log_override && ##start){\
		start_log(GLOB.##log_var_name);\
	}\
}

#define DECLARE_LOG(log_name, start) DECLARE_LOG_NAMED(##log_name, "[copytext(#log_name, 1, length(#log_name) - 3)]", start)
#define START_LOG TRUE
#define DONT_START_LOG FALSE

/// Populated by log declaration macros to set log file names and start messages
/world/proc/_initialize_log_files(temp_log_override = null)
	// Needs to be here to avoid compiler warnings
	SHOULD_CALL_PARENT(TRUE)
	return

// All individual log files
DECLARE_LOG(config_error_log, DONT_START_LOG)
DECLARE_LOG(dynamic_log, DONT_START_LOG)
DECLARE_LOG(lua_log, DONT_START_LOG)
DECLARE_LOG(perf_log, DONT_START_LOG) // Declared here but name is set in time_track subsystem
DECLARE_LOG(query_debug_log, DONT_START_LOG)
DECLARE_LOG(signals_log, DONT_START_LOG)
DECLARE_LOG(tgui_log, START_LOG)
#ifdef REFERENCE_DOING_IT_LIVE
DECLARE_LOG_NAMED(harddel_log, "harddels", START_LOG)
#endif
#if defined(UNIT_TESTS) || defined(SPACEMAN_DMM)
DECLARE_LOG_NAMED(test_log, "tests", START_LOG)
#endif
DECLARE_LOG_NAMED(filter_log, "filters", DONT_START_LOG)
DECLARE_LOG_NAMED(sql_error_log, "sql", DONT_START_LOG)
DECLARE_LOG_NAMED(world_asset_log, "asset", DONT_START_LOG)
DECLARE_LOG_NAMED(world_attack_log, "attack", START_LOG)
DECLARE_LOG_NAMED(world_econ_log, "econ", START_LOG)
DECLARE_LOG_NAMED(world_game_log, "game", START_LOG)
DECLARE_LOG_NAMED(world_href_log, "hrefs", START_LOG)
DECLARE_LOG_NAMED(world_job_debug_log, "job_debug", START_LOG)
DECLARE_LOG_NAMED(world_manifest_log, "manifest", START_LOG)
DECLARE_LOG_NAMED(world_map_error_log, "map_errors", DONT_START_LOG)
DECLARE_LOG_NAMED(world_mecha_log, "mecha", DONT_START_LOG)
DECLARE_LOG_NAMED(world_mob_tag_log, "mob_tags", START_LOG)
DECLARE_LOG_NAMED(world_paper_log, "paper", DONT_START_LOG)
DECLARE_LOG_NAMED(world_pda_log, "pda", START_LOG)
DECLARE_LOG_NAMED(world_qdel_log, "qdel", START_LOG)
DECLARE_LOG_NAMED(world_runtime_log, "runtime", START_LOG)
DECLARE_LOG_NAMED(world_shuttle_log, "shuttle", START_LOG)
DECLARE_LOG_NAMED(world_silicon_log, "silicon", DONT_START_LOG)
DECLARE_LOG_NAMED(world_speech_indicators_log, "speech_indicators", DONT_START_LOG)
DECLARE_LOG_NAMED(world_telecomms_log, "telecomms", START_LOG)
DECLARE_LOG_NAMED(world_tool_log, "tools", DONT_START_LOG)
DECLARE_LOG_NAMED(world_uplink_log, "uplink", START_LOG)
DECLARE_LOG_NAMED(world_virus_log, "virus", DONT_START_LOG)
/// Log associated with [/proc/log_suspicious_login()]
/// Intended to hold all logins that failed due to suspicious circumstances such as ban detection, CID randomisation etc.
DECLARE_LOG_NAMED(world_suspicious_login_log, "suspicious_logins", DONT_START_LOG)

// SKYRAT EDIT ADDITION
DECLARE_LOG_NAMED(event_vote_log, "event_vote", START_LOG)
DECLARE_LOG_NAMED(character_creation_log, "character_creation", START_LOG)
// SKYRAT EDIT END
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7

/// Picture logging
GLOBAL_VAR(picture_log_directory)
GLOBAL_PROTECT(picture_log_directory)

GLOBAL_VAR_INIT(picture_logging_id, 1)
GLOBAL_PROTECT(picture_logging_id)

GLOBAL_VAR(picture_logging_prefix)
GLOBAL_PROTECT(picture_logging_prefix)

<<<<<<< HEAD
GLOBAL_VAR(query_debug_log)
GLOBAL_PROTECT(query_debug_log)

GLOBAL_VAR(round_id)
GLOBAL_PROTECT(round_id)

GLOBAL_VAR(signals_log)
GLOBAL_PROTECT(signals_log)

GLOBAL_VAR(sql_error_log)
GLOBAL_PROTECT(sql_error_log)

GLOBAL_VAR(tgui_log)
GLOBAL_PROTECT(tgui_log)

GLOBAL_VAR(world_asset_log)
GLOBAL_PROTECT(world_asset_log)

GLOBAL_VAR(world_attack_log)
GLOBAL_PROTECT(world_attack_log)

GLOBAL_VAR(world_cloning_log)
GLOBAL_PROTECT(world_cloning_log)

GLOBAL_VAR(world_econ_log)
GLOBAL_PROTECT(world_econ_log)

GLOBAL_VAR(world_game_log)
GLOBAL_PROTECT(world_game_log)

GLOBAL_VAR(world_href_log)
GLOBAL_PROTECT(world_href_log)

GLOBAL_VAR(world_job_debug_log)
GLOBAL_PROTECT(world_job_debug_log)

GLOBAL_VAR(world_manifest_log)
GLOBAL_PROTECT(world_manifest_log)

GLOBAL_VAR(world_map_error_log)
GLOBAL_PROTECT(world_map_error_log)

GLOBAL_VAR(world_mecha_log)
GLOBAL_PROTECT(world_mecha_log)

GLOBAL_VAR(world_mob_tag_log)
GLOBAL_PROTECT(world_mob_tag_log)

GLOBAL_VAR(world_paper_log)
GLOBAL_PROTECT(world_paper_log)

GLOBAL_VAR(world_pda_log)
GLOBAL_PROTECT(world_pda_log)

GLOBAL_VAR(world_qdel_log)
GLOBAL_PROTECT(world_qdel_log)

GLOBAL_VAR(world_runtime_log)
GLOBAL_PROTECT(world_runtime_log)

GLOBAL_VAR(world_shuttle_log)
GLOBAL_PROTECT(world_shuttle_log)

GLOBAL_VAR(world_silicon_log)
GLOBAL_PROTECT(world_silicon_log)

GLOBAL_VAR(world_speech_indicators_log)
GLOBAL_PROTECT(world_speech_indicators_log)

/// Log associated with [/proc/log_suspicious_login()]
/// Intended to hold all logins that failed due to suspicious circumstances such as ban detection, CID randomisation etc.
GLOBAL_VAR(world_suspicious_login_log)
GLOBAL_PROTECT(world_suspicious_login_log)

GLOBAL_VAR(world_telecomms_log)
GLOBAL_PROTECT(world_telecomms_log)

GLOBAL_VAR(world_tool_log)
GLOBAL_PROTECT(world_tool_log)

GLOBAL_VAR(world_uplink_log)
GLOBAL_PROTECT(world_uplink_log)

GLOBAL_VAR(world_virus_log)
GLOBAL_PROTECT(world_virus_log)

=======
/// All admin related log lines minus their categories
GLOBAL_LIST_EMPTY(admin_activities)
GLOBAL_PROTECT(admin_activities)

/// All bomb related messages
GLOBAL_LIST_EMPTY(bombers)
GLOBAL_PROTECT(bombers)

/// All signals here in format: "[src] used [REF(src)] @ location [src.loc]: [freq]/[code]"
GLOBAL_LIST_EMPTY(lastsignalers)
GLOBAL_PROTECT(lastsignalers)

/// Stores who uploaded laws to which silicon-based lifeform, and what the law was
GLOBAL_LIST_EMPTY(lawchanges)
GLOBAL_PROTECT(lawchanges)

#undef DECLARE_LOG
#undef DECLARE_LOG_NAMED
#undef START_LOG
#undef DONT_START_LOG
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
