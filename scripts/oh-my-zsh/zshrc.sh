# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
plugins=(
  git
  debian
  django
  cp
  pip
  python
  pep8
  pyenv
  pylint
  sudo
  docker
  docker-compose
  alias-finder
  git-auto-fetch
  vscode
  pylint
  virtualenv
  ubuntu
  themes
  history
  zsh-syntax-highlighting
  web-search
  tmux
  urltools
  command-not-found
)
apt_pref='apt'

ZSH_TMUX_AUTOSTART=false

GIT_AUTO_FETCH_INTERVAL=1200 #in seconds

# Aliases:

alias open="xdg-open"

lsp() { ls -l "$@" | awk '{k=0;for(i=0;i<=8;i++)k+=((substr($1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(" %0o ",k);print}'; }
alias lst='ls --human-readable --size -1 -S --classify'
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias count='find . -type f | wc -l'
alias left='ls -t -1'

sef() {
    export $(grep -v '^#' $1 | xargs -d '\n')
}

# Aliases: Net

alias locip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias myip='curl ipinfo.io/ip'
alias lsip='arp'

killport() { sudo lsof -t -i tcp:"$1" | xargs kill -9 ; }
alias lsports='sudo lsof -i -P -n'
alias mst='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'


# ru
alias ды='ls'
alias св='св'

# Conda
alias ced='conda activate django3' # conda env django
alias dea='conda deactivate'
alias pipver='pip freeze | grep'

# C++
g++r() {
    rm -f /tmp/out.a;g++ $1 -o /tmp/out.a; /tmp/out.a;
}


# logkeys:
#alias kg='sudo ps -aux | grep "logkeys"'
#alias kgon='sudo logkeys --start --output /home/dodo/.oh-my-zsh/log/klogger.log' #TODO: fix keymaps with https://github.com/kernc/logkeys/blob/master/docs/Keymaps.md
#alias kgoff='sudo logkeys --kill'
#alias kgt='tail --follow /home/dodo/.oh-my-zsh/log/klogger.log'

mysort() {
   mkdir -p pdf; mv *.pdf pdf/;
   mkdir -p torrent; mv *.torrent torrent/;
   
   mkdir -p doc; 
   mv *.doc doc/;
   mv *.docx doc/;
   mv *.ppsx doc/;
   mv *.xlsx doc/;

   mkdir -p video; 
   mv *.avi video/;
   
   

   mkdir -p img; 
   mv *.png img/;
   mv *.jpg img/;
   mv *.svg img/; 
   mv *.kra img/; 


   mkdir -p programs; 
   mv *.exe programs/;
   mv *.deb  programs/;
   mv *.sh  programs/;


   mkdir -p zip; 
   mv *.zip zip/;
   mv *.7z zip/;
   mv *.rar zip/;
   mv *.bz2 zip/;


   mkdir -p music; mv *.mp3 music/;
   
   rm *.crdownload;
   rm Thumbs.db*;
   rm *~;
   find . -empty -type d -delete;

}
