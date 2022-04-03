// START
@main def AmbiguousReferenceID =
  import foo.*
  foo

object foo:
  def foo = ()
// END

