# Tor Browser
log_info 'Install Tor Browser'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update

    $isu apt install torbrowser-launcher -y

else
     log_critical "This system does not support!"
fi
