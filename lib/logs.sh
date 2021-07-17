#!/bin/bash
 
# TODO: logo!

_e="\e[0m"
_r="\e[1;49;91m"
_o="\e[1;49;93m"
_g="\e[1;49;32m"
_p="\e[0;49;95m"

_lb="\e[0;40;36m"
_lg="\e[1;40;92m"
_ly="\e[1;40;93m"
_lr="\e[1;40;91m"
_ld="\e[1;40m"
# _time=$(date +"%T.%3N")

function _ti(){ # FIXME: не работает!
    echo $(date +"%T.%3N")
}

log_info()    { echo -e "$_lb($(date +"%T.%3N"))[INFO] $@ $_e"; }
log_success() { echo -e "$_lg($(date +"%T.%3N"))[ OK ] $@ $_e"; }
log_warning() { echo -e "$_ly($(date +"%T.%3N"))[WARN] $@ $_e"; }
log_debug()   { echo -e "$_ld($(date +"%T.%3N"))[    ] $@ $_e"; }
log_error()   { echo -e "$_lr($(date +"%T.%3N"))[FAIL] $@ $_e"; }

main() {                               # skip
    log_info "info"                    # skip
    log_success "success"              # skip
    log_warning "warning"              # skip
    log_debug "debug"                  # skip
    log_error "error"                  # skip
}                                      # skip
if [ "${1}" != "--source-only" ]; then # skip
    main "${@}"                        # skip
fi                                     # skip
