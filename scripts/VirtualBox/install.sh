# VirtualBox
log_info 'Install VirtualBox'

install_Extension_Pack() {
    log_info 'Installing VirtualBox Extension Pack'
    local vb_ver=$(vboxmanage --version | grep -oP "[\d|\.]+(?=_)")
    local last_url=https://download.virtualbox.org/virtualbox/$vb_ver/Oracle_VM_VirtualBox_Extension_Pack-$vb_ver.vbox-extpack
    local _file_name=$(basename $last_url)

    curl $last_url --output $_file_name

    VBoxManage extpack install $_file_name

    rm -f $_file_name
}

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y virtualbox

    $isu usermod -a -G vboxusers "$(whoami)"

    install_Extension_Pack

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use pacman"

# https://wiki.archlinux.org/title/VirtualBox_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
    pacman -Sy virtualbox

    install_Extension_Pack
else
     log_critical "This system does not support!"
fi
