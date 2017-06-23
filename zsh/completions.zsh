autoload -U compinit && compinit

# Change tab key binding
# ie no longer bound to expand-or-complete
bindkey '\C-i' complete-word
# Now add the expand completer to get the same effect
zstyle ':completion:::::' completer _expand _complete _ignored

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=3
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:messages' format %d
zstyle ':completion:*:warnings' format 'No matches: %d'
#Base0D
zstyle ':completion:*:descriptions' format '%B%F{4}%d%f%b'
zstyle ':completion:*' group-name ''

# Make lower case characters equivilent to upper case
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

