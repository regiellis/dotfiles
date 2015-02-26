# BASE ZSH - PERSONA IO JAN 2015
sudo -v

# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# JUMP RIGHT INTO TMUX
if [ -z "$TMUX" ]; then
    base_session='PSONA'
    # Create a new session if it doesn't exist
    tmux has-session -t $base_session || tmux new-session -d -s $base_session
    # Are there any clients connected already?
    client_cnt=$(tmux list-clients | wc -l)
    if [ $client_cnt -ge 1 ]; then
        session_name=$base_session"-"$client_cnt
        tmux new-session -d -t $base_session -s $session_name
        tmux -2 attach-session -t $session_name \; set-option destroy-unattached
    else
        tmux -2 attach-session -t $base_session
    fi
fi

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

