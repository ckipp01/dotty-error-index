// This illustrates E0032, but I honestly think this should be E0031

// INCOMPLETE
// START
@main def IllegalStartOfSimplePatternID =
  List(1, 2, 3) match
    case List(a*, b) => ???
// END
