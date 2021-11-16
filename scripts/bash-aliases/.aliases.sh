#!/usr/bin/env bash

get_sudo() {
    # OUTPUT:
    # - is_sudo
    # - is_root
    # - isu

    # TODO: test for different os
    is_sudo=false
    is_root=false
    isu="sudo";
    if [ "$(id -u)" = 0 ]; then
        is_sudo=true;
        is_root=true;
        isu="";
    elif sudo -n true 2>/dev/null; then
        is_sudo=true;
    fi
}


# Net-tools
alias mst='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

alias sshi="ssh -o 'IdentitiesOnly=yes'"
alias locip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias myip='curl ipinfo.io/ip'
alias lsip='arp'

killport() { sudo lsof -t -i tcp:"$1" | xargs kill -9 ; }
alias lsports='sudo lsof -i -P -n'

# print_port_info() { # TODO
#     get_sudo;
#     echo "- lsof -"
#     $isu lsof -i :$1

#     echo "- proc -"
#     port_id=$($isu fuser $1/tcp)
#     exe_port=$($isu ls -l /proc/$port_id/exe)
#     echo $exe_port

#     port_command=$($exe_port | awk -F'/' '{print $NF}')
#     echo "- whatis -"
#     whatis $port_command

# }

# Shell
sef() {
    export $(grep -v '^#' $1 | xargs -d '\n')
}

alias lst='ls --human-readable --size -1 -S --classify'

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

alias ды='ls'
alias св='св'
alias count='find . -type f | wc -l'

alias open="xdg-open"

lsp() { ls -l "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}'; }

# Python
alias pipver='pip freeze | grep'

# C++
g++r() {
    rm -f /tmp/out.a;g++ $1 -o /tmp/out.a; /tmp/out.a;
}
