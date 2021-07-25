# fonts-powerline
log_info 'Install fonts-powerline'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y fonts-powerline;

    fc-cache -vf

else
     log_critical "This system does not support!"
fi