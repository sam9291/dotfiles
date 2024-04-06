# Introduction

This repository contains all of my common dotfiles configuration used used for my development setup. 

There is a special way to clone this repository in your $HOME folder using aliases to store the .git folder in the `~/dotfiles/` path described in the `Install` section.

Following this you can use the `config` alias as a git command for your dotfiles status and commit to this repo.

## Install

Clone this repository into your `~` folder using the following steps

```shell
echo "dotfiles" >> .gitignore
git clone --bare git@github.com:sam9291/dotfiles.git $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.profile
```

_Note: You may need to update this script for the alias if you are using zsh_

## Plugin config instructions

### tmux plugin manager

To get the configuration working for tmux, follow these steps:

1. Clone the tmux plugin manager repo
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

2. Open a tmux session, then use `<C-a>I` to trigger the tmux plugin install
