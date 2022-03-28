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
