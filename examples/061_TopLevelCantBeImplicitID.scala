// LEGACY In the past top level implicit were not allowed. This is however no longer the case as of https://github.com/lampepfl/dotty/pull/5754
// START
@main def TopLevelCantBeImplicitID = ()
implicit val foo: String = "foo"
// END
