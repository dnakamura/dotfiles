# Color output (--color), add file type indication (-F),  print sizes in human redable form (-h)
alias ls='ls -Fh --color'

grep-flag-available(){
	echo | grep $1 "" > /dev/null 2>&1
}
GREP_FLAGS=""
if grep-flag-available --color=auto; then
	GREP_FLAGS+=" --color=auto"
fi

# Color grep output
alias grep="grep $GREP_FLAGS"
unset GREP_FLAGS
