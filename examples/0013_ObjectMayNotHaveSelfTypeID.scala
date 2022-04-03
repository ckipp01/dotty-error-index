// START
@main def ObjectMayNotHaveSelfTypeID =
  trait A
  object Foo { self: A => }
// END
