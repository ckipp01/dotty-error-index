# Dotty Error Index

*NOTE*: This file is auto-generated, so please don't edit manually. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how to update it.

*Generated with Scala 3.3.0-RC1-bin-20221222-431f05b-NIGHTLY*

## E000 EmptyCatchOrFinallyBlockID
**NOTE:** This error is no longer emitted by the compiler.

_Erroneous Code Example_
```scala
  try {} catch {}
```
## E001 EmptyCatchBlockID
_Erroneous Code Example_
```scala
  try {} catch {}
```
_Example Error Output_
```
-- [E001] Syntax Error: examples/001_EmptyCatchBlockID.scala:3:9 
3 |  try {} catch {}
  |         ^^^^^^^^
  |         The catch block does not contain a valid expression, try
  |         adding a case like - case e: Exception => to the block
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | A try expression should be followed by some mechanism to handle any exceptions
  | thrown. Typically a catch expression follows the try and pattern matches
  | on any expected exceptions. For example:
  |
  | import scala.util.control.NonFatal
  |
  | try {} catch {
  |   case NonFatal(e) => ???
  | }
  |
  | It is also possible to follow a try immediately by a finally - letting the
  | exception propagate - but still allowing for some clean up in finally:
  |
  | try {} finally {
  |   // perform your cleanup here!
  | }
  |
  | It is recommended to use the NonFatal extractor to catch all exceptions as it
  | correctly handles transfer functions like return.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E002 EmptyCatchAndFinallyBlockID
_Erroneous Code Example_
```scala
  try {}
```
_Example Error Output_
```
-- [E002] Syntax Warning: examples/002_EmptyCatchAndFinallyBlockID.scala:3:2 
3 |  try {}
  |  ^^^^^^
  |  A try without catch or finally is equivalent to putting
  |  its body in a block; no exceptions are handled.
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | A try expression should be followed by some mechanism to handle any exceptions
  | thrown. Typically a catch expression follows the try and pattern matches
  | on any expected exceptions. For example:
  |
  | import scala.util.control.NonFatal
  |
  | try {} catch {
  |   case NonFatal(e) => ???
  | }
  |
  | It is also possible to follow a try immediately by a finally - letting the
  | exception propagate - but still allowing for some clean up in finally:
  |
  | try {} finally {
  |   // perform your cleanup here!
  | }
  |
  | It is recommended to use the NonFatal extractor to catch all exceptions as it
  | correctly handles transfer functions like return.
   -----------------------------------------------------------------------------
1 warning found
```
## E003 DeprecatedWithOperatorID
_Erroneous Code Example_
```scala
  type A = Double with Int
```
_Example Error Output_
```
-- [E003] Syntax Deprecation Warning: examples/003_DeprecatedWithOperatorID.scala:4:18 
4 |  type A = Double with Int
  |                  ^
  |                with as a type operator has been deprecated; use & instead
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Dotty introduces intersection types - & types. These replace the
  | use of the with keyword. There are a few differences in
  | semantics between intersection types and using with.
   -----------------------------------------------------------------------------
1 warning found
```
## E004 CaseClassMissingParamListID
_Erroneous Code Example_
```scala
  case class Foo
```
_Example Error Output_
```
-- [E004] Syntax Error: examples/004_CaseClassMissingParamListID.scala:3:13 
3 |  case class Foo
  |             ^^^
  |             A case class must have at least one parameter list
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Foo must have at least one parameter list, if you would rather
  | have a singleton representation of Foo, use a "case object".
  | Or, add an explicit () as a parameter list to Foo.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E005 DuplicateBindID
_Erroneous Code Example_
```scala
  List((1, 2)).map { case (num, num) => ??? }
```
_Example Error Output_
```
-- [E005] Naming Error: examples/005_DuplicateBindID.scala:3:32 
3 |  List((1, 2)).map { case (num, num) => ??? }
  |                                ^^^
  |                                duplicate pattern variable: num
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | For each case bound variable names have to be unique. In:
  |
  | case (num, num) =>  {
  |   ???
  | }
  |
  | num is not unique. Rename one of the bound variables!
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E006 MissingIdentID
_Erroneous Code Example_
```scala
  a
```
_Example Error Output_
```
-- [E006] Not Found Error: examples/006_MissingIdentID.scala:3:2 
3 |  a
  |  ^
  |  Not found: a
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The identifier for `a` is not bound, that is,
  | no declaration for this identifier can be found.
  | That can happen, for example, if `a` or its declaration has either been
  | misspelt or if an import is missing.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E007 TypeMismatchID
_Erroneous Code Example_
```scala
  val foo: String = 1
```
_Example Error Output_
```
-- [E007] Type Mismatch Error: examples/007_TypeMismatchID.scala:3:20 
3 |  val foo: String = 1
  |                    ^
  |                    Found:    (1 : Int)
  |                    Required: String
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  |
  | Tree: 1
  | I tried to show that
  |   (1 : Int)
  | conforms to
  |   String
  | but the comparison trace ended with `false`:
  |
  |   ==> (1 : Int)  <:  String
  |     ==> (1 : Int)  <:  String
  |       ==> Int  <:  String (left is approximated)
  |       <== Int  <:  String (left is approximated) = false
  |     <== (1 : Int)  <:  String = false
  |   <== (1 : Int)  <:  String = false
  |
  | The tests were made under the empty constraint
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E008 NotAMemberID
_Erroneous Code Example_
```scala
  object Foo
  Foo.iDontExist
