# TERMINAL ALIASES - PERSONA IO
# MARCH 2013
# 
# 
# TODO: LOOKUP LINE 17, 18, 234

# VARS
EMAIL="$EMAIL"

# SYSTEM --------------------------
# SOME FROM Damian Conway

alias disable_local_backups="sudo tmutil disablelocal" # DISABLES LOCAL BACKUPS - OSX 10.6+
alias enable_local_backups="sudo tmutil enablelocal" # ENABLES LOCAL BACKUPS - OSX 10.6+
alias show_hidden_files="defaults write com.apple.Finder AppleShowAllFiles TRUE; killall Finder" # SHOW ALL HIDDEN FILES
alias hide_hidden_files="defaults write com.apple.Finder AppleShowAllFiles FALSE; killall Finder" # HIDE ALL HIDDEN FILES
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
alias pubkey="more $HOME/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'" # COPY PUBKEY TO PASTEBOARD

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

# TAR AND GIZ FILES
function untarit() {
  tar -xzvf $1.gz.tar $1
}

# APPS --------------------------

hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path # USE HUB WHEN RUNNING GIT IS CALLED
fi
#alias mate="subl" # USE SUBLIME WHEN MATE IS CALLED
alias nano="subl" # USE SUBLIME WHEN NANO IS CALLED
alias curl="http" # USE HTTP WHEN CURL IS CALLED

# APP FUNCTIONS --------------------------

# INSTALL SUBLIME PACKAGES VIA GITHUB USERNAME AND PACKAGE NAME
function sublime_package() {
  git clone $1 $HOME/Library/Application\ Support/Sublime\ Text\ 2/Packages/$2
}

# LANGUAGE --------------------------

# PYTHON
alias pythondir="python -c 'from distutils.sysconfig import get_python_lib; print get_python_lib()'" # DISPLAY SYSTEM PYTHON DIR

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
  local port="${1:-25}"
  sudo python -m smtpd -n -c DebuggingServer localhost:"$port"
} 

# START PYTHON SIMPLEMAILSERVER 
function python_simpleserver() {
    local port="${1:-8000}"
    open "http://localhost:${port}/" && python -m SimpleHTTPServer "$port"
} 

# FRAMEWORKS --------------------------

# RAILS
alias sc='rails console' # RAILS CONSOLE
alias sg='rails generate' # RAILS GENERATE
alias sp='rails plugin' # RAILS PLUGINS
alias ss='rails server' # RAILS SERVER
alias tl='tail -f log/*.log' # RAILS DEV LOG
alias ts='thin start' # RAILS START THIN

# TDD / BDD

alias aa='autotest' # RAILS AUTOTEST
alias aaf='autotest -f' # DON'T RUN ALL AT START
alias aas="./script/autospec" # RSPEC


# FRAMEWORK FUNCTIONS --------------------------

# PHONEGAP

# CREATE PHONEGAP IOS APP < NAME
function phonegap_create_ios() {
  /Applications/Phonegap/ios/bin/create /Users/$USER/www/apps/Phonegap/$1 io.persona.$1 $1
}
# CREATE PHONEGAP ANDROID APP < NAME
function phonegap_create_android() {
  /Applications/Phonegap/android/bin/create /Users/$USER/www/apps/Phonegap/$1 io.persona.$1 $1
}
# CREATE PHONEGAP WINDOWS 8 PHONE APP < NAME
function phonegap_create_windows_8_phone() {
  /Applications/Phonegap/windows-phone-8/bin/create /Users/$USER/www/apps/Phonegap/$1 io.persona.$1 $1
}
# CREATE PHONEGAP WINDOWS 8 APP < NAME
function phonegap_create_windows_8_app() {
  /Applications/Phonegap/windows8/bin/create /Users/$USER/www/apps/Phonegap/$1 io.persona.$1 $1
}
# CHANGE INTO PHONEGAP APP DIR < APP < NAME
function phonegap_dir() {
  cd /Users/$USER/www/apps/Phonegap/$1/$2
}
# BUILD PHONEGAP APP < APP < NAME
function phonegap_build() {
  /Users/$USER/www/apps/Phonegap/$1/$2/cordova/debug
  /Users/$USER/www/apps/Phonegap/$1/$2/cordova/emulate
}
# SIMULATE PHONEGAP APP < APP < NAME
function phonegap_sim() {
  /Users/$USER/www/apps/Phonegap/$1/$2/cordova/emulate
}
# OPEN LOGFILE FOR PHONEGAP APP < APP < NAME
function phonegap_log() {
  subl /Users/$USER/www/apps/Phonegap/$1/$2/cordova/log
}
# DELETE PHONEGAP APP < APP < NAME
function phonegap_rm() {
  cd ~ && rm -Rf /Users/$USER/www/apps/Phonegap/$1/$2
}

# function update_phone_gap() {
#   wget 'https://downloads.sourceforge.net/project/phonegap/phonegap-2.5.0.zip?r=&ts=1362511314&use_mirror=iweb' $HOME/tmp/
# }

