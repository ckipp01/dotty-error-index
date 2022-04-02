#!/usr/bin/env bash

# Nightlies were published wrong so there are some 3.2.0 that are incorrect for so for now
# we can't do the below, but after the next release we should be able to so for now we look
# only for the 3.1.3 ones
#SCALA_VERSION=$(cs complete-dep org.scala-lang:scala3-compiler_3: | grep NIGHTLY | tail -1)
SCALA_VERSION=$(cs complete-dep org.scala-lang:scala3-compiler_3: | grep 3.1.3 | tail -1)
TARGET_FILES=$(ls *.scala)
COMMAND="$1"
ERROR_MESSAGE_ID="$2"
BLUE='\033[00;34m'
RED='\033[00;31m'
END='\033[0m'
SOURCE_ROOT=$PWD

function error() {
  echo -e "$RED $1$END"
}

function info() {
  echo -e "$BLUE $1$END"
}

if [ $ERROR_MESSAGE_ID ] && [ ${#ERROR_MESSAGE_ID} != 4 ]; then
  error "MessgaeIDs must be 4 letters long like: 0002"
  exit 1
fi

if [ ! -d ./out ]; then
  mkdir -p ./out
fi

function check_scala_version() {
  if [ $SCALA_VERSION ]; then
    info "Running with version $SCALA_VERSION"
  else
    error "Unable to get Scala nightly"
    exit 1
  fi
}

# So this is a bit of a hack because we don't want the full path in here or the
# check will fail for CI So this command just changes:
# -- [E001] Syntax Error: /Users/ckipp/Documents/scala-workspace/dotty-error-index/0001_EmptyCatchBlockID.scala:2:9
# with
# -- [E001] Syntax Error: 0001_EmptyCatchBlockID.scala:2:9
# NOTE: we also use ? instea of / since the PWD has / in it and screws up sed
# because computers are dumb
function relativize () {
  sed -i "s?$SOURCE_ROOT/??g" $1
}

function update_file() {
  NEW_NAME=${1%.scala}.check
  cs launch scala:$SCALA_VERSION -- -color:never -explain -deprecation -source:future -Ycook-docs $1 &> checkfiles/$NEW_NAME
  relativize checkfiles/$NEW_NAME
  info "Updated checkfiles/$NEW_NAME"
}

function handle_update() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find . -maxdepth 1 -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_scala_version
      update_file $TARGET_FILE
    else
      error "Found no file starting with $ERROR_MESSAGE_ID"
    fi
  else
    check_scala_version
    for TARGET_FILE in $TARGET_FILES
    do
      update_file $TARGET_FILE
    done
  fi
}

function check_file() {
  NEW_NAME=${1%.scala}.check
  cs launch scala:$SCALA_VERSION -- -color:never -explain -deprecation -source:future -Ycook-docs $1&> out/$NEW_NAME
  relativize out/$NEW_NAME
  diff out/$NEW_NAME checkfiles/$NEW_NAME && \
    info "$NEW_NAME matches expected output" || \
    (error "$NEW_NAME doesn't match expected output" && exit 1)
}

function handle_check() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find . -maxdepth 1 -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_scala_version
      check_file $TARGET_FILE
    else
      error "Found no file starting with $ERROR_MESSAGE_ID"
    fi
  else
    check_scala_version
    for TARGET_FILE in $TARGET_FILES
    do
      check_file $TARGET_FILE || exit 1
    done
  fi
}

function run_file() {
  cs launch scala:$SCALA_VERSION -- -explain -deprecation -source:future -Ycook-docs $1
}

function handle_run() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find . -maxdepth 1 -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_scala_version
      run_file $TARGET_FILE
    else
      error "Found no file starting with $ERROR_MESSAGE_ID"
    fi
  else
    check_scala_version
    for TARGET_FILE in $TARGET_FILES
    do
      run_file $TARGET_FILE
    done
  fi
}

case $COMMAND in
  check)
    handle_check
    ;; 
  run)
    handle_run
    ;;
  update-checkfiles)
    handle_update 
    ;;
  *)
    info "Usage: Use check, run or, update-checkfiles with an optional ID"
    ;; 
esac

