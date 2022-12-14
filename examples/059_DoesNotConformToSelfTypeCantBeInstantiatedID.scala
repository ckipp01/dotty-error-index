// START
@main def DoesNotConformToSelfTypeCantBeInstantiatedID =
  trait A

  class B {
    self: A =>
  }

  val b = new B
// END
