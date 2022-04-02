// Must be ran with -Ycook-docs to see the error
// START
@main def ProperDefinitionNotFoundID = ()
trait Foo:
  /** Some docs
   * @usecase val foo = ()
   */
  def foo: Unit
// END