```
_Example Error Output_
```
-- [E008] Not Found Error: examples/008_NotAMemberID.scala:4:6 
4 |  Foo.iDontExist
  |  ^^^^^^^^^^^^^^
  |  value iDontExist is not a member of object Foo
1 error found
Errors encountered during compilation
```
## E009 EarlyDefinitionsNotSupportedID
_Erroneous Code Example_
```scala
  import java.io.File
  trait ListFiles:
    val f: File
    def getList(msg: String) = f.listFiles
  end ListFiles

  class A extends {
    val f = new File("iDontExist")
  } with ListFiles
```
_Example Error Output_
```
-- Error: examples/009_EarlyDefinitionsNotSupportedID.scala:9:18 
9 |  class A extends {
  |                  ^
  |                  `extends` must be followed by at least one parent
-- [E009] Syntax Error: examples/009_EarlyDefinitionsNotSupportedID.scala:11:4 
11 |  } with ListFiles
   |    ^^^^
   |    Early definitions are not supported; use trait parameters instead
   |----------------------------------------------------------------------------
   | Explanation (enabled by `-explain`)
   |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   | Earlier versions of Scala did not support trait parameters and "early
   | definitions" (also known as "early initializers") were used as an alternative.
   |
   | Example of old syntax:
   |
   | trait Logging {
   |   val f: File
   |   f.open()
   |   onExit(f.close())
   |   def log(msg: String) = f.write(msg)
   | }
   |
   | class B extends Logging {
   |   val f = new File("log.data") // triggers a NullPointerException
   | }
   |
   | // early definition gets around the NullPointerException
   | class C extends {
   |   val f = new File("log.data")
   | } with Logging
   |
   | The above code can now be written as:
   |
   | trait Logging(f: File) {
   |   f.open()
   |   onExit(f.close())
   |   def log(msg: String) = f.write(msg)
   | }
   |
   | class C extends Logging(new File("log.data"))
    ----------------------------------------------------------------------------
-- Error: examples/009_EarlyDefinitionsNotSupportedID.scala:11:9 
11 |  } with ListFiles
   |         ^^^^^^^^^
   |         end of statement expected but identifier found
3 errors found
Errors encountered during compilation
```
## E010 TopLevelImplicitClassID
**NOTE:** This error is no longer emitted by the compiler.

 In the past top level implicit classes were not allowed. This is however no longer the case.

_Erroneous Code Example_
```scala
implicit class Foo(a: Int)
```
## E011 ImplicitCaseClassID
_Erroneous Code Example_
```scala
  implicit case class Foo(a: Int)
```
_Example Error Output_
```
-- [E011] Syntax Error: examples/011_ImplicitCaseClassID.scala:3:22 
3 |  implicit case class Foo(a: Int)
  |  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  |  A case class may not be defined as implicit
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Implicit classes may not be case classes. Instead use a plain class:
  |
  | implicit class Foo...
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E012 ImplicitClassPrimaryConstructorArityID
_Erroneous Code Example_
```scala
  implicit class Foo
```
_Example Error Output_
```
-- [E012] Syntax Error: examples/012_ImplicitClassPrimaryConstructorArityID.scala:3:17 
3 |  implicit class Foo
  |  ^^^^^^^^^^^^^^^^^^
  |  Implicit classes must accept exactly one primary constructor parameter
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Implicit classes may only take one non-implicit argument in their constructor. For example:
  |
  |  implicit class RichDate(date: java.util.Date)
  |
  | While it’s possible to create an implicit class with more than one non-implicit argument,
  | such classes aren’t used during implicit lookup.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E013 ObjectMayNotHaveSelfTypeID
_Erroneous Code Example_
```scala
  trait A
  object Foo { self: A => }
```
_Example Error Output_
```
-- [E013] Syntax Error: examples/013_ObjectMayNotHaveSelfTypeID.scala:4:15 
4 |  object Foo { self: A => }
  |               ^^^^^^^^^^
  |               objects must not have a self type
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | objects must not have a self type:
  |
  | Consider these alternative solutions:
  |   - Create a trait or a class instead of an object
  |   - Let the object extend a trait containing the self type:
  |
  |     object Foo extends A
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E014 TupleTooLongID
**NOTE:** This error is no longer emitted by the compiler.

 Before https://github.com/lampepfl/dotty/pull/4938 tuples were limited in length to 22

_Erroneous Code Example_
```scala
  (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23)
```
## E015 RepeatedModifierID
_Erroneous Code Example_
```scala
  final final val foo = ???
```
_Example Error Output_
```
-- [E015] Syntax Error: examples/015_RepeatedModifierID.scala:3:14 
3 |  final final val foo = ???
  |              ^^^
  |              Repeated modifier final
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | This happens when you accidentally specify the same modifier twice.
  |
  | Example:
  |
  | private private val Origin = Point(0, 0)
  |
  | instead of
  |
  | private final val Origin = Point(0, 0)
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E016 InterpolatedStringErrorID
_Erroneous Code Example_
```scala
  s"$new Point(1, 2)"
