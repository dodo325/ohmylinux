# tmux
log_info 'Install tmux'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update -y

    $isu apt install -y tmux


elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y tmux

else
     log_critical "This system does not support!"
fi
