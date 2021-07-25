#!/bin/bash

DEBUG=${DEBUG:-false}

_e="\e[0m"
_r="\e[1;49;91m"
_o="\e[1;49;93m"
_b="\e[1;49;36m"
_g="\e[1;49;32m"
_p="\e[0;49;95m"

_lb="\e[0;40;36m"
_lg="\e[1;40;92m"
_ly="\e[1;40;93m"
_lr="\e[1;40;91m"
_ld="\e[1;40m"

print_logo() {
    echo -e ""
    echo -e "$_r ▒█████  $_e$_b ██░ ██   $_e$_r  ███▄ ▄███▓▒$_e$_g██   ██▓  $_e$_r  ██▓    $_e$_b ██▓ ███▄    █  █    ██ ▒██   ██▒$_e$_r ▐██▌ $_e"
    echo -e "$_r▒██▒  ██▒$_e$_b▓██░ ██▒  $_e$_r ▓██▒▀█▀ ██▒ $_e$_g▒██  ██▒  $_e$_r ▒██▒    $_e$_b▓██▒ ██ ▀█   █  ██  ▓██▒▒▒ █ █ ▒░$_e$_r ▐██▌ $_e"
    echo -e "$_r▒██░  ██▒$_e$_b▒██▀▀██░  $_e$_r ▓██    ▓██░ $_e$_g ▒██ ██░  $_e$_r ▓██░    $_e$_b▒██▒▓██  ▀█ ██▒▓██  ▒██░░░  █   ░$_e$_r ▐██▌ $_e"
    echo -e "$_r▒██   ██░$_e$_b░▓█ ░██   $_e$_r ▒██    ▒██  $_e$_g ░ ▐██▓░  $_e$_r ▒██░    $_e$_b░██░▓██▒  ▐▌██▒▓▓█  ░██░ ░ █ █ ▒ $_e$_r ▓██▒ $_e"
    echo -e "$_r░ ████▓▒░$_e$_b░▓█▒░██▓  $_e$_r ▒██▒   ░██▒ $_e$_g ░ ██▒▓░  $_e$_r ░██████▒$_e$_b░██░▒██░   ▓██░▒▒█████▓ ▒██▒ ▒██▒$_e$_r ▒▄▄  $_e"
    echo -e "$_r░ ▒░▒░▒░ $_e$_b ▒ ░░▒░▒  $_e$_r ░ ▒░   ░  ░ $_e$_g  ██▒▒▒   $_e$_r ░ ▒░▓  ░$_e$_b░▓  ░ ▒░   ▒ ▒ ░▒▓▒ ▒ ▒ ▒▒ ░ ░▓ ░$_e$_r ░▀▀▒ $_e"
    echo -e "$_r  ░ ▒ ▒░ $_e$_b ▒ ░▒░ ░  $_e$_r ░  ░      ░ $_e$_g▓██ ░▒░   $_e$_r ░ ░ ▒  ░$_e$_b ▒ ░░ ░░   ░ ▒░░░▒░ ░ ░ ░░   ░▒ ░$_e$_r ░  ░ $_e"
    echo -e "$_r░ ░ ░ ▒  $_e$_b ░  ░░ ░  $_e$_r ░      ░    $_e$_g▒ ▒ ░░    $_e$_r   ░ ░   $_e$_b ▒ ░   ░   ░ ░  ░░░ ░ ░  ░    ░  $_e$_r    ░ $_e"
    echo -e "$_r    ░ ░  $_e$_b ░  ░  ░  $_e$_r        ░    $_e$_g░ ░       $_e$_r     ░  ░$_e$_b ░           ░    ░      ░    ░  $_e$_r ░    $_e"
    echo -e "$_r         $_e$_b          $_e$_r             $_e$_g░ ░       $_e$_r         $_e$_b                                 $_e$_r      $_e"
}

_time()       { echo $(date +"%T.%3N"); }

log_info()    { echo -e "$_lb($(_time))[INFO] $@ $_e"; }
log_success() { echo -e "$_lg($(_time))[ OK ] $@ $_e"; }
log_warning() { echo -e "$_ly($(_time))[WARN] $@ $_e"; }
log_debug()   { if [ "$DEBUG" = true ]; then echo -e "$_ld($(_time))[    ] $@ $_e"; fi;}
log_error()   { echo -e "$_lr($(_time))[FAIL] $@ $_e"; }

main() {                               # skip
    print_logo                         # skip
    log_info    "info"                 # skip
    log_success "success"              # skip
    log_warning "warning"              # skip
    log_debug   "debug"                # skip
    log_error   "error"                # skip
}                                      # skip
if [ "${1}" != "--source-only" ]; then # skip
    main "${@}"                        # skip
fi                                     # skip
