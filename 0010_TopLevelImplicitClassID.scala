// This is no longer emitted by the compiler
// It used to be that the top level implicit class here would
// fail, but it no longer does and this error will not be emitted

implicit class Foo(a: Int)

@main def TopLevelImplicitClassID = ()
