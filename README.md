# nvim-from-scratch

Opinionated neovim IDE

## Install

### Backup current config

```sh
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### Clone and run new config

```sh
git clone https://github.com/PyDataBlog/nvim-from-scratch.git ~/.config/nvim
rm -rf ~/.config/nvim/.git
nvim
```
