# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH Theme
ZSH_THEME="kolo"

# Auto update zsh every 7 days
export UPDATE_ZSH_DAYS=7

# ZSH Plugins
plugins=(compleat docker git tmux timer)

source $ZSH/oh-my-zsh.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.fzf.zsh
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
source <(kubectl completion zsh)

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

source /usr/local/opt/asdf/libexec/asdf.sh
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'
export LANG=en_GB.UTF-8
export TERM='xterm-256color' # 256 Colors
export GPG_TTY=$(tty)
export TIMER_FORMAT='%d'

# brew config
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Erlang/Elixir config
export ERL_AFLAGS="-kernel shell_history enabled"

# Custom functions
function cdd() {
  mkdir -p "$1"
  cd -P "$1"
}

function update() {
  brew upgrade
  brew cleanup 

  omz update

  tldr --update

  gcloud components update

  asdf plugin update --all
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

  rsync -arzP --delete --delete-excluded --exclude='.Spotlight*' --exclude='.Trash*' --exclude='.TemporaryItems*' --exclude='.fseventsd' --exclude='.DS_Store' $1 $2

  if [[ $? -eq 0 ]]; then
    echo "$2 is in sync with $1"
  fi
}
