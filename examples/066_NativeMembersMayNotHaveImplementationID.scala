// START
@main def NativeMembersMayNotHaveImplementationID =
  class Foo:
    @native def foo: Unit = ()
// END
