#!/bin/sh
ZSH_DOTFILES_DIR=$(dirname $(readlink -f -n $0))
. "$ZSH_DOTFILES_DIR/../install_lib.sh"

dotfiles_install "$ZSH_DOTFILES_DIR/zshrc" ~/.zshrc
