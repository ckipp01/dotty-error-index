// START
@main def ParameterizedTypeLacksArgumentsID =
  trait Foo(x: Int)
  val foo = new Foo {}
// END
