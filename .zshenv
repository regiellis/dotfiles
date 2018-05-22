# EDITOR --------------------------
export EDITOR="$(which nvim)"
export REACT_EDITOR="$(which nvim)"

# PATHS --------------------------

#GO
#export GOPATH="$HOME/www/apps/GOAPPS"
#export PATH="$GOPATH/bin:$PATH"
#export PATH=$PATH:/usr/local/opt/go/libexec/bin

# RBENV
export PATH="/home/linuxbrew/.linuxbrew/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYENV
export PATH="/home/linuxbrew/.linuxbrew/.pyenv/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#export PYENV_ROOT="/usr/local/opt/pyenv"

# NODEENV
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
eval "$(nodenv init -)"
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi

# PYTHON
#export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="false"
#export PIP_RESPECT_VIRTUALENV="true"
#export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python)"
#export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.virtualenvs"
#export WORKON_HOME="$HOME/www/apps/PYTHON"
#export PIP_VIRTUALENV_BASE=$WORKON_HOME
#source /usr/local/opt/pyenv/shims/virtualenvwrapper.sh

