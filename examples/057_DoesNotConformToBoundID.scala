// START
@main def DoesNotConformToBoundID =
  trait Animal
  class Dog extends Animal
  class Cup
  class Foo[A <: Animal]

  Foo[Cup]
// END
