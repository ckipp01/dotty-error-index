// Must be ran with -Ycook-docs to see the error
trait Foo:
  /** Some docs
   * @usecase val foo = ()
   */
  def foo: Unit

@main def ProperDefinitionNotFoundID = ()
