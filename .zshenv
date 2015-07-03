# ENV ZSH - PERSONA IO
# JAN 2015

CFLAGS='-g -O2'

# EDITOR --------------------------
export EDITOR="$(which subl) --new-window --wait"

# PATHS --------------------------

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/Android/sdk/tools:$PATH" # ANDROID
export PATH="$HOME/Android/sdk/platform-tools:$PATH" #ANDROID
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export PATH="$HOME/.node/bin:$PATH" # NPM BIN
export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH" #PHP
export GITHUB_ROOT="$HOME/GitHub/:$PATH" # GITHUB

export DOCKER_TLS_VERIFY=1
export DOCKER_TLS=yes
#export DOCKER_HOST=tcp://192.168.59.103:2376 # DOCKER

# LIBSASS
#export SASS_SPEC_PATH=/Users/you/dev/sass/sass-spec
#export SASS_SASSC_PATH=/Users/you/dev/sass/sassc
#export SASS_LIBSASS_PATH=/Users/you/dev/sass/libsass

# NVM
export NVM_DIR="/Users/$(whoami)/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# RBENV
export RBENV_ROOT="/usr/local/var/rbenv:$PATH" # RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYENV
export PYENV_ROOT="/usr/local/opt/pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# PYTHON
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="false"
export PIP_RESPECT_VIRTUALENV="true"
export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python)"
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.virtualenvs"
export WORKON_HOME="$HOME/www/apps/Python"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

