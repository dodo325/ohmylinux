# remmina
log_info 'Install Remmina (RDP & VNC viwer)'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    sudo apt-add-repository ppa:remmina-ppa-team/remmina-next -y
    sudo apt-get update
    sudo apt install -y remmina remmina-plugin-rdp remmina-plugin-secret

else
     log_critical "This system does not support!"
fi