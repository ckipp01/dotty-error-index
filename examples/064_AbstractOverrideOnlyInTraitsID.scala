// START
@main def AbstractOverrideOnlyInTraitsID =
  trait Foo:
    def foo: Unit

  abstract class Bar extends Foo:
    abstract override def foo: Unit
// END
    

