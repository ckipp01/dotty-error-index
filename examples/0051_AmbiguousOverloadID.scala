// START
@main def AmbiguousOverloadID =
  object Test:
    extension [A](a: A) def render: String = "Hi"
    extension [B](b: B) def render(using DummyImplicit): Char = 'x'

  Test.render(1)
//END
