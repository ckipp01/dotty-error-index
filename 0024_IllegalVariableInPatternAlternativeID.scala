// This doesn't actually give you the error you'd expect since it doesn't use the message that exists
// https://github.com/lampepfl/dotty/pull/14805 fixes this but needs to be merged
@main def IllegalVariableInPatternAlternativeID =
  Option((1, 2)) match
    case (1, n) | (n, 1) => "got a one!"
    case _ => "didn't get a 1"
