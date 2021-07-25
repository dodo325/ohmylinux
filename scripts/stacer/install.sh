# stacer
log_info 'Install stacer'


if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update;

    $isu apt install stacer -y;

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu add-apt-repository ppa:oguzhaninan/stacer -y
    $isu apt-get update
    $isu apt-get install stacer -y

    $isu add-apt-repository --remove ppa:oguzhaninan/stacer -y
    $isu apt-get update

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use dnf"

    $isu dnf install stacer

else
     log_critical "This system does not support!"
fi