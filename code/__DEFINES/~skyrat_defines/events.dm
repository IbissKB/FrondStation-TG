/**
 * The events system now operates off of a defined preset of votable pools.
 * High, med, low
 * Players can vote for whatever one they want and then the subsystem will select a random event from the pool of pre-generated events.
 * The random define is for events such as anomalies so they are still run during higher level events.
 */

<<<<<<< HEAD
#define EVENT_CHAOS_LOW 1
#define EVENT_CHAOS_MED 2
#define EVENT_CHAOS_HIGH 3
#define EVENT_CHAOS_RANDOM 4
#define EVENT_CHAOS_DISABLED 5
=======
#define EVENT_LOWPOP_THRESHOLD 45
#define EVENT_MIDPOP_THRESHOLD 75
#define EVENT_HIGHPOP_THRESHOLD 100
#define EVENT_LOWPOP_TIMER_MULTIPLIER 2
#define EVENT_MIDPOP_TIMER_MULTIPLIER 1.5
#define EVENT_HIGHPOP_TIMER_MULTIPLIER 1
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
