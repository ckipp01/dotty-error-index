// The compiler will no longer emit this error.
// Before https://github.com/lampepfl/dotty/pull/4938 tuples were limited in length to 22
// START
@main def TupleTooLongID =
  (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
// END


