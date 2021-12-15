log_info 'Install bash-aliases'

mv aliases.sh ~/.bash_aliases

if [ -f ~/.zshrc ]; then
  log_info "Detect .zshrc"
  if grep -Fxq "bash_aliases" ~/.zshrc; then
    log_success "Already patched .zshrc"
  else
    echo "if [ -f ~/.bash_aliases ]; then" >> ~/.zshrc
    echo "    . ~/.bash_aliases" >> ~/.zshrc
    echo "fi" >> ~/.zshrc
    log_success "Patched .zshrc"
  fi
fi
