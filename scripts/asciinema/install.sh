# asciinema
log_info 'Install asciinema'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y asciinema

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -S asciinema

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use dnf"

    $isu dnf install asciinema


elif [[ " ${pms[@]} " =~ " emerge " ]]; then
    log_info "Use emerge"

    emerge -av asciinema

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "Use zypper"

    zypper in asciinema

elif [[ " ${pms[@]} " =~ " brew " ]]; then
    log_info "Use brew"

    brew install asciinema

elif [[ " ${pms[@]} " =~ " pip3 " ]]; then
    log_info "Use pip3"

    $isu pip3 install asciinema

else
     log_critical "This system does not support!"
fi
