#sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

ZSH_THEME="psona"
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# aliases
source $HOME/.zshalias

# functions
source $HOME/.zshfunc

# DISABLE_UPDATE_PROMPT=false
# notify of bg job completion immediately
set -o notify

# no mail checking
unset MAILCHECK

#disable core dumps
ulimit -S -c 0

#default umask
umask 0022

# ignore backups, CVS directories, python bytecode, vim swap files
FIGNORE="~:CVS:#:.pyc:.swp:.swa:apache-solr-*"

# PROMPT COLORS
autoload -U colors

setopt prompt_subst
export KEYTIMEOUT=1

# UNCOMMENT FOLLOWING LINE IF YOU WANT RED DOTS TO BE DISPLAYED WHILE WAITING FOR COMPLETION
COMPLETION_WAITING_DOTS="false"
CASE_SENSITIVE="true"

# GENERAL HISTORY RELATED STUFF
HISTFILE=~/.history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=5000
SAVEHIST=5000
setopt APPEND_HISTORY # don't overwrite history; append instead
setopt INC_APPEND_HISTORY # append after each command
setopt SHARE_HISTORY # share history between shells
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_VERIFY
setopt EXTENDED_HISTORY
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt MENUCOMPLETE
setopt NOMATCH
unsetopt HIST_EXPIRE_DUPS_FIRST

# zsh performance tweaks
# .. use a cache file
zstyle ':completion:*' use-cache on
# .. and then specify the cache file to use (not added to repo: separate file for each machine)
zstyle ':completion:*' cache-path $HOME/.zshcache

fpath=($HOME/.oh-my-zsh/custom/plugins/zsh-completions/src $fpath)

# WHICH PLUGINS WOULD YOU LIKE TO LOAD? (PLUGINS CAN BE FOUND IN ~/.OH-MY-ZSH/PLUGINS/*)
# CUSTOM PLUGINS MAY BE ADDED TO ~/.OH-MY-ZSH/CUSTOM/PLUGINS/
plugins=(
      brew
      brew-cask
      cloudapp
      composer
      common-aliases
      coffee
      colorize
      django
      docker
      dirhistory
      fabric
      git
      gem
      git-extras
      git-flow
      git-hubflow
      git-remote-branch
      gradle
      last-working-dir
      fasd
      heroku
      history
      mercurial
      node
      npm
      osx
      pep8
      pip
      pyenv
      pylint
      python
      rbenv
      redis-cli
      svn
      postgres
      ruby
      sbt
      scala
      ssh-agent
      sublime
      symfony2
      sudo
      terminalapp
      themes
      tmux
      vagrant
      virtualenv
      xcode
      history-substring-search
      zsh-syntax-highlighting
#      zsh-autosuggestions
      alias-tips
      vi-mode

)

#source $HOME/.zsh-autosuggestions/autosuggestions.zsh

# GRAB ALL FILES WITH THE ".zsh" EXT
for config_file ($HOME/.dotfiles/functions/*.zsh); do
  source $config_file
done

# VI MODE
bindkey -v
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

###-tns-completion-start-###
if [ -f /Users/regiellis/.tnsrc ]; then
    source /Users/regiellis/.tnsrc
fi
###-tns-completion-end-###
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###
