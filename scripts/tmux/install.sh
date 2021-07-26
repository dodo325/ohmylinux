# tmux
log_info 'Install tmux'

if [ "$(command -v tmux)" ]; then
    log_success "Command \"tmux\" exists on system"

elif [[ " ${pms[@]} " =~ " apt " ]]; then
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

log_info "Move .tmux.conf to $HOME/"
mv .tmux.conf $HOME/.tmux.conf
