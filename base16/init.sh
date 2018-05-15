# This should be sourced in by zshrc

export BASE16_DIR="$(dirname $(readlink -f $0))"

if [[ $TERM == putty* ]] ; then
	BASE01_PROMPT=
	$BASE16_DIR/set_theme.sh $theme_name
fi
set-colorscheme() {
	theme_name=$1
	if [ !  -f $BASE16_DIR/themes/$1 ]; then
		# literal theme does not exist. check for base16-<name>
		theme_name="base16-${theme_name#base16-}"
		if [ ! -f "$BASE16_DIR/themes/$theme_name" ]; then
			echo "ERROR: could not find color scheme '$1' in '$BASE16_DIR'"
			return 1
		fi
	fi

	export BASE16_THEME=$theme_name
	# putty doesnt like our new way of doing things
	if [[ $TERM == putty* ]] ; then
		$BASE16_DIR/set_theme.sh $theme_name
		BASE00_PROMPT="%F{$BASE00}"
		BASE01_PROMPT="%F{$BASE01}"
		BASE02_PROMPT="%F{$BASE02}"
		BASE03_PROMPT="%F{$BASE03}"
		BASE04_PROMPT="%F{$BASE04}"
		BASE05_PROMPT="%F{$BASE05}"
		BASE06_PROMPT="%F{$BASE06}"
		BASE07_PROMPT="%F{$BASE07}"
		BASE08_PROMPT="%F{$BASE08}"
		BASE09_PROMPT="%F{$BASE09}"
		BASE0A_PROMPT="%F{$BASE0A}"
		BASE0B_PROMPT="%F{$BASE0B}"
		BASE0C_PROMPT="%F{$BASE0C}"
		BASE0D_PROMPT="%F{$BASE0D}"
		BASE0E_PROMPT="%F{$BASE0E}"
		BASE0F_PROMPT="%F{$BASE0F}"
	else
		source "$BASE16_DIR/themes/$theme_name"
	fi
}
