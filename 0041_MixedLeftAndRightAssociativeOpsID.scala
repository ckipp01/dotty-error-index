@main def MixedLeftAndRightAssociativeOpsID =
  case class I(j: Int):
    def +-(i: Int) = i
    def +:(i: Int) = i

  I(1) +- I(4) +: I(4)
