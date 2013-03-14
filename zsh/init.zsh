# ZSH CONFIGS - PERSONA IO
# MARCH 2013


# PATH TO YOUR OH-MY-ZSH CONFIGURATION
ZSH=$HOME/.oh-my-zsh

# PROMPT COLORS
autoload -U colors
colors
setopt prompt_subst

# UNCOMMENT FOLLOWING LINE IF YOU WANT RED DOTS TO BE DISPLAYED WHILE WAITING FOR COMPLETION
COMPLETION_WAITING_DOTS="true"

# IGNORE DUPLICATES IN HISTORY
setopt hist_ignore_dups

. $ZSH/oh-my-zsh.sh

# GENERAL HISTORY RELATED STUFF
HISTFILE=~/.zsh_history
HISTIGNORE="ls:ls *:cd:cd -:pwd;exit:date:* --help"
HISTSIZE=1000000
SAVEHIST=1000000
setopt extendedglob notify
setopt append_history
setopt inc_append_history
bindkey -e

# MAPPINGS FOR CTRL/OPTION-LEFT-ARROW AND CTRL/OPTION-RIGHT-ARROW FOR
# MOVING ACROSS WORDS
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# SHOW COMPLETION ON THE FIRST TAB
setopt menucomplete

# WHICH PLUGINS WOULD YOU LIKE TO LOAD? (PLUGINS CAN BE FOUND IN ~/.OH-MY-ZSH/PLUGINS/*)
# CUSTOM PLUGINS MAY BE ADDED TO ~/.OH-MY-ZSH/CUSTOM/PLUGINS/
plugins=(
    brew
    cloudapp
    django
    git
    git-flow
    github
    mercurial
    osx
    pip
    python
    rails
    rails3
    rbenv
    redis-cli
    ruby
    terminalapp
    node
    npm
    django
    sublime
)

# PROMPT COLORS
# MOVED HERE, WAS NOT WORKING IN PROMPT FILE > LOOK INTO LATER
local emoticon="%(?,%{$fg[green]%}✔%{$reset_color%},%{$fg[red]%}✖%{$reset_color%})"

PROMPT='%{$fg_bold[yellow]%}%n%{$reset_color%} > %{$fg[red]%}%M%{$reset_color%} → '
PROMPT2='\'
RPROMPT='$(prompt_char) %{$fg_bold[cyan]%}%~%{$reset_color%}%{$fg_bold[green]%}$(current_venv)%{$fg_bold[red]%}$(current_rbenv)%{$reset_color%}$($HOME/.dotfiles/bin/git-cwd-info.rb)'
