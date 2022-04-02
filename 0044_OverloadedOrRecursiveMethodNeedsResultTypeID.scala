@main def OverloadedOrRecursiveMethodNeedsResultTypeID =
  class Foo:
    def foo = ???
    def foo(a: Int) = foo()
