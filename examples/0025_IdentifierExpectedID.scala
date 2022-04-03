// I can't reproduce this one. It's only used once in the Parser and once in
// the JavaParser. I honestly don't even know if we need it since E040 could
// probably be used for this (ExpectedTokenButFound) and then just pass it
// IDENTIFIER. That's common the parser and everything I try ends up showng me
// that anyways.
// START
@main def IdentifierExpectedID = ()
// END
