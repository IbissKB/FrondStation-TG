// Remove the could_speak_language check from the tongue code. This is a much better solution than trying to grant omnitongue on prefs load, and prevents any funny breakages.
<<<<<<< HEAD
/obj/item/organ/internal/tongue/could_speak_language(language)
=======
/obj/item/organ/internal/tongue/could_speak_language(datum/language/language_path)
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
	return TRUE
