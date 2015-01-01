# FUNCTIONS ALIASES - PERSONA IO
# JAN 2015
#

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

# ROSETTA STONE
function rosetta() {
  /Library/Application\ Support/RosettaStoneDaemon/Bin/RosettaStoneDaemon
  /Applications/Rosetta\ Stone\ TOTALe.app/Contents/MacOS/Rosetta\ Stone\ TOTALe
}

# SWITCH XCODE
function xcode_switch() {
  sudo xcode-select -switch /Applications/$1.app/Contents/Developer
}

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

# APP FUNCTIONS --------------------------

# INSTALL SUBLIME PACKAGES VIA GITHUB USERNAME AND PACKAGE NAME
function sublime_3_package() {
  git clone $1 $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/$2
}

function pip_install_system_packages() {  # INSTALL AND UPDATE SYSTEM FILE
pip install $1
pip freeze > .dotfiles/system.txt
}
function remove_all_pyc() {
  find . -name "*.pyc" -exec git rm -f {} \; # REMOVE ALL PYC
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

# MARKDOWN DOCS
function markdown() {
  /Applications/Textmate.app/Contents/SharedSupport/Support/bin/Markdown.pl $1 > $1.html
}

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
