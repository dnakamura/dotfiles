#!/bin/sh
ZSH_DOTFILES_DIR=$(dirname $(realpath $0))

if [ -f ~/.zshrc ]; then
	if [ -h ~/.zshrc ]; then
		ZSHRC_PATH=$(readlink -f -n ~/.zshrc)
		if [ "$ZSHRC_PATH" -eq "$ZSH_DOTFILES_DIR/.zshrc" ]; then
			# Symlink already exists, and it good
			exit
		fi
	fi
	echo "~/.zshrc already exists. Please remove before running this script."
	exit -1
fi
ln -s ~/.zshrc $ZSH_DOTFILES_DIR/.zshrc

