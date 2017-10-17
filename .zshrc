export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="michelebologna"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias dotgit='/usr/bin/git --git-dir=$HOME/src/dotfiles --work-tree=$HOME'
