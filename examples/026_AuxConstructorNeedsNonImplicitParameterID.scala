// START
@main def AuxConstructorNeedsNonImplicitParameterID =
  class Foo(a: Int):
    def this(using a: Int) = this(a)
// END
