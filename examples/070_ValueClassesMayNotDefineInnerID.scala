// Value classes can't be local so we need to put it outside of the @main
// START
@main def ValueClassesMayNotDefineInnerID = ()
class Foo(a: Int) extends AnyVal:
  class Inner
// END

