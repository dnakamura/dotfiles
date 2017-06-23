if [[ "$OSTYPE" = solaris* ]]
then
	if [[ ! -x "$HOME/bin/nroff" ]]
	then
		mkdir -p "$HOME/bin"
		cat > "$HOME/bin/nroff" <<EOF
#!/bin/sh
if [ -n "\$_NROFF_U" -a "\$1,\$2,\$3" = "-u0,-Tlp,-man" ]; then
	shift
	exec /usr/bin/nroff -u\$_NROFF_U "\$@"
fi
#-- Some other invocation of nroff
exec /usr/bin/nroff "\$@"
EOF
		chmod +x "$HOME/bin/nroff"
	fi
fi

man() {
	#LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	env \
		LESS_TERMCAP_md="$(tput bold; tput setaf 4)" \
		LESS_TERMCAP_me="$(tput sgr0)" \
		LESS_TERMCAP_se="$(tput sgr0)" \
		LESS_TERMCAP_ue="$(tput sgr0)" \
		LESS_TERMCAP_us="$(tput setaf 5; tput smul)" \
		PAGER="${commands[less]:-$PAGER}" \
		_NROFF_U=1 \
		PATH="$HOME/bin:$PATH" \
			man "$@"
}
