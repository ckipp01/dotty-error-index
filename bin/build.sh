#!/usr/bin/env bash

TARGET_FILES=$(ls examples/*.scala)
OUTPUT=README.md
SCALA_VERSION=$(cs complete-dep org.scala-lang:scala3-compiler_3: | grep 3.1.3 | tail -1)

rm -f -- $OUTPUT

echo -e "# Dotty Error Index\n" >> $OUTPUT
echo "*For Scala $SCALA_VERSION*" >> $OUTPUT

for TARGET_FILE in $TARGET_FILES
do
  FILENAME=$(basename $TARGET_FILE)
  BASE=${FILENAME%.scala}
  NUMBER=${BASE%_*}
  NAME=${BASE#*_}
  echo "## E$NUMBER $NAME" >> $OUTPUT

  INCOMPLETE=$(grep -n INCOMPLETE $TARGET_FILE)

  # If we find incomplete in the file, just add a message and move on to the next file.
  if [[ $INCOMPLETE ]]; then
    echo  "*This ErrorMessageID has no valid example yet. See the [contributing guide](https://github.com/ckipp01/dotty-error-index/blob/main/CONTRIBUTING.md) to see how you can help.*" >> $OUTPUT
  else
    START_LINE=$(grep -n START $TARGET_FILE)
    END_LINE=$(grep -n END $TARGET_FILE)

    LEGACY_LINE=$(grep -n LEGACY $TARGET_FILE)

    if [[ $LEGACY_LINE ]]; then
      echo -e "**NOTE:** This error is no longer emitted by the compiler.\n" >> $OUTPUT
      MSG=${LEGACY_LINE#*LEGACY}
      if [[ $MSG ]]; then
        echo -e "$MSG\n" >> $OUTPUT
      fi
    fi

    if [[ $START_LINE && $END_LINE ]]; then
      echo "_Erroneous Code Example_" >> $OUTPUT
      START_STRING=${START_LINE%:*}
      # We + 2 here because we want to start at START but then also remove the @main def
      START=$((START_STRING + 2))
      END_STRING=${END_LINE%:*} 
      END=$((END_STRING - 1))
      echo '```scala' >> $OUTPUT
      sed -n "$START,$END p" $TARGET_FILE >> $OUTPUT
      echo '```' >> $OUTPUT
    fi

    # For files that are marked LEGACY we don't include the error output
    # example because we can no longer get that output.
    if [[ ! $LEGACY_LINE ]]; then
      echo "_Example Error Output_" >> $OUTPUT
      echo '```' >> $OUTPUT
      cat checkfiles/$BASE.check >> $OUTPUT
      echo '```' >> $OUTPUT
    fi

  fi
done
