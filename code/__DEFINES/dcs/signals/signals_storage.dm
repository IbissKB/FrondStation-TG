/// Sent when /datum/storage/dump_content_at(): (obj/item/storage_source, mob/user)
#define COMSIG_STORAGE_DUMP_CONTENT "storage_dump_contents"
	/// Return to stop the standard dump behavior.
	#define STORAGE_DUMP_HANDLED (1<<0)
<<<<<<< HEAD
=======
/// Sent after dumping into some other storage object: (atom/dest_object, mob/user)
#define COMSIG_STORAGE_DUMP_POST_TRANSFER "storage_dump_into_storage"

>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
