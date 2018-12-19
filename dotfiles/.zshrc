# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

plugins=(git bundler rake ruby tmux cabal jsontools node npm python vi-mode dotenv autoenv)

export PATH=$HOME/.local/bin:$HOME/bin:$PATH
export EDITOR=vim
export BUNDLE_EDITOR=vim

# START vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey '^P' up-history
bindkey '^N' down-history
# END vi mode

source $ZSH/oh-my-zsh.sh

export ECTO_EDITOR="vim"
alias vi="vim"
alias nv="nvim"
export PIP_REQUIRE_VIRTUALENV=true
export PYTHONSTARTUP=~/.pythonrc
#alias vpnon="~/tools/vpn-on.sh"
#alias vpnoff="~/tools/vpn-off.sh"
gpip(){
   PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
#[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"
#alias stack="/usr/local/Cellar/haskell-stack/1.6.3/bin/stack"
#export PATH="/usr/local/sbin:$PATH"
#export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH=${HOME}/go/bin:$PATH
alias wireshark="open /usr/local/Cellar/wireshark/2.6.2/Wireshark.app"
alias onehundred_biggest_files="du -ah . | grep -v "/$"| sort -rh | head -100"
