# Filelight
log_info 'Install Filelight'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt install filelight -y

elif [[ " ${pms[@]}" =~ " yum " ]]; then
    log_info "use yum"

    $isu yum install filelight

elif [[ " ${pms[@]}" =~ " dnf " ]]; then
    log_info "use dnf"

    $isu dnf install filelight

else
     log_critical "This system does not support!"
fi
