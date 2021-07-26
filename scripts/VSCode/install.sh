# VSCode
log_info 'Install VSCode'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install code # or code-insiders
    rm -f microsoft.gpg

    if [ "$de" = "Plasma" ]; then
        sudo apt install gnome-keyring
    fi
else
     log_critical "This system does not support!"
fi
