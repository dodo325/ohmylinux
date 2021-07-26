#! /bin/bash

append_text_file_to_bash_script() {
    # USE:
    # convert_text_file_to_bash_script [sourse_text_file] [target_script_file] 
    local source_file=$1;
    local target_script_file=$2;
    local filename=$(basename $source_file)

    touch $filename
    echo "cat > $filename <<- EOM" >> $target_script_file
    cat $source_file >> $target_script_file
    echo "EOM" >> $target_script_file
}
