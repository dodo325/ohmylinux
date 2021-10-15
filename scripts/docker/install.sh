# docker
log_info 'Install docker'

if [[ " ${pms[@]} " =~ " apt " ]]; then
    log_info "use apt"

    $isu apt update;

    $isu apt remove -y docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-selinux \
        docker-engine-selinux \
        docker-engine

elif [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "Use apt-get"

    $isu apt-get update
    $isu apt-get remove -y docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-selinux \
        docker-engine-selinux \
        docker-engine

elif [[ " ${pms[@]} " =~ " dnf " ]]; then
    log_info "Use dnf"

    $isu dnf remove -y docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-selinux \
        docker-engine-selinux \
        docker-engine

else
     log_warning "can't clean system!"
fi

log_info "Start get-docker.sh"
curl -fsSL https://get.docker.com -o get-docker.sh
$isu sh get-docker.sh;

rm get-docker.sh;

log_info "Starting Docker services"
$isu systemctl enable --now docker

log_info "Assign perms to correct user"
$isu groupadd docker # Adding new group
$isu usermod -aG docker $USER # Adding current user to the group
newgrp docker # Activate privileges

