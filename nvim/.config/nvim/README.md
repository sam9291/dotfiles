# Getting Started
Install C Compiler (needed for nvim-treesitter)

## On Ubuntu:
```
sudo apt install build-essential
```

Install the following dependencies:
- Node latest
- Typescript latest
- Dotnet core latest

Clone this repo to the following location:
```
~/.config/nvim
```

Install Neovim following the [official instructions](https://github.com/neovim/neovim/blob/master/INSTALL.md)

Add neovim to your profile path to allow opening it with `nvim`
```
PATH="$PATH:/opt/nvim-linux64/bin"
```
You're all set!

## On Windows:
Install `make` dependencies:
```
winget install ezwinports.make
```

Clone this repo to the following location:
```
~/AppData/Local/nvim
```
After opening for the first time we need to build the libfzf.dll.
Using powershell, navigate to `~/AppData/Local/nvim-data/lazy/telescope-fzf-native.nvim/` and run `make`.

You're all set! You can run this config of neovim on windows. (Note: it runs a bit faster on linux)

## Result:
![Result](./res/result.png)
