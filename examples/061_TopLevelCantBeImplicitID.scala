// LEGACY In the past top level implicit were not allowed. This is however no longer the case as of https://github.com/lampepfl/dotty/pull/5754
// START
@main def TopLevelCantBeImplicitID = ()

import scala.language.implicitConversions
case class C(str: String)
implicit def toC(x: String): C = C(x)
implicit val defaultC: C = C("default")
// END
