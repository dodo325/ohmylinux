# ! /bin/bash

. ./oh-my-linux --source-only


testEquality() {
  assertEquals 1 1
}

test_append_and_remove_script_dir() {
  append_new_script_dir A "";
  assertTrue "[ -d '$SCRIPTS_DIRECTORY/A' ]"
  assertTrue "[ -f '$SCRIPTS_DIRECTORY/A/info.cfg' ]"
  assertTrue "[ -f '$SCRIPTS_DIRECTORY/A/install.sh' ]"

  append_new_script_dir B "A";
  assertTrue "[ -d '$SCRIPTS_DIRECTORY/B' ]"
  assertTrue "[ -f '$SCRIPTS_DIRECTORY/B/info.cfg' ]"
  assertTrue "[ -f '$SCRIPTS_DIRECTORY/B/install.sh' ]"

  # assertTrue "[ $(grep -Fxq 'depends_on=A' $SCRIPTS_DIRECTORY/B/info.cfg) = 1 ]"

  # Remove:
  remove_script_dir A;
  remove_script_dir B;
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/A' ]"
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/B' ]"
  
}

test_detect_scripts_directories() {
  append_new_script_dir A "B";
  append_new_script_dir B "C";
  append_new_script_dir C "";

  detect_scripts_directories;

  assertEquals "${scripts_files[A]}" "install.sh"
  assertEquals "${scripts_files[B]}" "install.sh"
  assertEquals "${scripts_files[C]}" "install.sh"

  assertEquals "${scripts_names[A]}" "A"
  assertEquals "${scripts_names[B]}" "B"
  assertEquals "${scripts_names[C]}" "C"

  assertEquals "${depends_on[A]}" "B"
  assertEquals "${depends_on[B]}" "C"
  assertEquals "${depends_on[C]}" ""

  remove_script_dir A;
  remove_script_dir B;
  remove_script_dir C;
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/A' ]"
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/B' ]"
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/C' ]"
}

test_topological_sort() {
  append_new_script_dir A "B";
  append_new_script_dir B "C";
  append_new_script_dir C "";

  detect_scripts_directories;
  selected_scripts=("A")
  topological_sort

  local _s="${stack[@]}"
  assertEquals "$_s" "C B A";


  remove_script_dir A;
  remove_script_dir B;
  remove_script_dir C;
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/A' ]"
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/B' ]"
  assertTrue "[ ! -d '$SCRIPTS_DIRECTORY/C' ]"

}

test_initial_build_directory(){
  initial_build_directory;
  assertTrue "[ -d '$BUILD_DIRECTORY' ]"
  assertTrue "[ -f '$BUILD_SCRIPT' ]"
}

. ./shunit2/shunit2
