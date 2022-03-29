// NOTE: This has some screwed up hi interpolation.
// https://github.com/lampepfl/dotty/pull/14802 needs to be merged to fix it.
@main def MissingReturnTypeID =
  trait Foo:
    def foo
