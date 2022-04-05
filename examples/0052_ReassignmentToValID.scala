// NOTE: I don't know if we even need this. This is used in multiple places, but
// not always when you think it would be. For example:
//
// val a = 1
// val a = 2
//
// The above doesn't use this ID but rather E161 AlreadyDefinedID.
// START
@main def ReassignmentToValID =
  object Foo:
    val a = 1

  Foo.a = 2
// END
