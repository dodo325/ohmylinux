# Steam
log_info 'Install Steam'

if [ "$(command -v steam)" ]; then
    log_success "Command \"steam\" exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt install steam -y

else
     log_critical "This system does not support!"
fi
