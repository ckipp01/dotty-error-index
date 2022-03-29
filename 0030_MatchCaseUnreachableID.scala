@main def MatchCaseUnreachableID =
  val myList = List(1, 2, 3)
  myList match
    case foo => "this catches everything"
    case bar => "So I'll never get here"
    case null => "extra null check to not see E121"

