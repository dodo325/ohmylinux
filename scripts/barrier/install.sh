# barrier
log_info 'Install barrier'

if [ "$(command -v barrier)" ]; then
    log_success "command \"barrier\" exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y barrier

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -S barrier

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use dnf"

    $isu dnf install barrier


elif [[ " ${pms[@]} " =~ " emerge " ]]; then
    log_info "Use emerge"

    emerge -av barrier

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "Use zypper"

    zypper in barrier

elif [[ " ${pms[@]} " =~ " brew " ]]; then
    log_info "Use brew"

    brew install barrier

elif [[ " ${pms[@]} " =~ " pip3 " ]]; then
    log_info "Use pip3"

    $isu pip3 install barrier

else
     log_critical "This system does not support!"
fi
