// This is a pretty silly example, but does show you the correct E031.
// What I'd expect is something similiar to the explain where:
//
// case List(first*, second)
//
// would throw it, but that actually gives you E032 instead.
@main def SeqWildcardPatternPosID =
  val mySeq = Seq(1, 2, 3)
  val x = mySeq: _*
  ()
