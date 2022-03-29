// I'm sort of stumped on this one as well. The code below should in theory
// trigger this, but instead you just get an E040 syntax error since the on
// place in the Parsers.scala that checks this:
// https://github.com/lampepfl/dotty/blob/e8356687e294d8a6274c1decf271fbcc43275e5a/compiler/src/dotty/tools/dotc/parsing/Parsers.scala#L3053-L3063
// is looking for `PostfixOp` but when you have code like this you get:
// 
// InfixOp(Ident(Int),Ident(*),Ident(<error>))
//
// so the check will never work meaning you won't get the error. I've hit on a
// few cases like this now where I'm unsure if these are just dead code paths
// or issus in the way Scanner / Parser.

//an identifier expected, but ',' found
@main def VarArgsParamMustComeLastID =
  def foo(a: Int*, b: Int) = b
