# vivaldi
log_info 'Install vivaldi'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' 
    wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add - 
    sudo apt update && sudo apt install vivaldi-stable -y

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use DNF"

    $isu dnf config-manager --add-repo https://repo.vivaldi.com/archive/vivaldi-fedora.repo

    $isu dnf install vivaldi-stable

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "Use ZYpp"

    sudo zypper ar https://repo.vivaldi.com/archive/vivaldi-suse.repo

    sudo zypper in vivaldi-stable

else
     log_critical "This system does not support!"
fi

