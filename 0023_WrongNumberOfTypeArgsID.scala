@main def WrongNumberOfTypeArgsID =
  def foo[A] = ()
  foo[String, String]

