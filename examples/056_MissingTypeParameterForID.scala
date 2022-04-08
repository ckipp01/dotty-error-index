// START
@main def MissingTypeParameterForID =
  trait X[F[_] <: AnyKind] { type L = F[Int]; def a: L = ??? } // error: cannot be used as a value type
// END

