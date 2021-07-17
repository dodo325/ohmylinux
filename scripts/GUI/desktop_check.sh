log_info "Checking Desktop Environment"
if [ -z "$CURRENT_DESKTOP" ]
then
      log_error "Not found GUI"
      exit
else
      log_success "Detect $CURRENT_DESKTOP"
fi