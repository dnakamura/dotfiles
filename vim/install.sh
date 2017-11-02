#!/bin/sh
VIM_DOTFILES_DIR=$(dirname $(readlink -f -n $0))

. "$VIM_DOTFILES_DIR/../install_lib.sh"

dotfiles_install "$VIM_DOTFILES_DIR/vimrc" ~/.vimrc
dotfiles_install "$VIM_DOTFILES_DIR/vim" ~/.vim
