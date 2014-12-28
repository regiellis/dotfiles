# TERMINAL ALIASES - PERSONA IO
# JAN 2014
#
#
# TODO: LOOKUP LINE 17, 18, 234

# VARS
EMAIL="$EMAIL"

# SYSTEM --------------------------
# SOME FROM Damian Conway

alias disable_local_backups="sudo tmutil disablelocal" # DISABLES LOCAL BACKUPS - OSX 10.6+
alias enable_local_backups="sudo tmutil enablelocal" # ENABLES LOCAL BACKUPS - OSX 10.6+
alias show_hidden_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder" # SHOW ALL HIDDEN FILES
alias hide_hidden_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder" # HIDE ALL HIDDEN FILES
alias no_ds_store_remote="defaults write com.apple.desktopservices DSDontWriteNetworkStores true" # PREVENT DS STORE ON REMOTE
alias o='open . &' # QUICK OPEN IN FINDER WITH "O"
alias tu='top -o cpu' # QUICK LOOK AT CPU USAGE
alias tm='top -o vsize' # QUICK LOOK AT MEMOERY USAGE
alias cl='clear; l' # CLEAR THEN LIST
alias a='ls -A' # LIST ALL EXCEPT LITERAL
alias la="ls -A -l -G" # LIST ALL - EXPANDED
alias l.='ls -d .[^.]*' # LIST HIDDEN FILES
alias lh="ls -lh" # UNKNOWN LIST TYPE
alias l='ls -lhGt'  #  LONG LISTING < RECENT FIRST
alias ll='ls -lhG'  # LONG LISTING, HUMAN READABLE, NO GROUP INFO
alias lt='ls -lt' # LIST BY LAST MODIFIED
alias c='clear' # CLEAR TERMINAL
alias cls='clear; ls' # CLEAR - LIST DIR
alias h='history' # TERMINAL HISTORY
alias cdd='cd -'  # RETURN TO THE LAST DIR CHANGED FROM
alias md='mkdir -p' # CREATE DIR , CREATE PARENT DIR IF IT DOES EXIST
alias up='cd ..'   # MOVE UP ONE DIR
alias e='exit'  # EXIT CMD
alias k9="killall -9" # KILL BY PROC ID
alias pubkey="more $HOME/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'" # COPY PUBKEY TO PASTEBOARD
alias sshalias="subl /Users/regi/.ssh/config -w"
alias restart_finder="open /System/Library/CoreServices/Finder.app" # AS IT SAYS, RESTART FINDER
alias going_mobile="diskutil unmountDisk /dev/disk*" # UNMONUT ALL DISK
alias spell="aspell"
alias pathcp="pwd | pbcopy" # COPY PATH TP PB


# Wacom Tablet Install -------------------------
# This function is here because the wacom drivers will
# not stay installed on Mac 10.9+ on my machine
#
function wacom_download_install() {
    cd "/Users/$USER/Downloads" # Change into download dir
    wget "http://cdn.wacom.com/u/drivers/mac/pro/WacomTablet_6.3.7-3.dmg"
    hdiutil detach WacomTablet_6.3.7-3.dmg
    /Volumes/WacomTablet/
    sudo installer -pkg Install\ Wacom\ Tablet.pkg -target /
}

# FIX PERMISSIONS ON NODE
function permission_fix_on_node() {
    sudo chown -R `whoami` ~/.npm
    sudo chown -R `whoami` /usr/local/lib/node_modules
}

# ANIMATION FUNCTIONS --------------------------

# MODO
alias modo_dir="open $HOME/Library/Application\ Support/Luxology"
alias modo_config="open $HOME/Library/Application\ Support/Luxology/Configs"
alias modo_scripts="open $HOME/Library/Application\ Support/Luxology/Scripts"

# ROSETTA STONE
function rosetta() {
  /Library/Application\ Support/RosettaStoneDaemon/Bin/RosettaStoneDaemon
  /Applications/Rosetta\ Stone\ TOTALe.app/Contents/MacOS/Rosetta\ Stone\ TOTALe
}

