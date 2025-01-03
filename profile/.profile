# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

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

if [ -d "$HOME/.dotnet/tools" ]; then
  PATH="$HOME/.dotnet/tools:$PATH"
fi

if [ -d "/usr/local/go/bin" ]; then
  PATH=$PATH:/usr/local/go/bin
fi


# xmodmap -e "keycode 64 = Mode_switch" # set Alt_l as the "Mode_switch"
# xmodmap -e "keycode 43 = h H Left H"  # h
# xmodmap -e "keycode 44 = j J Down J"  # j
# xmodmap -e "keycode 45 = k K Up K"    # k
# xmodmap -e "keycode 46 = l L Right L" # l
