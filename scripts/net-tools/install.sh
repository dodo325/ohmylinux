# net-tools
log_info 'Install net-tools'


if [ "$(command -v ifconfig)" ]; then
    log_success "net-tools exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y net-tools

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y net-tools

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -Sy netstat-nat

elif [[ " ${pms[@]} " =~ " emerge " ]]; then
    log_info "Use emerge"

    emerge sys-apps/net-tools

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use dnf"

    dnf install net-tools

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "Use zypper"

    zypper install net-tools

else
     log_critical "This system does not support!"
fi