# SWITCH XCODE
function xcode_switch() {
  sudo xcode-select -switch /Applications/$1.app/Contents/Developer
}

# GRC OVERIDES FOR LS
#   MADE POSSIBLE THROUGH CONTRIBUTIONS FROM GENEROUS BENEFACTORS LIKE
#   `BREW INSTALL COREUTILS`
if $(gls &>/dev/null)
then
  alias g-ls="gls -F --color"
  alias g-l="gls -lAh --color"
  alias g-ll="gls -l --color"
  alias g-la='gls -A --color'
fi

# SYSTEM FUNCTIONS --------------------------

# CHANGE INTO THEN LIST
function cdc() {
    cd $1; ls
}

# CREATE THEN CHANGE INTO
function take() {
    mkdir -p "$1"
    cd "$1"
}

# KILL PROC BY NAME
function killnamed () {
    ps ax | grep $1 | cut -d ' ' -f 2 | xargs kill
}

# ZIP FILE
function zipr() {
  zip -r $1.zip $1
}

# UNTAR AND GZIP FILES
function untarit() {
  tar -xzvf $1.gz.tar $1
}

# APPS --------------------------

hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path # USE HUB WHEN RUNNING GIT IS CALLED
fi
alias nano="subl" # USE SUBLIME WHEN NANO IS CALLED
alias vim='mvim -v' # USE MACVIM WHEN VIM IS CALLED

# APP FUNCTIONS --------------------------

# INSTALL SUBLIME PACKAGES VIA GITHUB USERNAME AND PACKAGE NAME
function sublime_3_package() {
  git clone $1 $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/$2
}

# LANGUAGE --------------------------

# PYTHON
alias python_dir="python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()'" # DISPLAY SYSTEM PYTHON DIR
alias pip_update_system_packages="pip freeze > $HOME/.dotfiles/system.txt" # UPDATE ALL PIP PACKAGES
alias pip_update="pip install -U -r $HOME/.dotfiles/system.txt" # UPDATE ALL PIP PACKAGES
alias pip_remove_all="pip freeze | xargs pip uninstall -y" # REMOVE ALL PACKAGES
function pip_install_system_packages() {  # INSTALL AND UPDATE SYSTEM FILE
  pip install $1
  pip freeze > .dotfiles/system.txt
}
function remove_all_pyc() {
  find . -name "*.pyc" -exec git rm -f {} \; # REMOVE ALL PYC
}

# RUBY
alias r="rake"

# RUBY AUTOCOMPLETE
if [[ ! -o interactive ]]; then
    return
fi

compctl -K _rbenv rbenv

_rbenv() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(rbenv commands)"
  else
    completions="$(rbenv completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}

# LANGUAGE FUNCTIONS --------------------------

# PYTHON

# START PYTHON MAILSERVER
function python_mailserver() {
  local port="${1:-1025}"
  sudo python -m smtpd -n -c DebuggingServer localhost:"$port"
}

# START PYTHON SIMPLEMAILSERVER
function python_simpleserver() {
  local port="${1:-8000}"
  open "http://localhost:${port}/" && python -m SimpleHTTPServer "$port"
}

# FRAMEWORKS --------------------------


# FRAMEWORK FUNCTIONS --------------------------

# DEV TOOLS --------------------------
alias ios-sim-web='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app' # IOS 7
alias wordpress_svn='svn co http://core.svn.wordpress.org/trunk/ .' # WORDPRESS TRUNK DOWNLOAD
# fpm_path=$(which php-fpm)
# alias php-fpm='sudo $fpm_path' # PHP5 FPM START

# BOXES
# Ubuntu precise 64 - http://files.vagrantup.com/precise64.box
# Ubuntu Server 12.04 amd64 - http://goo.gl/8kWkm

