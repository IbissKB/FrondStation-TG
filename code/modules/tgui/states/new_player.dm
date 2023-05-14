/**
 * tgui state: new_player_state
 *
<<<<<<< HEAD
 * Checks that the user is a new_player, or if user is an admin
=======
 * Checks that the user is a /mob/dead/new_player
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
 */

GLOBAL_DATUM_INIT(new_player_state, /datum/ui_state/new_player_state, new)

/datum/ui_state/new_player_state/can_use_topic(src_object, mob/user)
<<<<<<< HEAD
	if(isnewplayer(user) || check_rights_for(user.client, R_ADMIN))
		return UI_INTERACTIVE
	return UI_CLOSE

=======
	return isnewplayer(user) ? UI_INTERACTIVE : UI_CLOSE
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
