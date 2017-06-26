export ZDOTDIR=~/.dotfiles/zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/completions.zsh"
#zstyle :compinstall filename "$ZDOTDIR/.zshrc" 
source "$ZDOTDIR/base16.zsh"
source "$ZDOTDIR/prompt.zsh"


source "$ZDOTDIR/colored-man-pages.zsh"

source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
