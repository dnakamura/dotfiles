bind_tput() {
	[ -n "$(tput $1)" ] && bindkey "$(tput $1)" $2
}

bind_tput khome beginning-of-line
bind_tput kend  end-of-line

