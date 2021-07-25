# telegram
log_info 'Install telegram'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y telegram-desktop

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

    pacman -Sy telegram-desktop
else
     log_critical "This system does not support!"
fi
