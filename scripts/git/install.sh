# git
log_info 'Install git'


if [ "$(command -v git)" ]; then
    log_success "command \"git\" exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y git

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y git

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -Sy git
else
     log_critical "This system does not support!"
fi
