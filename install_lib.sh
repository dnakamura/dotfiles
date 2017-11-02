# Common function for installing a file, with checks to see if it exists etc

#dotfiles_install(link_target, link_name)
dotfiles_install(){
	local link_name=$2
	local link_target=$1
	local link_type

	if [ -f "$link_target" ]; then
		link_type="file"
	elif [ -d "$link_target" ]; then
		link_type="dir"
	else
		echo "dotfiles_install(): The link target '$link_target' does not seem to exist"
		return 1
	fi

	local full_link_target=$(readlink -f -n $link_target)
	if [ -e "$link_name" ]; then
		# the place we want to install the link exists. Check if we have already installed it
		if [ -h "$link_name" ]; then
			if [ "$(readlink -f -n $link_name)" = "$full_link_target" ]; then
				# link_name already exists, but it points to link_target, so we are good
				return 0
			fi
		fi
		# link_name exists, and either isnt a symlink, or doesnt point to link_target
		echo "ERROR: could not install $(readlink -f -n $link_target) to $link_name."
		echo -e "\t$link_name already exists"
		return 2
	fi
	
	ln -s "$link_target" "$link_name"

	if [ $? -ne 0 ]; then
		echo "ERROR: could not install $(readlink -f -n $link_target) to $link_name."
		return 3
	fi
	return 0	
}
