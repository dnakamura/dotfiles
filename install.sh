#!/bin/sh

DOTFILES_DIR=$(dirname $(realpath $0))

install_component(){
	local component_name
	component_name=$(basename $1)
	if [ -e $1/install.sh ]; then
		echo "Installing $component_name"
		$1/install.sh
	else
		echo "No install script for $component_name, skipping"
	fi
}

find $DOTFILES_DIR -mindepth 1 -maxdepth 1 -type d \! -name .git| while read component; do install_component $component; done
