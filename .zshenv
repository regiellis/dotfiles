# ENV ZSH - PERSONA IO
# JAN 2015

# EDITOR --------------------------
export EDITOR="$(which nvim)"
export REACT_EDITOR="$(which nvim)"

# PATHS --------------------------

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/Library/Android/sdk/tools:$PATH" # ANDROID
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH" # ANDROID
export GITHUB_ROOT="$HOME/GitHub/:$PATH" # GITHUB
export ANDROID_HOME="$HOME/Library/Android/sdk"

#GO
export GOPATH="$HOME/www/apps/GOAPPS/PACKAGES"
export PATH="$GOPATH/bin:$PATH"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYENV
export PATH="$HOME/.pyenv/bin:$PATH"
export PYENV_ROOT="/usr/local/opt/pyenv"
eval "$(pyenv init -)"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# NODEENV
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# PHPENV
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi

# PYTHON
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="false"
export PIP_RESPECT_VIRTUALENV="true"
export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python)"
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.virtualenvs"
export WORKON_HOME="$HOME/www/apps/PYTHON"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
#source /usr/local/opt/pyenv/shims/virtualenvwrapper.sh

