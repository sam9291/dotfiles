#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export PATH=$HOME/.dotnet/tools:$PATH
export PATH=$HOME/.dotnet/:$PATH
export DPRINT_INSTALL="/home/sampoi/.dprint"
export PATH="$DPRINT_INSTALL/bin:$PATH"
export PATH="/opt/Archi/:$PATH"
export DOTNET_USE_POLLING_FILE_WATCHER=1
export DOTNET_ROOT=$HOME/.dotnet/

alias v='nvim'
alias t='tmux'
alias k='kubectl'
alias g='git'

if [ -f "/usr/share/fzf/key-bindings.bash" ]; then
  source /usr/share/fzf/key-bindings.bash
fi

if [ -f "/usr/share/fzf/completion.bash" ]; then
  source /usr/share/fzf/completion.bash
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Set default vagrant provider virtual box
export VAGRANT_DEFAULT_PROVIDER=virtualbox
