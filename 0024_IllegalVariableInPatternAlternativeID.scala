// START
@main def IllegalVariableInPatternAlternativeID =
  Option((1, 2)) match
    case (1, n) | (n, 1) => "got a one!"
    case _ => "didn't get a 1"
// END
