# vivaldi
log_info 'Install vivaldi'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main' 
    wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add - 
    sudo apt update && sudo apt install vivaldi-stable -y

else
     log_critical "This system does not support!"
fi

