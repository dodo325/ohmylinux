# Discord
log_info 'Install Discord'


if [[ " ${pms[@]} " =~ " snap " ]]; then
    log_info "use snap"

    $isu snap install discord

elif [[ " ${pms[@]}" =~ " apt " ]]; then
    log_info "use apt"

    if [ "$(command -v wget)" ]; then
        echo "command \"wget\" exists on system"

        wget https://discord.com/api/download?platform=linux&format=deb -O discord.deb

        $isu apt install ./discord.deb -y

        rm ./discord.deb

    else
        log_critical "This system does not support!"
    fi

else
     log_critical "This system does not support!"
fi
