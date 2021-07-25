# DBeaver
log_info 'Install DBeaver'


if [[ " ${pms[@]} " =~ " snap " ]]; then
    log_info "use snap"

    $isu snap install dbeaver-ce

else
     log_critical "This system does not support!"
fi
