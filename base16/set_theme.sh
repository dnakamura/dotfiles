#!/bin/sh
# Stuff for Base16 colors etc
# TODO at the moment this is designed arround my PuTTY config. Should tune
# by using various xterm 256 colors and/or redefining color pairs

BASE16_DIR=$(dirname $(readlink -f $0))
num_colors="$(tput colors)"

if [ ! -f "$BASE16_DIR/themes/$1" ]; then
	echo "Error: could not find theme '$1' in '$BASE16_DIR/themes' "
#	return 1
fi
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
#load_base16_theme(){
	hex_to_tput(){
		echo $(((0x$1)*1000/255))
	}

	set_background(){
		if [ "${TERM%%-*}" = "putty" ]; then
			printf "\033[%d=G" $1
		else
			#TODO figure out this control code
			echo "ERR term ${TERM%%-*}"
		fi
	}

	set_foreground(){
		if [ "${TERM%%-*}" = "putty" ]; then
			printf  "\033[%d=F" $1
		else
			#TODO figure out this control code
			echo "ERR term ${TERM%%-*}"
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

		if [ "${TERM%%-*}" = "putty" ]; then
			if [ "$1" = "BASE05" ]; then
				#foreground
				tput initc 16 $(hex_to_tput $2) $(hex_to_tput $3) $(hex_to_tput $4)}
				tput initc 17 $(hex_to_tput $2) $(hex_to_tput $3) $(hex_to_tput $4)}
			elif [ "$1" = "BASE00" ]; then
				#foreground
				tput initc 18 $(hex_to_tput $2) $(hex_to_tput $3) $(hex_to_tput $4)}
				tput initc 19 $(hex_to_tput $2) $(hex_to_tput $3) $(hex_to_tput $4)}
			fi
		fi
	}
	#set_foreground $BASE05
	#set_background $BASE00

	. "$BASE16_DIR/themes/$1"
	
	#unset -f set_background
	#unset -f set_foreground
	#unset -f hex_to_tput
	#unset -f define_base16
#}
