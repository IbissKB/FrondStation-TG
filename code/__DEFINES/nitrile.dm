#define NITRILE_GLOVES_MULTIPLIER 0.5
<<<<<<< HEAD
///multiplies the time of do_mob by NITRILE_GLOVES_MULTIPLIER if the user has the TRAIT_FASTMED
=======
///multiplies the time of do_after by NITRILE_GLOVES_MULTIPLIER if the user has the TRAIT_FASTMED
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
#define CHEM_INTERACT_DELAY(delay, user) HAS_TRAIT(user, TRAIT_FASTMED) ? (delay * NITRILE_GLOVES_MULTIPLIER) : delay
