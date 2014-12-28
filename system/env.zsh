# ENV ZSH - PERSONA IO
# OCT 2014

# EDITOR --------------------------
export EDITOR="$(which subl) --new-window --wait"

# PATHS --------------------------
export ARCHFLAGS="-arch x86_64"
PATH="/usr/local/bin:/usr/bin:/bin:/sbin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man:$MANPATH"
export PATH="$HOME/.node/bin:$PATH" #NODE
export PATH="/usr/local/bin/npm:$PATH" #NPM
export RBENV_ROOT="/usr/local/var/rbenv:$PATH" # RBENV
export PATH="/usr/local/share/npm/bin:$PATH" # NPM BIN
export PATH="/usr/local/bin/gsutil:$PATH" # GOOGLE UTILS
export PATH="/usr/local/Cellar/ssh-copy-id/6.0p1/bin:$PATH" # SSH COPY
export PATH="/usr/local/heroku/bin:$PATH" # HEROKU TOOLBELT
export PATH="$HOME/Android/sdk/tools:$PATH" # ANDROID
export PATH="$HOME/Android/sdk/platform-tools:$PATH"
export MARKPATH="$HOME/.marks:$MANPATH" # MARKS
export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox #SLIMERJS
export SASS_LIBSASS_PATH="/Users/hcatlin/path/libsass:$SASS_LIBSASS_PATH" #LEESC

export DOCKER_TLS_VERIFY=1
export DOCKER_TLS=yes
# export DOCKER_HOST=tcp://192.168.59.103:2376 # DOCKER
export DOCKER_HOST=tcp://127.0.0.1:2376


# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# PYTHON
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PIP_RESPECT_VIRTUALENV="true"
export VIRTUALENVWRAPPER_PYTHON="$(pyenv which python)"
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.virtualenvs"
export WORKON_HOME="$HOME/www/apps/Python"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
source /usr/local/bin/virtualenvwrapper.sh

# VIRTUALENVWRAPPER
if [[ -f `brew --prefix`/usr/local/bin/virtualenvwrapper.sh ]]; then
    . `brew --prefix`/usr/local/bin/virtualenvwrapper.sh
fi

# GITHUB
export GITHUB_ROOT="$HOME/GitHub/"

# NODE
ulimit -n 10000 # SET SO THAT EMFILE error clears

# WP-CLI Bash completions
autoload bashcompinit
bashcompinit


# POWERLINE REPOS
source "$HOME/Desktop/ASSETS/DEVELOPMENT/PYTHON/REPOS/powerline/powerline/bindings/zsh/powerline.zsh"


# OLD / UNUSED
# export PATH="/usr/local/bin/node:$PATH" # NODE
# export PATH="$(brew --prefix php55)/bin:$PATH" #PHP
# export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376 # DOCKER

# if [[ $(boot2docker status) == 'running' ]]; then
#     $(boot2docker shellinit)
# fi
# source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.zsh


