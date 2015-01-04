# BASE ZSH - PERSONA IO
# JAN 2015
#
# ASK FOR THE ADMINISTRATOR PASSWORD UPFRONT
sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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

DISABLE_UPDATE_PROMPT=false
ZSH_THEME="psona"

ZSH=$HOME/.oh-my-zsh

# PROMPT COLORS
autoload -U colors
colors
setopt prompt_subst

# UNCOMMENT FOLLOWING LINE IF YOU WANT RED DOTS TO BE DISPLAYED WHILE WAITING FOR COMPLETION
COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"

. $ZSH/oh-my-zsh.sh

# GENERAL HISTORY RELATED STUFF
HISTFILE=~/.history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=10000
SAVEHIST=10000
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
bindkey -e

# zsh performance tweaks
# .. use a cache file
zstyle ':completion:*' use-cache on
# .. and then specify the cache file to use (not added to repo: separate file for each machine)
zstyle ':completion:*' cache-path $HOME/.zshcache

# aliases
source $HOME/.zshalias
#functions
source $HOME/.zshfunc

# MAPPINGS FOR CTRL/OPTION-LEFT-ARROW AND CTRL/OPTION-RIGHT-ARROW FOR
# MOVING ACROSS WORDS
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# WHICH PLUGINS WOULD YOU LIKE TO LOAD? (PLUGINS CAN BE FOUND IN ~/.OH-MY-ZSH/PLUGINS/*)
# CUSTOM PLUGINS MAY BE ADDED TO ~/.OH-MY-ZSH/CUSTOM/PLUGINS/
plugins=(
    brew
    brew-cask
    bower
    cake
    cloudapp
    coffee
    colorize
    django
    docker
    git
    git-extras
    git-flow
    git-hubflow
    github
    git-remote-branch
    fabric
    mercurial
    heroku
    history
    osx
    pip
    pep8
    python
    pyenv
    pylint
    # rails
    rbenv
    redis-cli
    ruby
    terminalapp
    node
    npm
    scala
    sbt
    sudo
    sublime
    ssh-agent
    terminalapp
    textmate
    themes
    tmux
    vagrant
    virtualenv
    # virtualenvwrapper
    xcode
)

# GRAB ALL FILES WITH THE ".zsh" EXT
for config_file ($HOME/.dotfiles/*/*.zsh); do
  source $config_file
done