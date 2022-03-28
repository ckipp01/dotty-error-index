#!/usr/bin/env bash

SCALA_VERSION=3.1.2-RC3
TARGET_FILES=$(ls ./*.scala)
COMMAND="$1"
ERROR_MESSAGE_ID="$2"
BLUE='\033[00;34m'
RED='\033[00;31m'
END='\033[0m'

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

function update_file() {
  NEW_NAME=${1%.scala}.check
  cs launch scala:$SCALA_VERSION -- -color:never -explain -deprecation -source:future $1 &> checkfiles/$NEW_NAME
  cat checkfiles/$NEW_NAME
}

function handle_update() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find . -maxdepth 1 -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      update_file $TARGET_FILE
    else
      error "Found no file starting with $ERROR_MESSAGE_ID"
    fi
  else
    for TARGET_FILE in $TARGET_FILES
    do
      update_file $TARGET_FILE
    done
  fi
}

function check_file() {
  NEW_NAME=${1%.scala}.check
  cs launch scala:$SCALA_VERSION -- -color:never -explain -deprecation -source:future $1&> out/$NEW_NAME
  diff out/$NEW_NAME checkfiles/$NEW_NAME && \
    info "$NEW_NAME matches expected output" || \
    error "$NEW_NAME doesn't match expected output"
}

function handle_check() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find . -maxdepth 1 -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_file $TARGET_FILE
    else
      error "Found no file starting with $ERROR_MESSAGE_ID"
    fi
  else
    for TARGET_FILE in $TARGET_FILES
    do
      check_file $TARGET_FILE
    done
  fi
}

function handle_run() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find . -maxdepth 1 -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      scala -explain -deprecation -source:future $TARGET_FILE
    else
      error "Found no file starting with $ERROR_MESSAGE_ID"
    fi
  else
    for TARGET_FILE in $TARGET_FILES
    do
      cs launch scala:$SCALA_VERSION -- -explain -deprecation -source:future $TARGET_FILE
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

