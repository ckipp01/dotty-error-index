# Dotty Error Index

A WIP index of all the `ErrorMessageID`s in Dotty. The idea is to mimic what
Rust has with their [Rust Compiler Error
Index](https://doc.rust-lang.org/error-index.html). Eventually this will
migrated into the actual Scala docs, but for now it lives here until I can
correctly reproduce every one with examples. This is a very small part in the
goal outline
[here](https://contributors.scala-lang.org/t/revisiting-dotty-diagnostics-for-tooling/5649/4)
for better structured Diagnostics in Dotty for tooling.

## Using this script

All you need to run the script is bash and
[cs](https://get-coursier.io/docs/cli-installation). For your own sanity alias
`diff` to something modern like [delta](https://github.com/dandavison/delta) so
you can actually read the diff.

The script is small and crude, but it does what I need it to. You can do the
following:

_Run all the examples and see the output_
```bash
./run.sh run
```

_Check the output of all the files against their check files_
```bash
./run.sh check
```

_Update all the checkfiles to be whatever the output of the run is_ 
```bash
./run.sh update-checkfiles
```

For all 3 commands you can also pass in an individual ID that corresponds with
the ID you're interested in.

```bash
./run.sh check 0005
```

## Unable to get a reproduction

Want to help? Feel free to try to reproduce any of these that aren't labeled
with an X.

  - [X] 0010 TopLevelImplicitClassID - Compiler won't emit this anymore since a
      top level class is treated as a def.
  - [X] 0014 TupleTooLongID - Legacy since tuples were limited to 22 before the
      changes in https://github.com/lampepfl/dotty/pull/4938
  - [ ] 0022 ByNameParameterNotSupportedID - I honestly just can't figure out
      how to reproduce this
  - [ ] 0025 IdentifierExpectedID - See the note in this file. I can't reproduce
      but also think it might not be needed at all anymore and we could just use
      E040 instead
  - [ ] 0027 VarArgsParamMustComeLastID - See the note in the file. Another one
      I can't reproduced by the check also doesn't seem to make sense in the
      code.
  - [ ] 0028 IllegalLiteralID - No idea how to reproduce this one
  - [ ] 0031 SeqWildcardPatternPosID - So I have a reproduction of this, but
      it's pretty bad and nonsensical. It'd be good to actually get a decent
      one.
  - [ ] 0032 IllegalStartOfSimplePattern - I have a reproduction of this, but I
      feel like it should be 0031 not 0032.
  - [ ] 0033 PkgDuplicateSymbolID - Need to reproduce this

