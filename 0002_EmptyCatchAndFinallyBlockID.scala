// Right now this says 0001, but I feel like this should really say 0002
// I thought this was fixed by: https://github.com/lampepfl/dotty/pull/14786
// but it seems not
@main def EmptyCatchAndFinallyBlockID =
  try {} catch {}
