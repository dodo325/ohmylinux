# curl
log_info 'Install curl'


if [ "$(command -v curl)" ]; then
    log_success "command \"curl\" exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y curl

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y curl

elif [[ " ${pms[@]} " =~ " yum " ]]; then
    log_info "Use yum"

    yum install curl

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "Use zypper"

    zypper install curl

    zypper se curl

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -Sy curl
else
     log_critical "This system does not support!"
fi
