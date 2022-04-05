// LEGACY In the past top level implicit classes were not allowed. This is however no longer the case.
// START
@main def TopLevelImplicitClassID = ()
implicit class Foo(a: Int)
// END
