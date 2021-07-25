# qBittorrent
log_info 'Install qBittorrent'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update -y

    $isu apt install -y qbittorrent


elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y qbittorrent

else
     log_critical "This system does not support!"
fi