```
_Example Error Output_
```
-- [E016] Syntax Error: examples/016_InterpolatedStringErrorID.scala:3:5 
3 |  s"$new Point(1, 2)"
  |     ^
  |     Error in interpolated string: identifier or block expected
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | This usually happens when you forget to place your expressions inside curly braces.
  |
  | s"$new Point(0, 0)"
  |
  | should be written as
  |
  | s"${new Point(0, 0)}"
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E017 UnboundPlaceholderParameterID
_Erroneous Code Example_
```scala
  { _ }
```
_Example Error Output_
```
-- [E017] Syntax Error: examples/017_UnboundPlaceholderParameterID.scala:3:4 
3 |  { _ }
  |    ^
  |    Unbound placeholder parameter; incorrect use of _
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The _ placeholder syntax was used where it could not be bound.
  | Consider explicitly writing the variable binding.
  |
  | This can be done by replacing _ with a variable (eg. x)
  | and adding x => where applicable.
  |
  | Example before:
  |
  | { _ }
  |
  | Example after:
  |
  | x => { x }
  |
  | Another common occurrence for this error is defining a val with _:
  |
  | val a = _
  |
  | But this val definition isn't very useful, it can never be assigned
  | another value. And thus will always remain uninitialized.
  | Consider replacing the val with var:
  |
  | var a = _
  |
  | Note that this use of _ is not placeholder syntax,
  | but an uninitialized var definition.
  | Only fields can be left uninitialized in this manner; local variables
  | must be initialized.
  |
  | Another occurrence for this error is self type definition.
  | The _ can be replaced with this.
  |
  | Example before:
  |
  | trait A { _: B => ... 
  |
  | Example after:
  |
  | trait A { this: B => ... 
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E018 IllegalStartSimpleExprID
_Erroneous Code Example_
```scala
  val x = :  
