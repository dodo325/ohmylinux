# whiptail
log_info "Install whiptail"

if [ "$(command -v whiptail)" ]; then
    log_success "command \"whiptail\" exists on system"
elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    # whatever you want to do when array contains value
    log_info "use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y whiptail

else
     log_critical "This system does not support!"
fi
