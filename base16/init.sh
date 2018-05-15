# This should be sourced in by zshrc

export BASE16_DIR="$(dirname $(readlink -f $0))"

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
	#$BASE16_DIR/set_theme.sh $theme_name
	source "$BASE16_DIR/themes/$theme_name"
}