```
_Example Error Output_
```
-- [E018] Syntax Error: examples/018_IllegalStartSimpleExprID.scala:3:10 
3 |  val x = :  
  |          ^
  |          expression expected but [31m:[0m found
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | An expression cannot start with [31m:[0m.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E019 MissingReturnTypeID
_Erroneous Code Example_
```scala
  trait Foo:
    def foo
```
_Example Error Output_
```
-- [E019] Syntax Error: examples/019_MissingReturnTypeID.scala:4:11 
4 |    def foo
  |           ^
  |           Missing return type
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | An abstract declaration must have a return type. For example:
  |
  | trait Shape:
  |   def area: Double // abstract declaration returning a Double
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E020 YieldOrDoExpectedInForComprehensionID
_Erroneous Code Example_
```scala
  for i <- 1 to 3 println(i)
```
_Example Error Output_
```
-- [E020] Syntax Error: examples/020_YieldOrDoExpectedInForComprehensionID.scala:5:0 
5 |
  |^
  |yield or do expected
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | When the enumerators in a for comprehension are not placed in parentheses or
  | braces, a do or yield statement is required after the enumerators
  | section of the comprehension.
  |
  | You can save some keystrokes by omitting the parentheses and writing
  |
  | val numbers = for i <- 1 to 3 yield i
  |
  |   instead of
  |
  | val numbers = for (i <- 1 to 3) yield i
  |
  | but the yield keyword is still required.
  |
  | For comprehensions that simply perform a side effect without yielding anything
  | can also be written without parentheses but a do keyword has to be
  | included. For example,
  |
  | for (i <- 1 to 3) println(i)
  |
  | can be written as
  |
  | for i <- 1 to 3 do println(i) // notice the 'do' keyword
   -----------------------------------------------------------------------------
-- [E008] Not Found Error: examples/020_YieldOrDoExpectedInForComprehensionID.scala:3:18 
3 |  for i <- 1 to 3 println(i)
  |           ^^^^^^^^^^^^^^
  |value println is not a member of scala.collection.immutable.Range.Inclusive
-- [E006] Not Found Error: examples/020_YieldOrDoExpectedInForComprehensionID.scala:3:26 
3 |  for i <- 1 to 3 println(i)
  |                          ^
  |                          Not found: i
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The identifier for `i` is not bound, that is,
  | no declaration for this identifier can be found.
  | That can happen, for example, if `i` or its declaration has either been
  | misspelt or if an import is missing.
   -----------------------------------------------------------------------------
3 errors found
Errors encountered during compilation
```
## E021 ProperDefinitionNotFoundID
_Erroneous Code Example_
```scala
trait Foo:
  /** Some docs
   * @usecase val foo = ()
   */
  def foo: Unit
```
_Example Error Output_
```
-- [E021] Doc Comment Error: examples/021_ProperDefinitionNotFoundID.scala:6:14 
 6 |   * @usecase val foo = ()
   |              ^
   |              Proper definition was not found in @usecase
 7 |   */
 8 |  def foo: Unit
 9 |// END
   |----------------------------------------------------------------------------
   | Explanation (enabled by `-explain`)
   |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   | Usecases are only supported for defs. They exist because with Scala's
   | advanced type-system, we sometimes end up with seemingly scary signatures.
   | The usage of these methods, however, needs not be - for instance the map
   | function
   |
   | List(1, 2, 3).map(2 * _) // res: List(2, 4, 6)
   |
   | is easy to understand and use - but has a rather bulky signature:
   |
   | def map[B, That](f: A => B)(implicit bf: CanBuildFrom[List[A], B, That]): That
   |
   | to mitigate this and ease the usage of such functions we have the @usecase
   | annotation for docstrings. Which can be used like this:
   |
   | /** Map from List[A] => List[B]
   |   *
   |   * @usecase def map[B](f: A => B): List[B]
   |   */
   | def map[B, That](f: A => B)(implicit bf: CanBuildFrom[List[A], B, That]): That
   |
   |
   | When creating the docs, the signature of the method is substituted by the
   | usecase and the compiler makes sure that it is valid. Because of this, you're
   | only allowed to use defs when defining usecases.
    ----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E022 ByNameParameterNotSupportedID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E023 WrongNumberOfTypeArgsID
_Erroneous Code Example_
```scala
  def foo[A] = ()
  foo[String, String]
```
_Example Error Output_
```
-- [E023] Syntax Error: examples/023_WrongNumberOfTypeArgsID.scala:4:5 
4 |  foo[String, String]
  |  ^^^^^^^^^^^^^^^^^^^
  |  Too many type arguments for 023_WrongNumberOfTypeArgsID$package.foo[A]
  |  expected: [A]
  |  actual:   [String, String]
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | You have supplied too many type parameters
  |
  | For example List takes a single type parameter (List[A])
  | If you need to hold more types in a list then you need to combine them
  | into another data type that can contain the number of types you need,
  | In this example one solution would be to use a Tuple:
  |
  | val tuple2: (Int, String) = (1, "one")
  | val list: List[(Int, String)] = List(tuple2)
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E024 IllegalVariableInPatternAlternativeID
_Erroneous Code Example_
```scala
  Option((1, 2)) match
    case (1, n) | (n, 1) => "got a one!"
    case _ => "didn't get a 1"
```
_Example Error Output_
```
-- [E024] Syntax Error: examples/024_IllegalVariableInPatternAlternativeID.scala:4:13 
4 |    case (1, n) | (n, 1) => "got a one!"
  |             ^
  |             Illegal variable n in pattern alternative
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Variables are not allowed within alternate pattern matches. You can workaround
  | this issue by adding additional cases for each alternative. For example, the
  | illegal function:
  |
  | def g(pair: (Int,Int)): Int = pair match {
  |   case (1, n) | (n, 1) => n
  |   case _ => 0
  | }
  | could be implemented by moving each alternative into a separate case:
  |
  | def g(pair: (Int,Int)): Int = pair match {
  |   case (1, n) => n
  |   case (n, 1) => n
  |   case _ => 0
  | }
   -----------------------------------------------------------------------------
-- [E024] Syntax Error: examples/024_IllegalVariableInPatternAlternativeID.scala:4:19 
4 |    case (1, n) | (n, 1) => "got a one!"
  |                   ^
  |                   Illegal variable n in pattern alternative
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Variables are not allowed within alternate pattern matches. You can workaround
  | this issue by adding additional cases for each alternative. For example, the
  | illegal function:
  |
  | def g(pair: (Int,Int)): Int = pair match {
  |   case (1, n) | (n, 1) => n
  |   case _ => 0
  | }
  | could be implemented by moving each alternative into a separate case:
  |
  | def g(pair: (Int,Int)): Int = pair match {
  |   case (1, n) => n
  |   case (n, 1) => n
  |   case _ => 0
  | }
   -----------------------------------------------------------------------------
2 errors found
Errors encountered during compilation
```
## E025 IdentifierExpectedID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E026 AuxConstructorNeedsNonImplicitParameterID
_Erroneous Code Example_
```scala
  class Foo(a: Int):
    def this(using a: Int) = this(a)
```
_Example Error Output_
```
-- [E026] Syntax Error: examples/026_AuxConstructorNeedsNonImplicitParameterID.scala:4:27 
4 |    def this(using a: Int) = this(a)
  |                           ^
  |                   Auxiliary constructor needs non-implicit parameter list
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Only the primary constructor is allowed an implicit parameter list;
  | auxiliary constructors need non-implicit parameter lists. When a primary
  | constructor has an implicit argslist, auxiliary constructors that call the
  | primary constructor must specify the implicit value.
  |
  | To resolve this issue check for:
  |  - Forgotten parenthesis on this (def this() = { ... })
  |  - Auxiliary constructors specify the implicit value
   -----------------------------------------------------------------------------
-- [E120] Naming Error: examples/026_AuxConstructorNeedsNonImplicitParameterID.scala:4:8 
4 |    def this(using a: Int) = this(a)
  |        ^
  |Double definition:
  |def <init>(a: Int): Foo in class Foo at line 3 and
  |def <init>(using a: Int)(): Foo in class Foo at line 4
  |have the same type after erasure.
  |
  |Consider adding a @targetName annotation to one of the conflicting definitions
  |for disambiguation.
2 errors found
Errors encountered during compilation
```
## E027 VarArgsParamMustComeLastID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E028 IllegalLiteralID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E029 PatternMatchExhaustivityID
_Erroneous Code Example_
```scala
  enum Foo:
    case a, b, c
  val foo: Foo = Foo.a

  foo match
    case Foo.a => "What about the rest?"
```
_Example Error Output_
```
-- [E029] Pattern Match Exhaustivity Warning: examples/029_PatternMatchExhaustivityID.scala:7:2 
7 |  foo match
  |  ^^^
  |  match may not be exhaustive.
  |
  |  It would fail on pattern case: b, c
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | There are several ways to make the match exhaustive:
  |  - Add missing cases as shown in the warning
  |  - If an extractor always return Some(...), write Some[X] for its return type
  |  - Add a case _ => ... at the end to match all remaining cases
   -----------------------------------------------------------------------------
1 warning found
```
## E030 MatchCaseUnreachableID
_Erroneous Code Example_
```scala
  val myList = List(1, 2, 3)
  myList match
    case foo => "this catches everything"
    case bar => "So I'll never get here"
    case null => "extra null check to not see E121"
```
_Example Error Output_
```
-- [E030] Match case Unreachable Warning: examples/030_MatchCaseUnreachableID.scala:6:9 
6 |    case bar => "So I'll never get here"
  |         ^^^
  |         Unreachable case
1 warning found
```
## E031 SeqWildcardPatternPosID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E032 IllegalStartOfSimplePatternID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E033 PkgDuplicateSymbolID
_Erroneous Code Example_
```scala
package foo { object bar }

package foo.bar {}
```
_Example Error Output_
```
-- [E033] Naming Error: examples/033_PkgDuplicateSymbolID.scala:5:12 
5 |package foo.bar {}
  |        ^^^^^^^
  |        Trying to define package with same name as class bar
1 error found
Errors encountered during compilation
```
## E034 ExistentialTypesNoLongerSupportedID
_Erroneous Code Example_
```scala
  trait Foo[A, B]:
    type F = A forSome { type B}
```
_Example Error Output_
```
-- [E034] Syntax Error: examples/034_ExistentialTypesNoLongerSupportedID.scala:4:15 
4 |    type F = A forSome { type B}
  |               ^^^^^^^
  |               Existential types are no longer supported -
  |               use a wildcard or dependent type instead
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The use of existential types is no longer supported.
  |
  | You should use a wildcard or dependent type instead.
  |
  | For example:
  |
  | Instead of using forSome to specify a type variable
  |
  | List[T forSome { type T }]
  |
  | Try using a wildcard type variable
  |
  | List[?]
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E035 UnboundWildcardTypeID
_Erroneous Code Example_
```scala
  val foo: _ = ???
```
_Example Error Output_
```
-- [E035] Syntax Error: examples/035_UnboundWildcardTypeID.scala:3:11 
3 |  val foo: _ = ???
  |           ^
  |           Unbound wildcard type
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The wildcard type syntax (_) was used where it could not be bound.
  | Replace _ with a non-wildcard type. If the type doesn't matter,
  | try replacing _ with Any.
  |
  | Examples:
  |
  | - Parameter lists
  |
  |   Instead of:
  |     def foo(x: _) = ...
  |
  |   Use Any if the type doesn't matter:
  |     def foo(x: Any) = ...
  |
  | - Type arguments
  |
  |   Instead of:
  |     val foo = List[?](1, 2)
  |
  |   Use:
  |     val foo = List[Int](1, 2)
  |
  | - Type bounds
  |
  |   Instead of:
  |     def foo[T <: _](x: T) = ...
  |
  |   Remove the bounds if the type doesn't matter:
  |     def foo[T](x: T) = ...
  |
  | - val and def types
  |
  |   Instead of:
  |     val foo: _ = 3
  |
  |   Use:
  |     val foo: Int = 3
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E036 DanglingThisInPathID
**NOTE:** This error is no longer emitted by the compiler.

## E037 OverridesNothingID
_Erroneous Code Example_
```scala
  class Foo:
    override val foo = ???
```
_Example Error Output_
```
-- [E037] Declaration Error: examples/037_OverridesNothingID.scala:4:17 
4 |    override val foo = ???
  |                 ^
  |                 value foo overrides nothing
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | There must be a field or method with the name foo in a super
  | class of class Foo to override it. Did you misspell it?
  | Are you extending the right classes?
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E038 OverridesNothingButNameExistsID
_Erroneous Code Example_
```scala
trait Foo1:
  def bar(i: Int) = ???

trait Foo2 extends Foo1:
  override def bar(s: String) = ???
```
_Example Error Output_
```
-- [E038] Declaration Error: examples/038_OverridesNothingButNameExistsID.scala:7:15 
7 |  override def bar(s: String) = ???
  |               ^
  |      method bar has a different signature than the overridden declaration
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | There must be a non-final field or method with the name bar and the
  | same parameter list in a super class of trait Foo2 to override it.
  |
  |   override def bar(s: String): Nothing
  |
  | The super classes of trait Foo2 contain the following members
  | named bar:
  |   def bar(i: Int): Nothing
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E039 ForwardReferenceExtendsOverDefinitionID
_Erroneous Code Example_
```scala
  foo.toUpperCase
  val foo: String = ???
```
_Example Error Output_
```
-- [E039] Reference Error: examples/039_ForwardReferenceExtendsOverDefinitionID.scala:3:2 
3 |  foo.toUpperCase
  |  ^^^
  |  foo is a forward reference extending over the definition of foo
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | foo is used before you define it, and the definition of foo
  | appears between that use and the definition of foo.
  |
  | Forward references are allowed only, if there are no value definitions between
  | the reference and the referred method definition.
  |
  | Define foo before it is used,
  | or move the definition of foo so it does not appear between
  | the declaration of foo and its use,
  | or define foo as lazy.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E040 ExpectedTokenButFoundID
_Erroneous Code Example_
```scala
  val foo: = ???
```
_Example Error Output_
```
-- [E040] Syntax Error: examples/040_ExpectedTokenButFoundID.scala:3:11 
3 |  val foo: = ???
  |           ^
  |           an identifier expected, but '=' found
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  |
  | If you want to use '=' as identifier, you may put it in backticks: `=`.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E041 MixedLeftAndRightAssociativeOpsID
_Erroneous Code Example_
```scala
  case class I(j: Int):
    def +-(i: Int) = i
    def +:(i: Int) = i

  I(1) +- I(4) +: I(4)
```
_Example Error Output_
```
-- [E041] Syntax Error: examples/041_MixedLeftAndRightAssociativeOpsID.scala:7:10 
7 |  I(1) +- I(4) +: I(4)
  |          ^
  |+- (which is left-associative) and +: (which is right-associative) have same precedence and may not be mixed
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The operators +- and +: are used as infix operators in the same expression,
  | but they bind to different sides:
  | +- is applied to the operand to its left
  | +: is applied to the operand to its right
  | As both have the same precedence the compiler can't decide which to apply first.
  |
  | You may use parenthesis to make the application order explicit,
  | or use method application syntax operand1.+-(operand2).
  |
  | Operators ending in a colon : are right-associative. All other operators are left-associative.
  |
  | Infix operator precedence is determined by the operator's first character. Characters are listed
  | below in increasing order of precedence, with characters on the same line having the same precedence.
  |   (all letters)
  |   |
  |   ^
  |   &
  |   = !
  |   < >
  |   :
  |   + -
  |   * / %
  |   (all other special characters)
  | Operators starting with a letter have lowest precedence, followed by operators starting with `|`, etc.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E042 CantInstantiateAbstractClassOrTraitID
_Erroneous Code Example_
```scala
  trait Foo
  new Foo
```
_Example Error Output_
```
-- [E042] Type Error: examples/042_CantInstantiateAbstractClassOrTraitID.scala:4:6 
4 |  new Foo
  |      ^^^
  |      Foo is a trait; it cannot be instantiated
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Abstract classes and traits need to be extended by a concrete class or object
  | to make their functionality accessible.
  |
  | You may want to create an anonymous class extending Foo with
  |   class Foo { }
  |
  | or add a companion object with
  |   object Foo extends Foo
  |
  | You need to implement any abstract members in both cases.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E043 UnreducibleApplicationID
_Erroneous Code Example_
```scala
  case class CC[T](key: T)
  type Alias[T] = Seq[CC[T]]

  def g(xs: Alias[?]) = xs map { case CC(x) => CC(x) }
```
_Example Error Output_
```
-- [E043] Type Error: examples/043_UnreducibleApplicationID.scala:6:12 
6 |  def g(xs: Alias[?]) = xs map { case CC(x) => CC(x) }
  |            ^^^^^^^^
  |unreducible application of higher-kinded type [T] =>> Seq[CC[T]] to wildcard arguments
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | An abstract type constructor cannot be applied to wildcard arguments.
  | Such applications are equivalent to existential types, which are not
  | supported in Scala 3.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E044 OverloadedOrRecursiveMethodNeedsResultTypeID
_Erroneous Code Example_
```scala
  class Foo:
    def foo = ???
    def foo(a: Int) = foo()
```
_Example Error Output_
```
-- [E044] Cyclic Error: examples/044_OverloadedOrRecursiveMethodNeedsResultTypeID.scala:5:22 
5 |    def foo(a: Int) = foo()
  |                      ^
  |                      Overloaded or recursive method foo needs return type
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Case 1: method foo is overloaded
  | If there are multiple methods named method foo and at least one definition of
  | it calls another, you need to specify the calling method's return type.
  |
  | Case 2: method foo is recursive
  | If method foo calls itself on any path (even through mutual recursion), you need to specify the return type
  | of method foo or of a definition it's mutually recursive with.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E045 RecursiveValueNeedsResultTypeID
_Erroneous Code Example_
```scala
  val factorial = (x: Int) => if x == 0 then 1 else x * factorial(x - 1)
```
_Example Error Output_
```
-- [E045] Cyclic Error: examples/045_RecursiveValueNeedsResultTypeID.scala:3:56 
3 |  val factorial = (x: Int) => if x == 0 then 1 else x * factorial(x - 1)
  |                                                        ^
  |                                      Recursive value factorial needs type
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The definition of value factorial is recursive and you need to specify its type.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E046 CyclicReferenceInvolvingID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E047 CyclicReferenceInvolvingImplicitID
*This ErrorMessageID has no valid example yet. See the [CONTRIBUTING guide](CONTRIBUTING.md) to see how you can help.*
## E048 SuperQualMustBeParentID
_Erroneous Code Example_
```scala
  class Foo:
    val foo = Foo.super[Bar].foo
```
_Example Error Output_
```
-- [E048] Reference Error: examples/048_SuperQualMustBeParentID.scala:4:14 
4 |    val foo = Foo.super[Bar].foo
  |              ^^^^^^^^^^^^^^
  |              Bar does not name a parent of class Foo
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | When a qualifier T is used in a super prefix of the form C.super[T],
  | T must be a parent type of C.
  |
  | In this case, the parents of class Foo are:
  |   - Object
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E049 AmbiguousReferenceID
_Erroneous Code Example_
```scala
  import foo.*
  foo

object foo:
  def foo = ()
```
_Example Error Output_
```
-- [E049] Reference Error: examples/049_AmbiguousReferenceID.scala:4:2 
4 |  foo
  |  ^^^
  |  Reference to foo is ambiguous,
  |  it is both defined in package <empty>
  |  and imported subsequently by import foo._
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | The compiler can't decide which of the possible choices you
  | are referencing with foo: A definition of lower precedence
  | in an inner scope, or a definition with higher precedence in
  | an outer scope.
  | Note:
  |  - Definitions in an enclosing scope take precedence over inherited definitions
  |  - Definitions take precedence over imports
  |  - Named imports take precedence over wildcard imports
  |  - You may replace a name when imported using
  |    import scala.{ foo => fooTick }
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E050 MethodDoesNotTakeParametersId
_Erroneous Code Example_
```scala
  def foo = 1
  foo(1)
```
_Example Error Output_
```
-- [E050] Type Error: examples/050_MethodDoesNotTakeParametersId.scala:4:2 
4 |  foo(1)
  |  ^^^
  |  method foo does not take parameters
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | You have specified more parameter lists than defined in the method definition(s).
  | Nullary methods may not be called with parenthesis
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E051 AmbiguousOverloadID
_Erroneous Code Example_
```scala
  object Test:
    extension [A](a: A) def render: String = "Hi"
    extension [B](b: B) def render(using DummyImplicit): Char = 'x'

  Test.render(1)
```
_Example Error Output_
```
-- [E051] Reference Error: examples/051_AmbiguousOverloadID.scala:7:7 
7 |  Test.render(1)
  |  ^^^^^^^^^^^
  |Ambiguous overload. The overloaded alternatives of method render in object Test with types
  | [B](b: B)(using x$2: DummyImplicit): Char
  | [A](a: A): String
  |both match arguments ((1 : Int))
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | There are 2 methods that could be referenced as the compiler knows too little
  | about the expected type.
  | You may specify the expected type e.g. by
  | - assigning it to a value with a specified type, or
  | - adding a type ascription as in instance.myMethod: String => Int
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E052 ReassignmentToValID
_Erroneous Code Example_
```scala
  object Foo:
    val a = 1

  Foo.a = 2
```
_Example Error Output_
```
-- [E052] Type Error: examples/052_ReassignmentToValID.scala:13:8 
13 |  Foo.a = 2
   |  ^^^^^^^^^
   |  Reassignment to val a
   |----------------------------------------------------------------------------
   | Explanation (enabled by `-explain`)
   |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
   | You can not assign a new value to a as values can't be changed.
   | Keep in mind that every statement has a value, so you may e.g. use
   |   val a = if (condition) 2 else 5
   | In case you need a reassignable name, you can declare it as
   | variable
   |   var a = ...
    ----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E053 TypeDoesNotTakeParametersID
_Erroneous Code Example_
```scala
  val hello: String[String] = ???
```
_Example Error Output_
```
-- [E053] Type Error: examples/053_TypeDoesNotTakeParametersID.scala:3:13 
3 |  val hello: String[String] = ???
  |             ^^^^^^^^^^^^^^
  |             String does not take type parameters
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | You specified [0ma type parameter Ident(String)[0m for String, which is not
  | declared to take any.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E054 ParameterizedTypeLacksArgumentsID
**NOTE:** This error is no longer emitted by the compiler.

_Erroneous Code Example_
```scala
  trait Foo(x: Int)
  val foo = new Foo {}
```
## E055 VarValParametersMayNotBeCallByNameID
_Erroneous Code Example_
```scala
  class Foo(val a: => Boolean)
```
_Example Error Output_
```
-- [E055] Syntax Error: examples/055_VarValParametersMayNotBeCallByNameID.scala:3:19 
3 |  class Foo(val a: => Boolean)
  |                   ^^
  |                   val parameters may not be call-by-name
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | var and val parameters of classes and traits may no be call-by-name. In case you
  | want the parameter to be evaluated on demand, consider making it just a parameter
  | and a def in the class such as
  |   class MyClass(aTick: => String) {
  |     def a() = aTick
  |   }
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E056 MissingTypeParameterForID
_Erroneous Code Example_
```scala
  trait X[F[_] <: AnyKind] { type L = F[Int]; def a: L = ??? } // error: cannot be used as a value type
```
_Example Error Output_
```
-- [E056] Syntax Error: examples/056_MissingTypeParameterForID.scala:3:53 
3 |  trait X[F[_] <: AnyKind] { type L = F[Int]; def a: L = ??? } // error: cannot be used as a value type
  |                                                     ^
  |                                   X.this.L cannot be used as a value type
1 error found
Errors encountered during compilation
```
## E057 DoesNotConformToBoundID
_Erroneous Code Example_
```scala
  trait Animal
  class Dog extends Animal
  class Cup
  class Foo[A <: Animal]

  Foo[Cup]
```
_Example Error Output_
```
-- [E057] Type Mismatch Error: examples/057_DoesNotConformToBoundID.scala:8:6 
8 |  Foo[Cup]
  |      ^
  |      Type argument Cup does not conform to upper bound Animal
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | I tried to show that
  |   Cup
  | conforms to
  |   Animal
  | but the comparison trace ended with `false`:
  |
  |   ==> Cup  <:  Animal
  |   <== Cup  <:  Animal = false
  |
  | The tests were made under the empty constraint
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E058 DoesNotConformToSelfTypeID
_Erroneous Code Example_
```scala
  trait User
  trait Phone:
    this: User =>
  class Brand extends Phone
```
_Example Error Output_
```
-- [E058] Type Mismatch Error: examples/058_DoesNotConformToSelfTypeID.scala:6:8 
6 |  class Brand extends Phone
  |        ^
  |illegal inheritance: self type Brand of class Brand does not conform to self type User
  |of parent trait Phone
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | I tried to show that
  |   Brand
  | conforms to
  |   User
  | but the comparison trace ended with `false`:
  |
  |   ==> Brand  <:  User
  |   <== Brand  <:  User = false
  |
  | The tests were made under the empty constraint
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E059 DoesNotConformToSelfTypeCantBeInstantiatedID
_Erroneous Code Example_
```scala
  trait A

  class B {
    self: A =>
  }

  val b = new B
```
_Example Error Output_
```
-- [E059] Type Mismatch Error: examples/059_DoesNotConformToSelfTypeCantBeInstantiatedID.scala:9:14 
9 |  val b = new B
  |              ^
  |             B does not conform to its self type A; cannot be instantiated
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | I tried to show that
  |   B
  | conforms to
  |   A
  | but the comparison trace ended with `false`:
  |
  |   ==> B  <:  A
  |   <== B  <:  A = false
  |
  | The tests were made under the empty constraint
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E060 AbstractMemberMayNotHaveModifierID
_Erroneous Code Example_
```scala
    trait Foo:
      final def bar: String
```
_Example Error Output_
```
-- [E060] Syntax Error: examples/060_AbstractMemberMayNotHaveModifierID.scala:4:16 
4 |      final def bar: String
  |                ^
  |                abstract method bar may not have `final` modifier
1 error found
Errors encountered during compilation
```
## E061 TopLevelCantBeImplicitID
**NOTE:** This error is no longer emitted by the compiler.

 In the past top level implicit were not allowed. This is however no longer the case as of https://github.com/lampepfl/dotty/pull/5754

_Erroneous Code Example_
```scala
implicit val foo: String = "foo"
```
## E062 TypesAndTraitsCantBeImplicitID
_Erroneous Code Example_
```scala
implicit trait Foo
```
_Example Error Output_
```
-- [E062] Syntax Error: examples/062_TypesAndTraitsCantBeImplicitID.scala:3:15 
3 |implicit trait Foo
  |^^^^^^^^^^^^^^^^^^
  |implicit modifier cannot be used for types or traits
1 error found
Errors encountered during compilation
```
## E063 OnlyClassesCanBeAbstractID
_Erroneous Code Example_
```scala
class Foo:
  abstract def foo: Unit
```
_Example Error Output_
```
-- [E063] Syntax Error: examples/063_OnlyClassesCanBeAbstractID.scala:4:15 
4 |  abstract def foo: Unit
  |               ^
  |abstract modifier can be used only for classes; it should be omitted for abstract members
1 error found
Errors encountered during compilation
```
## E064 AbstractOverrideOnlyInTraitsID
_Erroneous Code Example_
```scala
  trait Foo:
    def foo: Unit

  abstract class Bar extends Foo:
    abstract override def foo: Unit
```
_Example Error Output_
```
-- [E064] Syntax Error: examples/064_AbstractOverrideOnlyInTraitsID.scala:7:26 
7 |    abstract override def foo: Unit
  |                          ^
  |             abstract override modifier only allowed for members of traits
1 error found
Errors encountered during compilation
```
## E065 TraitsMayNotBeFinalID
_Erroneous Code Example_
```scala
  final trait Foo
```
_Example Error Output_
```
-- [E065] Syntax Error: examples/065_TraitsMayNotBeFinalID.scala:3:14 
3 |  final trait Foo
  |              ^
  |              trait Foo may not be final
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | A trait can never be final since it is abstract and must be extended to be useful.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E066 NativeMembersMayNotHaveImplementationID
_Erroneous Code Example_
```scala
  class Foo:
    @native def foo: Unit = ()
```
_Example Error Output_
```
-- [E066] Syntax Error: examples/066_NativeMembersMayNotHaveImplementationID.scala:4:16 
4 |    @native def foo: Unit = ()
  |                ^
  |                @native members may not have an implementation
1 error found
Errors encountered during compilation
```
## E067 OnlyClassesCanHaveDeclaredButUndefinedMembersID
_Erroneous Code Example_
```scala
  object Foo:
    def foo: Unit
```
_Example Error Output_
```
-- [E067] Syntax Error: examples/067_OnlyClassesCanHaveDeclaredButUndefinedMembersID.scala:4:8 
4 |    def foo: Unit
  |        ^
  |Declaration of method foo not allowed here: only classes can have declared but undefined members
1 error found
Errors encountered during compilation
```
## E068 CannotExtendAnyValID
_Erroneous Code Example_
```scala
  trait Foo extends AnyVal
```
_Example Error Output_
```
-- [E068] Syntax Error: examples/068_CannotExtendAnyValID.scala:3:8 
3 |  trait Foo extends AnyVal
  |        ^
  |        trait Foo cannot extend AnyVal
  |-----------------------------------------------------------------------------
  | Explanation (enabled by `-explain`)
  |- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  | Only classes (not traits) are allowed to extend AnyVal, but traits may extend
  | Any to become [32m"universal traits"[0m which may only have def members.
  | Universal traits can be mixed into classes that extend AnyVal.
   -----------------------------------------------------------------------------
1 error found
Errors encountered during compilation
```
## E069 CannotHaveSameNameAsID
_Erroneous Code Example_
```scala
  class Base:
    class Inner

  class Other extends Base:
    class Inner
```
_Example Error Output_
```
-- [E069] Naming Error: examples/069_CannotHaveSameNameAsID.scala:7:10 
7 |    class Inner
  |          ^
  |class Inner cannot have the same name as class Inner in class Base -- class definitions cannot be overridden
1 error found
Errors encountered during compilation
```
## E070 ValueClassesMayNotDefineInnerID
_Erroneous Code Example_
```scala
class Foo(a: Int) extends AnyVal:
  class Inner
```
_Example Error Output_
```
-- [E070] Syntax Error: examples/070_ValueClassesMayNotDefineInnerID.scala:5:8 
5 |  class Inner
  |  ^^^^^^^^^^^
  |  Value classes may not define an inner class
1 error found
Errors encountered during compilation
```
## E171 MissingArgumentID
_Erroneous Code Example_
```scala
  trait Foo(x: Int)
  val foo = new Foo {}
```
_Example Error Output_
```
-- [E171] Type Error: examples/171_MissingArgumentID.scala:4:16 
4 |  val foo = new Foo {}
  |                ^^^
  |missing argument for parameter x of constructor Foo in trait Foo: (x: Int): Foo
1 error found
Errors encountered during compilation
```
