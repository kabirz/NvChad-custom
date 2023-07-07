# NvChad custom

## How to use

1. Install neovim (version need >= v0.9.1)

```shell
# ubuntu
sudo apt install neovim

# archlinux
sudo pacman -S neovim
```

2. Clone NvChad code and this. 

```shell
git clone https://github.com/kabirz/dotfiles ~/dotfiles --recursive
```

## help

lua print table

```lua
print(vim..inspect(opts))
```

## dependencies

python packages

```shell
pip3 install pylint cmakelang clang-format cmakelint python-lsp-server
```
