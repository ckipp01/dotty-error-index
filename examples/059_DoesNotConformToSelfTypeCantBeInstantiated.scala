// START
@main def DoesNotConformToSelfTypeCantBeInstantiated =
  class Baz
  trait Bar {
    self: Baz =>
  }
  class Foo extends Bar
// END
