// START
@main def UnreducibleApplicationID =
  case class CC[T](key: T)
  type Alias[T] = Seq[CC[T]]

  def g(xs: Alias[?]) = xs map { case CC(x) => CC(x) }
// END
