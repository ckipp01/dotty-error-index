// Can't figure out how to reproduce this one
// https://github.com/lampepfl/dotty/blob/7208bd89e4de0a0c7690cbb5825329622ddaeb8f/compiler/src/dotty/tools/dotc/parsing/Parsers.scala#L1427-L1428
// Thought it'd be some weird type A = (:=> String) combo or something

// INCOMPLETE
// START
@main def ByNameParameterNotSupportedID = ()
// END