# VAGRANT COMMON CMDS
alias vinit="vagrant init" # CREATE VAGRANTFILE < NAME & URL
alias vup="vagrant up" # CREATE SETUP BASED ON VAGRANT FILE
alias vreload="vagrant reload" # REUP
alias vhalt="vagrant halt" # SHUTDOWN CURRENT RUNNING BOX
alias vgone="vagrant destroy" # DESTORY VAGRANT SETUP
alias vssh="vagrant ssh" # SSH INTO CURRENT RUNNING BOX
alias vsleep="vagrant suspend" # SUSPEND CURRENT VBOX
alias vst="vagrant status" # GET THE CURRENT STATUS OF BOX
alias vwake="vagrant resume" # RESUME BOX
alias vrefresh"vagrant provision" # RE-PROVISION

# VAGRANT SHARE
alias vpack="vagrant package" # PACKAGE UP CURRENT BOX

# VAGRANT BOX
alias vboxadd="vagrant box add" # ADD NEW BOX < NAME & URL
alias vboxlist="vagrant box list" # ADD LIST BOX < NAME
alias vboxrm="vagrant box remove" # ADD REMOVE BOX < NAME & URL
alias vboxrepack="vagrant box repackage" # ADD REPACK BOX < NAME & URL

# VAGRANT PLUGIN
alias vplug="vagrant plugin" # PLUGIN LIST
alias vpluginstall="vagrant plugin install" # PLUGIN INSTALL
alias vpluglist="vagrant plugin list" # PLUGIN LIST
alias vplug="vagrant plugin uninstall" # PLUGIN UNINSTALL


# DOCKER
alias rm_all_docker_continaer="docker rm $(docker ps -aq)" # REMOVES ALL DOCKER CONTAINERS
alias rm_all_docker_images="docker rmi $(docker images -aq)" # REMOVES ALL DOCKER CONTAINERS
alias b2d="boot2docker" # BOOT2DOCKER

# COOKBOOKS
function git_cookbook() {
	git clone https://github.com/opscode-cookbooks/$1.git
}

# NPM PACKAGE UPDATE
#
alias npm_update='npm update -g'

# MONGO
alias mongodb_start="mongod run --config $HOME/www/data/config/mongodb.yaml" # QUICK START OF MONGO
alias mongodb_stop="mongo --eval 'db.getSiblingDB(\"admin\").shutdownServer()'" # QUICK STOP OF MONGO

# RETHINKDB
alias rethinkdb_start="rethinkdb --config-file $HOME/www/data/config/rethink_config"

# DEV TOOL FUNCTIONS --------------------------

# MARKDOWN DOCS
function markdown() {
  /Applications/Textmate.app/Contents/SharedSupport/Support/bin/Markdown.pl $1 > $1.html
}

# VERSION TOOLS --------------------------

# GIT
alias ungit="find . -name '.git' -exec rm -rf {} \;" # REMOVE GIT FILES
alias gb='git branch' # CREATE A GIT BRANCH
alias gba='git branch -a' # LIST ALL GIT BRANCHES
alias gc='git commit -v' # GIT COMMIT W/VERBOSE
alias ga='git add' # GIT ADDED FILES
alias gca='git commit -a' # GIT COMMIT ADD MOD FILES W/VEBOSE
alias gco='git checkout' # GIT CHECKOUT
alias gd='git diff' # GIT DIFFERENCE
alias gdm='git diff master' # GIT DIFFERENCE MASTER
alias gl='git pull' # GIT PULL
alias gnp="git-notpushed" # LIST PUSH NOT ON ORIGIN
alias gp='git push origin HEAD' # PUSH TO ORIGIN
alias gph='git push heroku master' #PUSH TO HEROKU MASTER
alias gst='git status' # GIT STATUS
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative" # PRETTY LOG
alias gs='git status -sb' # SHORT / BRANCH
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm" # UNKNOWN
alias n=!"git ls-files | xargs notes | awk -F: '{ print $1,$2; print $3,$4; print $5}' | grcat conf.notes " # FIND FIXME, TODO, ETC

