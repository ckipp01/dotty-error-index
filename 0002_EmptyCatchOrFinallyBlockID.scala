// Right now this says 0000, but should be 0002.
// Fixed by: https://github.com/lampepfl/dotty/pull/14786 but needs to be merged

@main def EmptyCatchOrFinallyBlockID =
  try {}
