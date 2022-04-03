#!/usr/bin/env bash

TARGET_FILES=$(ls examples/*.scala)
OUTPUT=README.md

rm -f -- $OUTPUT

echo "# Dotty Error Index" >> $OUTPUT

for TARGET_FILE in $TARGET_FILES
do
  FILENAME=$(basename $TARGET_FILE)
  BASE=${FILENAME%.scala}
  NUMBER=${BASE%_*}
  NAME=${BASE#*_}
  echo "## E$NUMBER $NAME" >> $OUTPUT
  START_LINE=$(grep -n START $TARGET_FILE)
  END_LINE=$(grep -n END $TARGET_FILE)

  if [[ $START_LINE && $END_LINE ]]; then
    echo "_Erroneous Code Example_" >> $OUTPUT
    START_STRING=${START_LINE::1}
    # We + 2 here because we want to start at START but then also remove the @main def
    START=$((START_STRING + 2))
    END_STRING=${END_LINE::1} 
    END=$((END_STRING - 1))
    echo '```scala' >> $OUTPUT
    sed -n "$START,$END p" $TARGET_FILE >> $OUTPUT
    echo '```' >> $OUTPUT
  fi

  echo "_Error Output_" >> $OUTPUT
  echo '```' >> $OUTPUT
  cat checkfiles/$BASE.check >> $OUTPUT
  echo '```' >> $OUTPUT

done
