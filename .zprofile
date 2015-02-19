# PROFILE ZSH - PERSONA IO JAN 2015
# aliases
source $HOME/.zshalias
# functions
source $HOME/.zshfunc
 
source $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/etc/profile.d/autojump.sh
fpath=($HOME/.oh-my-zsh/custom/plugins/zsh-completions/src $fpath)
source $HOME/.zsh-autosuggestions/autosuggestions.zsh

ZSH_THEME="psona"
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