# GIT COMPLETION
completion=/usr/local/share/zsh/site-functions/_git
if test -f $completion
then
  zstyle ':completion:*:*:git:*' source $completion
fi

# VERSION TOOL FUNCTIONS --------------------------

# CREATE A NEW MERURIAL REPO ON A SERVER
function new-hg() {
    ssh regi@persona.io "hg init $1"
    hg clone ssh://hg@example.com/$1
}

# COMMIT PENDING CHANGES AND QUOTE ALL ARGS AS MESSAGE
function gg() {
    git commit -v -a -m "$*"
}

# GIT CLONE FROM GITHUB
function gch() {
  git clone git://github.com/$1/$2.git $2
}

# SETUP A TRACKING BRANCH FROM [REMOTE] [BRANCH_NAME]
function gbt() {
  git branch --track $2 $1/$2 && git checkout $2
}
# QUICKLY CLOBBER A FILE AND CHECKOUT
function grf() {
  rm $1
  git checkout $1
}

# QUICK LOCATION --------------------------

alias apps="cd $HOME/www/apps" # OVERVIEW APPLICATIONS DIR
alias www="cd $HOME/www/" # OVERVIEW GENERAL WEB DIR
alias vhosts="cd $HOME/www/vhosts" # OVERVIEW GENERAL DIR
alias logs="cd $HOME/www/logs" # OVERVIEW LOGS DIR
alias database_configs="cd $HOME/www/data" # OVERVIEW DATA DIR
alias assets_dev="cd $HOME/Desktop/ASSETS/DEVELOPMENT" # OVERVIEW DEVELOPMENT DIR

alias android_tools="cd $HOME/Android/sdk/tools" # OVERVIEW ANDROID TOOLS DIR

# TMUX QUICK KEYS --------------------------
alias tns="tmux new -s" # START A NEW NAME SESSION
alias tls="tmux ls" # LIST ALL SESSIONS
alias ta="tmux attach" # TMUX ATTACH
alias tan="tmux attach -t" # TMUX ATTACH TO NAME SESSION
alias tkill="tmux kill-session -t" # TMUX KILL SESSION WITH NAME


# QUICK JUMPS WITH MARKS
# http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html?utm_source=hackernewsletter&utm_medium=email
function jump {
    cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}
function unmark {
    rm -i "$MARKPATH/$1"
}


# CONFIG FILES --------------------------
alias ohmyzsh="subl $HOME/.oh-my-zsh" # OPEN ZSH DEFAULT CONFIG
alias zshconfig="subl $HOME/.zshrc" # OPEN ZSH CONFIG
alias reload=". ~/.zshrc && echo 'ZSH config reloaded'" # RELOAD CONFIGS
alias ea='subl -w $HOME/.dotfiles/zsh/aliases.zsh && reload' # OPEN USER-DEFINED ALIASES
alias ee="subl $HOME/.dotfiles/system/env.zsh" # OPEN USER-DEFINED ENV
alias known_host="subl /Users/$USER/.ssh/known_hosts" # OPEN KNOWN HOST
alias ssh-config="subl -w $HOME/.ssh/config" # OPEN SSH CONFIG
alias eh="sudo subl -w /private/etc/hosts" # OPEN HOSTS FILE IN SUBL
alias eg='subl .git/config' # EDIT GIT CONFIG
alias dotconfig="subl $HOME/.dotfiles" # EDIT DOT FILES

# ALIASES FOR GRC FROM HOMEBREW
source `brew --prefix grc`/etc/grc.bashrc

# LOAD PERSONAL FUNCTIONS IF USER MATCH
if [[ $USER == "regi" ]]; then
  source $HOME/.dotfiles/zsh/functions/personal.zsh
fi

if $(grc &>/dev/null)
then
  GRC=`which grc`
  if [ "$TERM" != dumb ] && [ -n GRC ]
  then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
  fi
fi

# PORT
#alias whats_on_port="lsof -iTCP"

