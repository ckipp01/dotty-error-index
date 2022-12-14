// START
@main def OverridesNothingButNameExistsID = ()
trait Foo1:
  def bar(i: Int) = ???

trait Foo2 extends Foo1:
  override def bar(s: String) = ???
// END
