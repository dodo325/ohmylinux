# zsh
log_info 'Install zsh'

# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

if [ "$(command -v zsh)" ]; then
    log_success "command \"zsh\" exists on system"
    _ZSH=1

elif [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "Use apt"

    $isu apt update -y

    $isu apt install -y zsh

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu apt-get update -y

    $isu apt-get install -y zsh

elif [[ " ${pms[@]} " =~ " brew " ]]; then
    log_info "Use brew"

    brew install zsh

elif [[ " ${pms[@]} " =~ " zypper " ]]; then
    log_info "Use zypper"

    zypper install zsh

elif [[ " ${pms[@]} " =~ " pacman " ]]; then
    log_info "Use zypper"

    pacman -S zsh

elif [[ " ${pms[@]} " =~ " xbps-install " ]]; then
    log_info "Use xbps-install"

    xbps-install -S zsh

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use DNF"

    dnf install zsh

elif [[ "$distro" = "OpenBSD" ]]; then
    log_info "Use pkg_add"

    pkg_add zsh

elif [[ "$distro" = "FreeBSD" ]]; then
    log_info "Use pkg"

    pkg install zsh

    cd /usr/ports/shells/zsh/ && make install clean

    make config

elif [[ " ${pms[@]} " =~ " yum " ]]; then
    log_info "Use yum"

    $isu yum update && $isu yum -y install zsh

elif [[ " ${pms[@]} " =~ " yum " ]]; then
    log_info "Use eopkg (Solus)"

    eopkg it zsh

elif [[ " ${pms[@]} " =~ " emerge " ]]; then
    log_info "Use emerge "

    emerge app-shells/zsh
    
elif [[ " ${pms[@]} " =~ " apk " ]]; then
    log_info "Use emerge "

    $isu apk add zsh

else
     log_critical "This system does not support!"
fi

if [[ -z $_ZSH ]]; then
    chsh -s $(which zsh)
fi
