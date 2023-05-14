<<<<<<< HEAD
/// Helper macro for compile time translation
=======
/// Helper macro for creating a matrix at the given offsets.
/// Works at compile time.
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7
#define TRANSLATE_MATRIX(offset_x, offset_y) matrix(1, 0, (offset_x), 0, 1, (offset_y))
