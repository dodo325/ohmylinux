#!/bin/bash


SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
. $SCRIPTPATH/lib/logs.sh --source-only
. $SCRIPTPATH/lib/sysinfo.sh --source-only


declare -A scripts_directory_array;

_i=0

parse_config_file(){
    local _info_file_path=$1

    log_info "Srart parse $_info_file_path"
    while read line; do
        if [[ $line =~ ^"["(.+)"]"$ ]]; then
            arrname=${BASH_REMATCH[1]}
            declare -A $arrname
        elif [[ $line =~ ^([_[:alpha:]][_[:alnum:]]*)"="(.*) ]]; then
            declare ${arrname}[${BASH_REMATCH[1]}]="${BASH_REMATCH[2]}"
    fi
    done < $_info_file_path

    log_success "name = ${metadata[name]}";
    log_success "description = ${metadata[description]}";
    log_success "file = ${metadata[file]}";
    # тут мы объявляем переменные
}


main() {

    local _checklist=;
    for f in $SCRIPTPATH/scripts/*; do
        if [ -d "$f" ]; then
            # $f is a directory
            info_file_path=$f/info.cfg
            log_info "info $f"
            _i+=1;
            local dir_name=$(basename $f)
            scripts_directory_array[$_i]=$dir_name;

            parse_config_file $info_file_path
            # а тут мы их используем

            _checklist+="$dir_name $dir_name off "
        fi
    done

    whiptail --checklist "Please pick one" 10 60 4 $_checklist
    # checklist_out=$()


     
    # whiptail --checklist "Please pick one" 10 60 4 one one off two two off\
    #     three three off four four off  five five off

    log_error ${scripts_directory_array[@]}
}

if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi