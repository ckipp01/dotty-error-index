object foo:
  def foo = ()

@main def AmbiguousReferenceID =
  import foo.*
  foo
