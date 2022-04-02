#!/usr/bin/env bash

TARGET_FILES=$(ls *.scala)

rm -f -- index.md

for TARGET_FILE in $TARGET_FILES
do
  BASE=${TARGET_FILE%.scala}
  NUMBER=${BASE%_*}
  NAME=${BASE#*_}
  echo "## E$NUMBER $NAME" >> index.md
  START_LINE=$(grep -n START $TARGET_FILE)
  END_LINE=$(grep -n END $TARGET_FILE)

  if [[ $START_LINE && $END_LINE ]]; then
    echo "_Erroneous Code Example_" >> index.md
    START_STRING=${START_LINE::1}
    # We + 2 here because we want to start at START but then also remove the @main def
    START=$((START_STRING + 2))
    END_STRING=${END_LINE::1} 
    END=$((END_STRING - 1))
    echo '```scala' >> index.md
    sed -n "$START,$END p" $TARGET_FILE >> index.md
    echo '```' >> index.md
  fi

  echo "_Error Output_" >> index.md
  echo '```' >> index.md
  cat checkfiles/$BASE.check >> index.md
  echo '```' >> index.md

done
