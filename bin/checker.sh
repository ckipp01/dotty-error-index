#!/usr/bin/env bash

source bin/colors.sh

# Nightlies were published wrong so there are some 3.2.0 that are incorrect for so for now
# we can't do the below, but after the next release we should be able to so for now we look
# only for the 3.1.3 ones
#SCALA_VERSION=$(cs complete-dep org.scala-lang:scala3-compiler_3: | grep NIGHTLY | tail -1)
SCALA_VERSION=$(cs complete-dep org.scala-lang:scala3-compiler_3: | grep 3.1.3 | tail -1)
TARGET_FILES=$(ls examples/*.scala)
COMMAND="$1"
ERROR_MESSAGE_ID="$2"
SOURCE_ROOT=$PWD

if [ $ERROR_MESSAGE_ID ] && [ ${#ERROR_MESSAGE_ID} != 4 ]; then
  echo -e "${RED}MessgaeIDs must be 4 letters long${RESET}

  Try again with something like this ${BLUE}0001${RESET}"
  exit 1
fi

if [ ! -d out ]; then
  mkdir -p out
fi

function check_scala_version() {
  if [ $SCALA_VERSION ]; then
    echo -e "Running ${BOLD}$COMMAND${RESET} with version ${BLUE}$SCALA_VERSION${RESET}\n"
  else
    echo -e "${RED}Unable to get Scala nightly version${RESET}

    Maybe check the following things:

      - Internet connection
      - You have coursier (cs) installed

    If none of them work, as a last resort you can change the ${BLUE}SCALA_VERSION${RESET}
    variable in the top of bin/checker.sh with a version you know you have
    locally."
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

function file_not_found() {
  echo -e "${RED}Found no file starting with ${UNDERLINE}$1${RESET}

  Take a look at all of the Scala files in ${BOLD}examples/${RESET} to make
  sure the ID you're looking for exists and try again."
}

function update_file() {
  BASE=$(basename $1)
  NEW_NAME=${BASE%.scala}.check
  cs launch scala:$SCALA_VERSION -- -color:never -explain -deprecation -source:future -Ycook-docs $1 &> checkfiles/$NEW_NAME
  relativize checkfiles/$NEW_NAME
  echo -e "Updated checkfile ${BLUE}checkfiles/$NEW_NAME${RESET}"
}

function handle_update() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find examples -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_scala_version
      update_file $TARGET_FILE
    else
      file_not_found $ERROR_MESSAGE_ID
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
  BASE=$(basename $1)
  NEW_NAME=${BASE%.scala}.check
  cs launch scala:$SCALA_VERSION -- -color:never -explain -deprecation -source:future -Ycook-docs $1&> out/$NEW_NAME
  relativize out/$NEW_NAME
  diff out/$NEW_NAME checkfiles/$NEW_NAME && \
    echo -e "${BLUE}$NEW_NAME${RESET} matches the expected output" || \
    (echo -e "${RED}${UNDERLINE}$NEW_NAME${RED} doesn't match expected output${RESET}" && exit 1)
}

function handle_check() {
  if [ $ERROR_MESSAGE_ID ]; then
    TARGET_FILE=$(find examples -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_scala_version
      check_file $TARGET_FILE
    else
      file_not_found $ERROR_MESSAGE_ID
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
    TARGET_FILE=$(find examples -type f -name $ERROR_MESSAGE_ID*)
    if [ $TARGET_FILE ]; then
      check_scala_version
      run_file $TARGET_FILE
    else
      file_not_found $ERROR_MESSAGE_ID
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
    echo -e "Usage: Use ${BLUE}check${RESET}, ${BLUE}run${RESET} or, ${BLUE}update-checkfiles${RESET} with an optional ID"
    ;; 
esac
