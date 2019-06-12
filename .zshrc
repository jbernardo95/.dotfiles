# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH Theme
ZSH_THEME="kolo"

# Auto update zsh every 7 days
export UPDATE_ZSH_DAYS=7

# ZSH Plugins
plugins=(bundler compleat docker gem git node npm rails redis-cli tmux vagrant yarn)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/etc/profile.d/z.sh
source ~/.fzf.zsh

# Aliases
alias cp='cp -iv'
alias rm='rm -iv'
alias mv='mv -iv'
alias cdb='cd ../'
alias ta='tmux attach'
alias td='tmux detach'
alias tk='tmux kill-session'
alias battery='pmset -g batt | grep "%" | awk "{print \$3}" | sed s/\;//g'

# ENV Vars 
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'
export LANG=en_GB.UTF-8
export TERM='xterm-256color' # 256 Colors
export GPG_TTY=$(tty)

# brew config
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# rbenv
# This must be set after PATH is set because it overrides it
eval "$(rbenv init -)"

# Custom functions
function cdd() {
  mkdir -p "$1"
  cd -P "$1"
}

function update() {
  brew upgrade
  brew cleanup 

  upgrade_oh_my_zsh

  tldr --update
}

function encrypt-file() {
  if [[ -z $1 ]]; then
    echo "Usage: encrypt <file-to-encrypt>"
    return 1
  fi

  gpg --output $1.encrypted --symmetric $1

  if [[ $? -eq 0 ]]; then
    echo "File encrypted"
  fi
}

function decrypt-file() {
  if [[ -z $1 ]]; then
    echo "Usage: decrypt <file-to-decrypt>"
    return 1
  fi

  if [[ ! $1 =~ ".*\.encrypted" ]]; then
    echo "File to decrypt must end in .encrypted"
    return 1
  fi

  gpg --output ${1:0:-10} --decrypt $1

  if [[ $? -eq 0 ]]; then
    echo "File decrypted"
  fi
}

function sync-folders() {
  if [[ ! -d $1 ]] || [[ ! -d $2 ]]; then
    echo "Usage: <source> <destination>"
    return 1
  fi

  rsync -arzP --delete $1 $2

  if [[ $? -eq 0 ]]; then
    echo "$2 is in sync with $1"
  fi
}

function start-local-postgres() {
  if [[ -z $1 ]]; then
    echo "Usage: start-local-postgresql-instance <instance-name>"
    return 1
  fi

  docker run --rm \
             --name $1 \
             -e POSTGRES_PASSWORD= \
             -p 5432:5432 \
             -v $PWD/.data/postgres:/var/lib/postgresql/data \
             postgres
}
