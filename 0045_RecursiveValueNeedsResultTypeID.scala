@main def RecursiveValueNeedsResultTypeID =
  val factorial = (x: Int) => if x == 0 then 1 else x * factorial(x - 1)
