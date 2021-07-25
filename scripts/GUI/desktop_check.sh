log_info "Checking Desktop Environment"
if [ -z "$CURRENT_DESKTOP" ]
then
      log_critical "Not found GUI"
else
      log_success "Detect $CURRENT_DESKTOP"
fi