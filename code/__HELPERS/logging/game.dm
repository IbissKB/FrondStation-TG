/// Logging for generic/unsorted game messages
/proc/log_game(text)
	if (CONFIG_GET(flag/log_game))
		WRITE_LOG(GLOB.world_game_log, "GAME: [text]")

/// Logging for emotes
/proc/log_emote(text)
	if (CONFIG_GET(flag/log_emote))
		WRITE_LOG(GLOB.world_game_log, "EMOTE: [text]")

/// Logging for emotes sent over the radio
/proc/log_radio_emote(text)
	if (CONFIG_GET(flag/log_emote))
		WRITE_LOG(GLOB.world_game_log, "RADIOEMOTE: [text]")

/// Logging for messages sent in OOC
/proc/log_ooc(text)
	if (CONFIG_GET(flag/log_ooc))
		WRITE_LOG(GLOB.world_game_log, "OOC: [text]")

/// Logging for prayed messages
/proc/log_prayer(text)
	if (CONFIG_GET(flag/log_prayer))
		WRITE_LOG(GLOB.world_game_log, "PRAY: [text]")

<<<<<<< HEAD
/// Logging for changes to ID card access
=======
/// Logging for music requests
/proc/log_internet_request(text)
	if (CONFIG_GET(flag/log_internet_request))
		WRITE_LOG(GLOB.world_game_log, "INTERNET REQUEST: [text]")

/// Logging for logging in & out of the game, with error messages.
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
/proc/log_access(text)
	if (CONFIG_GET(flag/log_access))
		WRITE_LOG(GLOB.world_game_log, "ACCESS: [text]")

/// Logging for OOC votes
/proc/log_vote(text)
	if (CONFIG_GET(flag/log_vote))
		WRITE_LOG(GLOB.world_game_log, "VOTE: [text]")
<<<<<<< HEAD
=======

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