# DEV TOOLS --------------------------
alias ios-sim-web='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app' # IOS 6
alias memcached_start='/usr/local/bin/memcached' # START MEMCACHED ON STANDARD PORT
alias wordpress_svn='svn co http://core.svn.wordpress.org/trunk/ .' # WORDPRESS TRUNK DOWNLOAD
fpm_path=$(which php-fpm)
alias php-fpm='sudo $fpm_path' # PHP5 FPM START

# NPM PACKAGE UPDATE
# 
alias update_node_system='sudo npm update -g'

# MYSQL

alias my="mysql -u root -p" # QUICK LOGIN AS ROOT W/PASS
alias mysql_start="mysql.server start" # MYSQL SERVER START
alias mysql_stop="mysql.server stop" # MYSQL SERVER STOP
alias mydump="mysqldump -u root -p" # MYSQL SERVER DUMP

# POSTGRESQL
alias postgresql_start="pg_ctl -D /usr/local/var/postgres -l /Users/$USER/www/logs/server.log start" # QUICK START OF POSTGRESQL
alias postgresql_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast" # QUICK STOP OF POSTGRESQL

# MONGO
alias monogodb_start="mongod run --config /usr/local/etc/mongod.conf" # QUICK START OF MONGO

# NGINX
alias nginx="sudo nginx" # QUICK START NGINX
alias nginx_stop="sudo nginx -s stop" # QUICK STOP NGINX 
alias nginx_reload="sudo nginx -s reload" # QUICK RELOAD NGINX


# START IT ALL
# START ALL DEVELOPMENT SERVER AND ALL TOOLS / NGINX / MYSQL
function start_deving_with_nginx_mysql {
  nginx
  php-fpm
  mysql_start
}

# START ALL DEVELOPMENT SERVER AND ALL TOOLS / DJANGO / MYSQL
function start_deving_with_django_mysql {
  mysql_start
  python manage.py runserver
}

# START ALL DEVELOPMENT SERVER AND ALL TOOLS / DJANGO / POSTGRESQL
function start_deving_with_django_postgresql {
  postgresql_start
  python manage.py runserver
}

# DEV TOOL FUNCTIONS --------------------------

# MYSQL DUMP ADV < USERNAME < DATABASE < OUTPUT
function mysql_dump_file() {
  mysqldump -u $1 -p $2 > $3
}

# MYSQL DUMP ADV < USERNAME < DATABASE < OUTPUT
function mysql_import_file() {
  mysqldump -u $1 -p $2 < $3
}

# VARNISH START ON LOCALHOST > PORT 
function varnish_start() {
  sudo varnishd -b 127.0.0.1{$1:-}
}
# ALIAS NGINX VHOSTS FILE
function nginx_alias_site() {
  sudo ln -s /usr/local/etc/nginx/sites-available/$1 /usr/local/etc/nginx/sites-enabled/$1
}

# MARKDOWN DOCS
function markdown() { 
  /Applications/Textsubl.app/Contents/SharedSupport/Support/bin/Markdown.pl $1 > $1.html 
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
    ssh hg@persona.io "hg init $1"
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
alias press="cd $HOME/www/vhosts/press" # OVERVIEW APPLICATIONS WORDPRESS
alias www="cd $HOME/www/" # OVERVIEW GENERAL WEB DIR 
alias vhosts="cd $HOME/www/vhosts" # OVERVIEW GENERAL DIR
alias tools="cd $HOME/www/tools" # OVERVIEW WEB DEV TOOLS DIR
alias logs="cd $HOME/www/logs" # OVERVIEW LOGS DIR
alias assets="cd $HOME/Desktop/ASSETS/" # OVERVIEW ASSET DIR
alias assets_design="cd $HOME/Desktop/ASSETS/DESIGN" # OVERVIEW DESIGN DIR
alias assets_dev="cd $HOME/Desktop/ASSETS/DEVELOPMENT" # OVERVIEW DESIGN DIR


# CONFIG FILES --------------------------
alias ohmyzsh="subl $HOME/.oh-my-zsh" # OPEN ZSH DEFAULT CONFIG
alias zshconfig="subl $HOME/.zshrc" # OPEN ZSH CONFIG
alias ea='subl -w $HOME/.dotfiles/zsh/aliases.zsh && reload' # OPEN USER-DEFINED ALIASES
alias ee="subl $HOME/.dotfiles/system/env.zsh" # OPEN USER-DEFINED ENV
alias known_host="subl /Users/$USER/.ssh/known_hosts" # OPEN KNOWN HOST 
alias php-fpm-config="subl -w /usr/local/etc/php/5.3/php-fpm.conf" # OPEN PHP FPM CONFIG
alias ssh-config="subl -w $HOME/.ssh/config" # OPEN SSH CONFIG
alias nginx_dir="cd /usr/local/etc/nginx/" # NGINX CONFIGS
alias eh="sudo subl -w /private/etc/hosts" # OPEN HOSTS FILE IN SUBL
alias eg='subl .git/config' # EDIT GIT CONFIG
alias zshconfig="subl $HOME/.dotfiles" # EDIT DOT FILES


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

