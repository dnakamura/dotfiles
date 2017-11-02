#!/bin/sh

TMUX_DOTFILES_DIR=$(dirname $(readlink -f -n $0))
.  "${TMUX_DOTFILES_DIR}/../install_lib.sh"
dotfiles_install "${TMUX_DOTFILES_DIR}/tmux.conf" ~/.tmux.conf
