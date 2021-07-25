log_info "Checking Desktop Environment"
if [ -z "$de" ]
then
      log_critical "Not found GUI"
else
      log_success "Detect DE: $de"
fi
