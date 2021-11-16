#! /bin/bash

append_text_file_to_bash_script() {
    # USE:
    # convert_text_file_to_bash_script [sourse_text_file] [target_script_file]
    local source_file=$1;
    local target_script_file=$2;
    local filename=$(basename $source_file)
    local encoded_data=$(base64 -w 0 $source_file)
    echo "echo $encoded_data | base64 -d -w 0 > $filename" >> $target_script_file
}
