// Ring now this actually reports 0000 but should be 0001
// Fixed by https://github.com/lampepfl/dotty/pull/14786 but needs to be merged
@main def EmptyCatchBlockID =
  try {} catch {}
