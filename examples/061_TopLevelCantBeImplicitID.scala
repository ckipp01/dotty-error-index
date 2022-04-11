// I can't seem to reproduce this one. I see in `Checking.scala` that is should
// be it if sym.owner.is(Package), but when playing around that doesn't seem to
// ever be true
// INCOMPLETE
@main def TopLevelCantBeImplicitID = ()

