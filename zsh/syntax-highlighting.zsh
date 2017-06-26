source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
ZSH_HIGHLIGHT_STYLES[command]="fg=$BASE0D"
ZSH_HIGHLIGHT_STYLES[alias]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[function]=$ZSH_HIGHLIGHT_STYLES[command]
ZSH_HIGHLIGHT_STYLES[builtin]=$ZSH_HIGHLIGHT_STYLES[command]

ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=$BASE08,bold"
ZSH_HIGHLIGHT_STYLES[path]="fg=$BASE09,underline"
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]="fg=$BASE0C"
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]="fg=$BASE0C"
ZSH_HIGHLIGHT_STYLES[comment]="fg=$BASE03"
ZSH_HIGHLIGHT_STYLES[reserved-word]="fg=$BASE0E"
