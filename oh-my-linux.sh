#!/bin/bash

#************************************************#
#                   Oh My Linux                  #
#                 Author: Dodo325                #
#                                                #
#************************************************#

# set -e 

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
. $SCRIPTPATH/lib/logs.sh --source-only
. $SCRIPTPATH/lib/sysinfo.sh --source-only
. $SCRIPTPATH/lib/tools.sh

BUILD_DIRECTORY=$SCRIPTPATH/build/
BUILD_SCRIPT=$BUILD_DIRECTORY/install.sh

# declare -A scripts_directory_array=();
scripts_directory_array=();
declare -A scripts_files=();
declare -A scripts_names=();
declare -A scripts_description=();

declare -A requires=();

declare -A visited=();
# declare -A stack=();
stack=();

# declare -A selected_scripts=();
selected_scripts=();


BFS() {
    local v=$1;
    log_warning "Start BFS in '$v'"
    visited[$v]=true;
    local graph=(${requires[$v]})
    for i in "${graph[@]}"; do
        echo "- i = $i"
        if [ "${visited[$i]}" = false ]; then
            BFS $i;
        fi
    done

    stack+=("$v")
}

topological_sort() {
    log_info "Start topological_sort"
#     # initial array
    visited=()
    stack=()

    for v in "${scripts_directory_array[@]}"; do
        visited[$v]=false;
    done

    for vv in "${selected_scripts[@]}"; do
        BFS $vv;
    done
#     # вызываем bfs из конкретной вершины 
}


_checklist=;

# Build variables:
header_sources=(
    $SCRIPTPATH/lib/logs.sh
    $SCRIPTPATH/lib/sysinfo.sh
)
footer_sources=()


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

    scripts_files[$2]=${metadata[file]};
    scripts_description[$2]=${metadata[description]};
    scripts_names[$2]=${metadata[name]};
    requires[$2]=${metadata[requires]};
    
    log_debug "name = ${metadata[name]}";
    log_debug "description = ${metadata[description]}";
    log_debug "file = ${metadata[file]}";
    log_debug "requires [$2] = ${metadata[requires]}";
    # тут мы объявляем переменные
}

detect_scripts_directories() {     
    for f in $SCRIPTPATH/scripts/*; do
        if [ -d "$f" ]; then
            # $f is a directory
            log_info "info $f"
            info_file_path=$f/info.cfg;
            if [ ! -f "$info_file_path" ]; then
                continue
            fi
            local dir_name=$(basename $f)
            scripts_directory_array+=($dir_name); # FIXME: ляя
            # scripts_directory_array=("${scripts_directory_array[@]}" "$dir_name")
            # scripts_directory_array[$dir_name]=$dir_name;

            parse_config_file $info_file_path $dir_name
            # а тут мы их используем

            # _checklist+='"${scripts_names[$dir_name]}" "${scripts_names[$description]}" off '
            _checklist+="$dir_name $dir_name off "
        fi
    done
}

append_script_file_to_build() {
    log_info "Add script: $1"
    content=$(cat $1)
    # TODO: repere the script content

    echo "$content" >> $BUILD_SCRIPT
        # Для каждого файла мы обрезаем контент
        # добавляем в выхдной файл 
        # добавляем папку с ресурсами
    
}

parse_checklist_output() {
    log_info "Start parse: $@"
    for el in "$@"
    do
        echo "- el: $el"
        tmp="${el%\"}"
        tmp="${tmp#\"}"
        echo "-- tmp: $tmp";
        # selected_scripts[$tmp]=$tmp;
        # selected_scripts=("${selected_scripts[@]}" $tmp)
        selected_scripts+=($tmp); #TODOL что-то тут не так
    done
}

initial_build_directory() {
    if [ -d "$BUILD_DIRECTORY" ]; then
        log_warning "Remove $BUILD_DIRECTORY!"
        rm -rf $BUILD_DIRECTORY;
    fi

    mkdir -p "$BUILD_DIRECTORY"

    touch "$BUILD_SCRIPT";
}

build_script() {
    initial_build_directory;

    # Обновляем зависимости

    # _scripts= $@

    # Для каждого файла мы обрезаем контент 
    for sfile in "${header_sources[@]}"; do
        append_script_file_to_build $sfile;
    done

    for name in "${stack[@]}"; do # 
        log_info "Add script = $name"
        local script_file=$SCRIPTPATH/scripts/$name/${scripts_files[$name]}
        log_info "script_file = $script_file"

        append_script_file_to_build "$script_file";
    done

    for sfile in "${footer_sources[@]}"; do
        append_script_file_to_build $sfile;
    done

    # Исправляем файл
    mv $BUILD_SCRIPT $BUILD_SCRIPT.old
    sed "/# skip/d" $BUILD_SCRIPT.old > $BUILD_SCRIPT; # TODO: Remove
    rm $BUILD_SCRIPT.old
}

ask_start_script() {
    local dio_name="Statr script?"
    local dio_discription="Statr script?"
    if (whiptail --title "$dio_name" --yesno "$dio_discription" 8 78); then
        log_info "Start script!"
        bash $BUILD_SCRIPT;
    else
        log_info ""
        echo "USE:"
        echo ""
        echo " $ bash $BUILD_SCRIPT"
        echo ""
    fi
}


main() {
    detect_scripts_directories;
    # OUTPUT=$(whiptail --checklist "Please pick one" 10 60 4 $_checklist  3>&2 2>&1 1>&3 )
    
    # checklist_out=$()
    # log_success "OUTPUT = $OUTPUT"
    # parse_checklist_output $OUTPUT;

    selected_scripts=(test_a vlc)
    log_success "selected_scripts = ${selected_scripts[@]}"

    # TODO: добавить топологическую сортировку selected_scripts!!!
    

    topological_sort; 
    build_script;
    # log_success "OUTPUT = ${OUTPUT[1]}" 
    # Получаем список выбранных

    # из списка выбранных делаем спикок зависимостей

    # Из списка зависимостей составляем с помощью топологической сортировки

    # собираем билд


     
    # whiptail --checklist "Please pick one" 10 60 4 one one off two two off\
    #     three three off four four off  five five off
    
    # ask_start_script;

    # update_graph;

    log_debug "scripts_directory_array = ${scripts_directory_array[@]}"

    log_debug "requires = "
    for K in "${!requires[@]}"; do echo $K --- ${requires[$K]}; done

    
    log_debug "visited = "
    for K in "${!visited[@]}"; do echo $K --- ${visited[$K]}; done

    log_debug "stack = "
    for K in "${!stack[@]}"; do echo $K --- ${stack[$K]}; done
}

if [ "${1}" != "--source-only" ]; then
    main "${@}"
fi
