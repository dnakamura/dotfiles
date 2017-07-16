#!/bin/sh

TMUX_DOTFILES_DIR=$(dirname $(realpath $0))
if [ -f ~/.tmux.conf ]; then
	if [ -h ~/.tmux.conf ]; then
		TMUX_CONF_PATH = $(readlink -f -n ~/.tmux.conf)
		if [ "TMUX_CONF_PATH" -eq "$TMUX_DOTFILES_DIR/tmux.conf" ]; then
			# Symlink already exists and is good
			exit
		fi
	fi
	echo "~/.tmux.conf already exists. Please remove before installing"
	exit -1
fi
ln -s $TMUX_DOTFILES_DIR/tmux.conf ~/.tmux.conf

