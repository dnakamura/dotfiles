# Stuff for Base16 colors etc
# TODO at the moment this is designed arround my PuTTY config. Should tune
# by using various xterm 256 colors and/or redefining color pairs

num_colors="$(tput colors)"

# Define the mapping from terminal color number to base16 color
if [ "$num_colors" -eq 256 ] ; then 
	# Default Background
	BASE00=0
	# Lighter Background (Used for status bars)
	BASE01=10
	# Selection Background
	BASE02=11
	# Comments, Invisibles, Line Highlighting
	BASE03=8
	# Dark Foreground (Used for status bars)
	BASE04=12
	# Default Foreground, Caret, Delimiters, Operators
	BASE05=7
	# Light Foreground (Not often used)
	BASE06=13
	# Light Background (Not often used)
	BASE07=15
	# Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	BASE08=1
	# Integers, Boolean, Constants, XML Attributes, Markup Link Url
	BASE09=9
	# Classes, Markup Bold, Search Text Background
	BASE0A=3
	# Strings, Inherited Class, Markup Code, Diff Inserted 
	BASE0B=2
	# Support, Regular Expressions, Escape Characters, Markup Quotes
	BASE0C=6
	# Functions, Methods, Attribute IDs, Headings
	BASE0D=4
	# Keywords, Storage, Selector, Markup Italic, Diff Changed
	BASE0E=5
	# Deprecated, Opening/Closing Embedded Language Tags e.g. <?php ?>
	BASE0F=14
else
	# Default Background
	BASE00=0
	# Lighter Background (Used for status bars)
	BASE01=10
	# Selection Background
	BASE02=11
	# Comments, Invisibles, Line Highlighting
	BASE03=8
	# Dark Foreground (Used for status bars)
	BASE04=12
	# Default Foreground, Caret, Delimiters, Operators
	BASE05=7
	# Light Foreground (Not often used)
	BASE06=13
	# Light Background (Not often used)
	BASE07=15
	# Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
	BASE08=1
	# Integers, Boolean, Constants, XML Attributes, Markup Link Url
	BASE09=9
	# Classes, Markup Bold, Search Text Background
	BASE0A=3
	# Strings, Inherited Class, Markup Code, Diff Inserted 
	BASE0B=2
	# Support, Regular Expressions, Escape Characters, Markup Quotes
	BASE0C=6
	# Functions, Methods, Attribute IDs, Headings
	BASE0D=4
	# Keywords, Storage, Selector, Markup Italic, Diff Changed
	BASE0E=5
	# Deprecated, Opening/Closing Embedded Language Tags e.g. <?php ?>
	BASE0F=14
	
fi

# Control mapping between console color number and Base16 color number

hex_to_tput(){
	echo $(((16#$1)*1000/255))
}

hex_to_dec(){
	echo $((16#$1))
}
set_background(){
	if [ "${TERM%%-*}" = "putty" ]; then
		echo -e "\e[$1=G"
	else
		#TODO figure out this control code
	fi
}

set_foreground(){
	if [ "${TERM%%-*}" = "putty" ]; then
		echo -e "\e[$1=F"
	else
		#TODO figure out this control code
	fi
}

# Params
# 1 - Base 16 color (eg BASE01)
# 2 - r (0-FF)
# 3 - g (0-FF)
# 4 - b (0-FF)
define_base16(){
	# TODO need to validate $1
	tput initc $(eval "echo \${$1}") $(hex_to_tput $2) $(hex_to_tput $3) $(hex_to_tput $4)
	prompt_def=$(printf "%%{\x1b[38;2;%d;%d;%dm%%}" $(hex_to_dec $2) $(hex_to_dec $3) $(hex_to_dec $4))
	#eval $1_TEST=$(printf "%%{\x1b[38;2;%d;%d;%dm%%}" $(hex_to_tput $2) $(hex_to_tput $3) $(hex_to_tput $4))

	def_name="$1_PROMPT"

	eval $def_name='$prompt_def'
	if [ "x$1" = "xBASE05" ] ; then
		#fore ground
		#echo foreground
	fi

	if [ "x$1" = "xBASE00" ]; then
		#background
		#iecho background
	fi
}

set_foreground $BASE05
set_background $BASE00
