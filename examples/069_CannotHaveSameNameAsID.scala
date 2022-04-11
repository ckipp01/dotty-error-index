// START
@main def CannotHaveSameNameAsID =
  class Base:
    class Inner

  class Other extends Base:
    class Inner
// END
