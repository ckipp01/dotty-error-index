// START
@main def ExistentialTypesNoLongerSupportedID =
  trait Foo[A, B]:
    type F = A forSome { type B}
// END
