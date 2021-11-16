# docker-compose
log_info 'Install docker-compose'

# TODO:
# For alpine, the following dependency packages are needed: py-pip, python3-dev, libffi-dev, openssl-dev, gcc, libc-dev, rust, cargo and make.


if [ "$(command -v docker-compose)" ]; then
    log_success "command \"docker-compose\" exists on system"
else
  log_info "Download binary"
  $isu curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  log_info "Apply executable permissions to the binary"
  $isu chmod +x /usr/local/bin/docker-compose

  $isu ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi

/usr/local/bin/docker-compose --version
log_success 'Install docker-compose successed!'
