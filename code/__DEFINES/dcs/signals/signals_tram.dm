/// Sent from /obj/structure/industrial_lift/tram when its travelling status updates. (travelling)
#define COMSIG_TRAM_SET_TRAVELLING "tram_set_travelling"

<<<<<<< HEAD
/// Sent from /obj/structure/industrial_lift/tram when it begins to travel. (obj/effect/landmark/tram/from_where, obj/effect/landmark/tram/to_where)
=======
/// Sent from /obj/structure/industrial_lift/tram when it begins to travel. (obj/effect/landmark/tram/idle_platform, obj/effect/landmark/tram/to_where)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
#define COMSIG_TRAM_TRAVEL "tram_travel"

/// Sent from /obj/structure/industrial_lift/tram when it hits someone: ()
#define COMSIG_TRAM_COLLISION "tram_collided"
