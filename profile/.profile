# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# xmodmap ~/.Xmodmap

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/opt/nvim-linux64/bin" ]; then
  PATH="$PATH:/opt/nvim-linux64/bin"
fi

if [ -d "$HOME/.dotnet" ]; then
  PATH="$HOME/.dotnet:$PATH"
fi

if [ -d "$HOME/.dotnet/tools" ]; then
  PATH="$HOME/.dotnet/tools:$PATH"
fi

if [ -d "/usr/local/go/bin" ]; then
  PATH=$PATH:/usr/local/go/bin
fi

if [ -d "$HOME/go/bin" ]; then
  PATH=$PATH:$HOME/go/bin
fi

# Set default editor used by superfile (spf)
export EDITOR=code
export SAM_CLI_TELEMETRY=0
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=0
export DOTNET_ICU_VERSION_OVERRIDE=74.2-1ubuntu3.1
export CLR_ICU_VERSION_OVERRIDE=$DOTNET_ICU_VERSION_OVERRIDE

setxkbmap -layout 'us,ca' -option 'grp:alt_shift_toggle'

export -n SESSION_MANAGER
