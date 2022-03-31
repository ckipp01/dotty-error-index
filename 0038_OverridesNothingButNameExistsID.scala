// Not fully sure how to reproduce this. Here are the notes from the usage site in Dotty:
//
// getClass in primitive value classes is defined in the standard library as:
//     override def getClass(): Class[Int] = ???
// However, it's not actually an override in Dotty because our Any#getClass
// is polymorphic (see `Definitions#Any_getClass`), so since we can't change
// the standard library, we need to drop the override flag without reporting
// an error.
//
// https://github.com/lampepfl/dotty/blob/616308d34912f1a42bee256bf77b85db3194c46b/compiler/src/dotty/tools/dotc/typer/RefChecks.scala#L901-L908
@main def OverridesNothingButNameExistsID = ()
