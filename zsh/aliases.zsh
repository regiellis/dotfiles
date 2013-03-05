# TERMINAL ALIASES - PERSONA IO
# MARCH 2013
# 
# 
# TODO: LOOKUP LINE 17, 18


# SYSTEM --------------------------
# SOME FROM Damian Conway

alias disable_local_backups="sudo tmutil disablelocal" # DISABLES LOCAL BACKUPS - OSX 10.6+
alias enable_local_backups="sudo tmutil enablelocal" # ENABLES LOCAL BACKUPS - OSX 10.6+
alias o='open . &' # QUICK OPEN IN FINDER WITH "O"
alias tu='top -o cpu' # QUICK LOOK AT CPU USAGE
alias tm='top -o vsize' # QUICK LOOK AT MEMOERY USAGE
alias cl='clear; l' # CLEAR THEN LIST
alias a='ls -A' # LIST ALL EXCEPT LITERAL
alias la="ls -A -l -G" # LIST ALL - EXPANDED
alias l.='ls -d .[^.]*' # UNKNOWN LIST TYPE 
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

# TAR AND GIZ FILES
function untarit() {
  tar -xzvf $1.gz.tar $1
}


# APPS --------------------------

alias git="hub" # USE HUB WHEN RUNNING GIT IS CALLED
alias mate="subl" # USE SUBLIME WHEN MATE IS CALLED
alias nano="subl" # USE SUBLIME WHEN NANO IS CALLED
alias curl="http" # USE HTTP WHEN CURL IS CALLED


# APP FUNCTIONS --------------------------


# INSTALL SUBLIME PACKAGES VIA GITHUB USERNAME AND PACKAGE NAME
function sublime_package() {
  git clone $1 ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/$2
}


# LANGUAGE --------------------------



# FRAMEWORKS --------------------------



# DEV TOOLS --------------------------
alias memcached_start='/usr/local/bin/memcached' # START MEMCACHED ON STANDARD PORT

# DEV TOOL FUNCTIONS --------------------------

# VARNISH START ON LOCALHOST > PORT 
function varnish_start() {
  sudo varnishd -b 127.0.0.1:$1
}




# QUICK TOOLS --------------------------



# Phonegap
function phonegap_create_ios() {
  /Applications/Phonegap/ios/bin/create /Users/regi/www/apps/Phonegap/$1 io.persona.$1 $1
}

function phonegap_create_android() {
  /Applications/Phonegap/android/bin/create /Users/regi/www/apps/Phonegap/$1 io.persona.$1 $1
}

function phonegap_dir() {
  cd /Users/regi/www/apps/Phonegap/$1/$2
}

function phonegap_build() {
  /Users/regi/www/apps/Phonegap/$1/$2/cordova/debug
  /Users/regi/www/apps/Phonegap/$1/$2/cordova/emulate
}

function phonegap_sim() {
  /Users/regi/www/apps/Phonegap/$1/$2/cordova/emulate
}

function phonegap_log() {
  /Users/regi/www/apps/Phonegap/$1/$2/cordova/log
}

function phonegap_rm() {
  cd ~ && rm -Rf /Users/regi/www/apps/Phonegap/$1/$2
}

# IOS 6
alias ios_sim='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# WORDPRESS
alias wordpress_svn='svn co http://core.svn.wordpress.org/trunk/ .'
alias php-fpm='sudo /usr/local/Cellar/php53/5.3.21/sbin/php-fpm'

# Configuration aliases.
alias ohmyzsh="subl ~/.oh-my-zsh"
alias zshconfig="subl ~/.zshrc"

alias known_host="subl /Users/regi/.ssh/known_hosts"
alias php-fpm-config="subl -w /usr/local/etc/php/5.3/php-fpm.conf"
alias ssh-config="subl -w ~/.ssh/config"

# HIDDEN
alias show_hidden_files="defaults write com.apple.Finder AppleShowAllFiles TRUE; killall Finder"
alias hide_hidden_files="defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder"

# PYTHON
alias pythondir="python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()'"
function python_mailserver() {
  sudo python -m smtpd -n -c DebuggingServer localhost:$1
} 

alias my="mysql -u root -p"
alias mysql_start="mysql.server start"
alias mysql_stop="mysql.server stop"
alias mydump="mysqldump -u root -p"

alias postgresql_start="pg_ctl -D /usr/local/var/postgres -l /Users/regi/www/logs/server.log start"
alias postgresql_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

alias monogodb_start="mongod run --config /usr/local/etc/mongod.conf"

# LOCATIONS
alias apps="cd $HOME/www/apps"
alias press="cd $HOME/www/vhosts/press"
alias www="cd $HOME/www/"
alias vhosts="cd $HOME/www/vhosts"
alias tools="cd $HOME/www/tools"
alias logs="cd $HOME/www/logs"

# NGINX
alias nginx="sudo nginx"
alias nginx_stop="sudo nginx -s stop"
alias nginx_reload="sudo nginx -s reload"
alias nginx_dir="cd /usr/local/etc/nginx/"
function nginx_alias_site() {
  sudo ln -s /usr/local/etc/nginx/sites-available/$1 /usr/local/etc/nginx/sites-enabled/$1
}


# EDIT HOST
alias eh="sudo subl -w /private/etc/hosts"

# Utility
alias reload='source $HOME/.dotfiles/aliases'
alias ea='subl -w ~/.dotfiles/aliases && reload' # Edit aliases
alias ee="subl ~/.dotfiles/env"





# Mercurial hg
function new-hg() {
    ssh hg@example.com "hg init $1"
    hg clone ssh://hg@example.com/$1
}

# Git
alias ungit="find . -name '.git' -exec rm -rf {} \;"
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias ga='git add'
alias gca='git commit -v -a'

# Commit pending changes and quote all args as message
function gg() { 
    git commit -v -a -m "$*"
}
alias gco='git checkout'
alias gd='git diff'
alias gdm='git diff master'
alias gl='git pull'
alias gnp="git-notpushed"
alias gp='git push'
alias gst='git status'
alias gt='git status'
alias g='git status'
alias eg='subl .git/config'

# Git clone from GitHub
function gch() {
  git clone git://github.com/$1/$2.git $2
}


# Setup a tracking branch from [remote] [branch_name]
function gbt() { 
  git branch --track $2 $1/$2 && git checkout $2 
}
# Quickly clobber a file and checkout
function grf() { 
  rm $1
  git checkout $1 
}
# Call from inside an initialized Git repo, with the name of the repo.
function new-git() {
  ssh git@example.com "mkdir $1.git && cd $1.git && git --bare init"
  git remote add origin git@example.com:$1.git
  git push origin master
  git config branch.master.remote origin
  git config branch.master.merge refs/heads/master
  git config push.default current
}

# Ruby
alias r="rake"

function markdown() { 
  /Applications/Textsubl.app/Contents/SharedSupport/Support/bin/Markdown.pl $1 > $1.html 
}

# Rails
alias rp='touch tmp/restart.txt'
alias sc='rails console'
alias sg='rails generate'
alias sp='rails plugin'
alias ss='rails server'
alias tl='tail -f log/*.log'
alias ts='thin start'

# TDD / BDD

alias aa='autotest'
alias aaf='autotest -f' # Don't run all at start
alias aas="./script/autospec"


# Personal
function clubq() {
  wget www.m-club-q.com/club-q/gallery/movie/$1/$1.wmv
}

function swp() {
  wget www.sports-women-project.com/gallery/movie/$1/$1.wmv
}




# PORT
#alias whats_on_port="lsof -iTCP"

