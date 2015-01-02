# ZSH CONFIGS - PERSONA IO
# JAN 2015

# PATH TO YOUR OH-MY-ZSH CONFIGURATION
ZSH=$HOME/.oh-my-zsh

# PROMPT COLORS
autoload -U colors
colors
setopt prompt_subst

# UNCOMMENT FOLLOWING LINE IF YOU WANT RED DOTS TO BE DISPLAYED WHILE WAITING FOR COMPLETION
COMPLETION_WAITING_DOTS="true"
CASE_SENSITIVE="true"

# ZSH OPTIONS
setopt hist_ignore_dups
setopt extendedglob notify
setopt append_history
setopt inc_append_history
setopt menucomplete

. $ZSH/oh-my-zsh.sh

# GENERAL HISTORY RELATED STUFF
HISTFILE=~/.zsh_history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e

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
