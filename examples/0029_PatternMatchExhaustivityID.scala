// START
@main def PatternMatchExhaustivityID =
  enum Foo:
    case a, b, c
  val foo: Foo = Foo.a

  foo match
    case Foo.a => "What about the rest?"
// END
