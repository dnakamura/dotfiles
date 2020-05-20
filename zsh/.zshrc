export ZDOTDIR=~/.dotfiles/zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install


# Needed for bash on windows
umask 022

# disable ctrl-s flow control
stty -ixon

source "$ZDOTDIR/base16.zsh"
source ~/.dotfiles/base16/init.sh
fpath=( ~/.dotfiles/base16/zsh $fpath)

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/completions.zsh"
#zstyle :compinstall filename "$ZDOTDIR/.zshrc" 
source "$ZDOTDIR/prompt.zsh"
source "$ZDOTDIR/keyboard.zsh"


source "$ZDOTDIR/colored-man-pages.zsh"

source "$ZDOTDIR/syntax-highlighting.zsh"

compdef _set-colorscheme demo-colorscheme
