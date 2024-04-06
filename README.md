# Introduction

This repository contains all of my common dotfiles configuration used used for my development setup. 

There is a special way to clone this repository in your $HOME folder using aliases to store the .git folder in the `~/dotfiles/` path described in the `Install` section.

Following this you can use the `config` alias as a git command for your dotfiles status and commit to this repo.

## Install

Clone this repository into your `~` folder using the following steps

```shell
echo "dotfiles" >> .gitignore
git clone https://github.com/sam9291/dotfiles $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/.git --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
git init --bare $HOME/dotfiles
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.profile
config config --local status.showUntrackedFiles no
```

_Note: You may need to update this script for the alias if you are using zsh_
