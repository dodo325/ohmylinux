# Anaconda
log_info 'Install Anaconda'

CONTREPO=https://repo.continuum.io/archive/
ANACONDAURL=$(wget -q -O - $CONTREPO index.html | grep "Anaconda3-" | grep "Linux" | grep "86_64" | head -n 1 | cut -d \" -f 2)
wget -O anaconda.sh $CONTREPO$ANACONDAURL
chmod +x anaconda.sh
./anaconda.sh

log_success "Anaconda installed!"
rm anaconda.sh
