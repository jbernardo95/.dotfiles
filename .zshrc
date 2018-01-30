# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH Theme
# ZSH_THEME="philips"
# ZSH_THEME="bureau"
ZSH_THEME="kolo"

# Auto update zsh every 7 days
export UPDATE_ZSH_DAYS=7

# ZSH Plugins
plugins=(zsh-syntax-highlighting bundler compleat docker gem git httpie npm rails redis-cli vagrant yarn)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Alias
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cdb='cd ../'
alias du='du -cksh'
alias ta='tmux attach'
alias td='tmux detach'
alias tk='tmux kill-session'

# ENV Vars 
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # rvm
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'
export LANG=en_US.UTF-8
export TERM='xterm-256color' # 256 Colors
export GPG_TTY=$(tty)

# RVM 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# NVM 
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"

# Custom functions
function cdd() {
  mkdir -p "$1"
  cd -P "$1"
}

function weather() {
  curl -4 "http://wttr.in/$1"
}

function ip() {
  ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0       : " $2}'
  ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
  ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}

function unban_ip_hn() {
  ip=$(curl -s ipinfo.io/ip)
  http GET "http://news.ycombinator.com/unban?ip=$ip" -o /dev/null

  if [ $? = 0 ]; then
    echo "Done, $ip unbanned"
  else
    echo "Failed"
  fi
}

if [ $(uname) = "Darwin" ]; then
  alias battery='pmset -g batt | grep "%" | awk "{print \$3}" | sed s/\;//g'

  function update() {
    brew update
    brew upgrade
    brew cleanup 
    brew cask cleanup 
  }
fi
