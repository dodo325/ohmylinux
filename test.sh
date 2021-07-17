# ! /bin/bash

. ./oh-my-linux.sh --source-only


testEquality() {
  assertEquals 1 1
}

test_initial_build_directory(){
  initial_build_directory;
  assertTrue "[ -d '$BUILD_DIRECTORY' ]"
  assertTrue "[ -f '$BUILD_SCRIPT' ]"
}

. ./shunit2/shunit2