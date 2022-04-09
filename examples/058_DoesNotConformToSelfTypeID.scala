// START
@main def DoesNotConformToSelfTypeID =
  trait User
  trait Phone:
    this: User =>
  class Brand extends Phone
// END


