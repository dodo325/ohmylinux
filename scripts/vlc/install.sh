log_info 'Install vlc'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update -y

    $isu apt install -y vlc


elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y vlc

else
     log_critical "This system does not support!"
fi

# sudo apt install -y vlc 