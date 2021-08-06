# Krita
log_info 'Install Krita'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt install krita krita-l10n -y

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "use pacman"

    # sudo nano /etc/pacman.conf
    # sudo pacman -Syyu
    # sudo pacman -S krita

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "use dnf"

    $isu dnf install krita -y

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "use zypper"

    $isu zypper install krita

else
     log_critical "This system does not support!"
fi
