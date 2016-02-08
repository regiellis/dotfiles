# ENV ZSH - PERSONA IO
# JAN 2015

CFLAGS='-g -O2'

# EDITOR --------------------------
export EDITOR="$(which subl) --new-window --wait"

# PATHS --------------------------

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/Library/Android/sdk/tools:$PATH" # ANDROID
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH" # ANDROID
export GITHUB_ROOT="$HOME/GitHub/:$PATH" # GITHUB
export ANDROID_HOME="$HOME/Library/Android/sdk"

# DOCKER
export DOCKER_TLS_VERIFY="1"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYENV
export PYENV_ROOT="/usr/local/opt/pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

#NODEENV
export PATH="$HOME/.nodenv/bin:$PATH"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# PYTHON
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="false"
export PIP_RESPECT_VIRTUALENV="true"
export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python)"
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.virtualenvs"
export WORKON_HOME="$HOME/www/apps/Python"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

