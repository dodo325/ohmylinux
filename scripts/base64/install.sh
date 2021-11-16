# base64
log_info 'Install base64'


if [ "$(command -v base64)" ]; then
    log_success "command \"base64\" exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y coreutils

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y coreutils

elif [[ " ${pms[@]} " =~ " yum " ]]; then
    log_info "Use yum"

    yum install coreutils

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -Sy coreutils

elif [[ " ${pms[@]} " =~ " brew " ]]; then
    log_info "Use brew"

    brew install base64

else
     log_critical "This system does not support!"
fi
