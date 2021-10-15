# Clementine
log_info 'Install Clementine'


if [[ " ${pms[@]} " =~ " apt-get " ]]; then
    log_info "use apt-get"

    $isu add-apt-repositorу ppa:me-davidsansome/clementine -y 

    $isu apt-get update 

    $isu apt-get install clementine -y 

else
     log_critical "This system does not support!"
fi
