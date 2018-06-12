#!/bin/zsh
source ~/.dotfiles/zsh/base16.zsh
source ~/.dotfiles/base16/init.sh

color_string(){
	echo -n "2;$((16#$1));$((16#$2));$((16#$3))m"
}
set_fg(){
	echo -n "\x1b[38;$(color_string $1 $2 $3)"
}
set_bg(){
	echo -n "\x1b[48;$(color_string $1 $2 $3)"
}
define_base16(){
	if [[ "x$1" == "xBASE00" ]]; then
		CLEAR_BG=$(set_bg $2 $3 $4)
	fi
}
set-colorscheme $1

define_base16(){
	tput sgr 0
	tput setaf 15
	echo -n "${CLEAR_BG}$1 $(set_fg $2 $3 $4)$1 $(printf "%02x%02x%02x" $((16#$2)) $((16#$3)) $((16#$4)))   $(set_bg $2 $3 $4)        "
	echo "${CLEAR_BG}\x1b[K"
}
set-colorscheme $1
#tput setaf $BASE00; echo -n "BASE_00    " ; tput sgr 0; tput setab $BASE00; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE01; echo -n "BASE_01    " ; tput sgr 0; tput setab $BASE01; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE02; echo -n "BASE_02    " ; tput sgr 0; tput setab $BASE02; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE03; echo -n "BASE_03    " ; tput sgr 0; tput setab $BASE03; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE04; echo -n "BASE_04    " ; tput sgr 0; tput setab $BASE04; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE05; echo -n "BASE_05    " ; tput sgr 0; tput setab $BASE05; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE06; echo -n "BASE_06    " ; tput sgr 0; tput setab $BASE06; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE07; echo -n "BASE_07    " ; tput sgr 0; tput setab $BASE07; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE08; echo -n "BASE_08    " ; tput sgr 0; tput setab $BASE08; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE09; echo -n "BASE_09    " ; tput sgr 0; tput setab $BASE09; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE0A; echo -n "BASE_0A    " ; tput sgr 0; tput setab $BASE0A; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE0B; echo -n "BASE_0B    " ; tput sgr 0; tput setab $BASE0B; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE0C; echo -n "BASE_0C    " ; tput sgr 0; tput setab $BASE0C; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE0D; echo -n "BASE_0D    " ; tput sgr 0; tput setab $BASE0D; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE0E; echo -n "BASE_0E    " ; tput sgr 0; tput setab $BASE0E; echo -n "        "; tput setab $BASE00; echo
#tput setaf $BASE0F; echo -n "BASE_0F    " ; tput sgr 0; tput setab $BASE0F; echo -n "        "; tput setab $BASE00; echo

#set-colorscheme $old_theme
