// START
@main def PkgDuplicateSymbolID = ()
package foo { object bar }

package foo.bar {}
// END
