# Contributing to Dotty Error Index

Thanks for taking a look at this! I'll do my best to explain what this is and
how you can contribute to it. Don't hesitate to reach out with any questions if
you get stuck or if you just want to chat about the problem. If you'd like to
contribute but don't feel like you have the knowledge necessary, don't hesitate.

## What exactly is this?

This is a WIP index of all the `ErrorMessageID`s in Dotty. The idea is to mimic
what Rust has with their [Rust Compiler Error
Index](https://doc.rust-lang.org/error-index.html). Eventually this will
migrated into the actual Scala docs, but for now it lives here until I can
correctly reproduce every one with examples. This is a very small part in the
goal outlined
[here](https://contributors.scala-lang.org/t/revisiting-dotty-diagnostics-for-tooling/5649/4)
for better structured Diagnostics in Dotty for tooling.

_What's an `ErrorMessageID`?_

An
[`ErrorMessageID`](https://github.com/lampepfl/dotty/blob/main/compiler/src/dotty/tools/dotc/reporting/ErrorMessageID.scala)
is an unique ID given to a
[`Message`](https://github.com/lampepfl/dotty/blob/main/compiler/src/dotty/tools/dotc/reporting/Message.scala)
in Dotty to identify a specific error. For now you may see these IDs pop up in
your diagnostic string, but that's it.

## How can I help?

The biggest way to help at the moment is to dig into certain examples that I
haven't yet been able to reproduce. The tricky part is that it's not always
clear _why_ they can't be reproduced. Is it simply that the correct code snippet
hasn't been figure out, or is it because the code that references the specific
`Message` that uses this `ErrorMessageID` is dead code and no longer sensical.

### Here is a list of `ErrormessageID`s that aren't yet reproduced.

  - [ ] 022 ByNameParameterNotSupportedID - I honestly just can't figure out
      how to reproduce this
  - [ ] 025 IdentifierExpectedID - See the note in this file. I can't reproduce
      but also think it might not be needed at all anymore and we could just use
      E040 instead
  - [ ] 027 VarArgsParamMustComeLastID - See the note in the file. Another one
      I can't reproduced by the check also doesn't seem to make sense in the
      code.
  - [ ] 028 IllegalLiteralID - No idea how to reproduce this one
  - [ ] 031 SeqWildcardPatternPosID - So I have a reproduction of this, but
      it's pretty bad and nonsensical. It'd be good to actually get a decent
      one.
  - [ ] 032 IllegalStartOfSimplePattern - I have a reproduction of this, but I
      feel like it should be 0031 not 0032.
  - [ ] 033 PkgDuplicateSymbolID - Need to reproduce this
  - [ ] 038 OverridesNothingButNameExistsID - See notes in the file
  - [ ] 046 CyclicReferenceInvolvingID - See notes in the file
  - [ ] 047 CyclicReferenceInvolvingImplicitID - See notes in the file
  - [ ] 054 ParameterizedTypeLacksArgumentsID

## Getting Started

You'll need the following available on your system:
  - bash
  - [cs (coursier)](https://get-coursier.io/docs/cli-installation)

NOTE: For your own sanity alias `diff` to something modern like
[delta](https://github.com/dandavison/delta) so you can actually read the diff.

NOTE (for mac users): Ensure that you aren't using the default sed on mac, but
rather [GNU sed](https://www.gnu.org/software/sed/) as the behavior is
different. We use GNU sed to ensure it will work both on linux and Mac. You can
find how to do this
[here](https://gist.github.com/andre3k1/e3a1a7133fded5de5a9ee99c87c6fa0d?permalink_comment_id=3082272#gistcomment-3082272).

### Project Structure

```
bin/         <- Has the scripts that build and run everything
checkfiles/  <- All the checkfiles generated (don't manually update these)
examples/    <- All the example code snippets
Makefile     <- Where all the commands you need are located
out/         <- Temp dir that is used to compare with checkfiles
README.md    <- The actual error index
```

### Workflow

The recommended workflow is the following. If you're creating a new example
file.

  - Name the file `<ErrorMessageIDNumber>_<ErrorMesssageIDName>.scala`
  - Put the code snippet you want to be included in the index between a `//
      START` and `// END` comment
  - The code snippet *must* start with a `@main def <ErrorMessageID> =`. If there
      is extra code required to illustrate the error, put it underneath the main
      method, not above.
  - If the `ErrorMessageID` is no longer used by the compiler put a comment in
      the file, `// LEGACY`. This can optionally be followed (on the same line)
      with a short comment about it.
  - If you create a file that you can't get a reproduction for, no worries. Just
      put a comment that says `// INCOMPLETE` in the file so it's skipped in the
      index.

Once the file exists, the process is the same as if you were working on an
existing file. Since running everything does take a bit, it's recommended to
specify the id that you're working on for any of the commands.

_Run the specific snippet_

```bash
make run id=001
```

Keep playing around and running the snippet until you are able to see that it's
producing the correct ID that you'd expect. Once you have the reproduction you
can then create a checkfile for it.

_Create a checkfile for the id_
```bash
make update id=001
```

Once you have the new checkfile created you're able to run a check against it to
ensure that the output matches the checkfile.

_Check the output against the checkfile_
```bash
make check id=001
```

For all 3 commands, if you don't pass in an `id=<id>` it will run, update, or
check all the existing example files.

If you're unsure how to reproduce something a good order to follow is:

  - Start at the [`ErrorMessageID`](https://github.com/lampepfl/dotty/blob/main/compiler/src/dotty/tools/dotc/reporting/ErrorMessageID.scala)
  - Find what [`Message`](https://github.com/lampepfl/dotty/blob/main/compiler/src/dotty/tools/dotc/reporting/messages.scala) uses it
  - Search to see if this message can be found in any tests that you could use
      as an example
  - Search to find where that `Message` is used and try to piece some code
      together that would hit that part of the code.

### Building the index

The manually re-build the index you run:

```bash
make check build
```

This ensures that the full check passes and then re-builds the index.
