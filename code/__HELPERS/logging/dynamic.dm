<<<<<<< HEAD
=======
/// Log to dynamic and message admins
/datum/game_mode/dynamic/proc/log_dynamic_and_announce(text)
	message_admins("DYNAMIC: [text]")
	log_dynamic("[text]")

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/// Logging for dynamic procs
/proc/log_dynamic(text)
	WRITE_LOG(GLOB.dynamic_log, "DYNAMIC: [text]")
