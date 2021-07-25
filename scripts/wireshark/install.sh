# wireshark
log_info 'Install wireshark'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update -y

    $isu apt install -y wireshark

    $isu dpkg-reconfigure wireshark-common


elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y wireshark

    $isu dpkg-reconfigure wireshark-common

else
     log_critical "This system does not support!"
fi

sudo adduser $USER wireshark

if [ "$(command -v newgrp)" ]; then
    log_debug "$ newgrp wireshark"
    newgrp wireshark
fi
