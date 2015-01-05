# ENV ZSH - PERSONA IO
# JAN 2015

# EDITOR --------------------------
export EDITOR="$(which subl) --new-window --wait"

# PATHS --------------------------

PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH"
export PATH="$HOME/Android/sdk/tools:$PATH" # ANDROID
export PATH="$HOME/Android/sdk/platform-tools:$PATH" #ANDROID
export PATH="/Users/regi/.node/bin:$PATH" # NPM BIN
export GITHUB_ROOT="$HOME/GitHub/:$PATH" # GITHUB

export DOCKER_TLS_VERIFY=1
export DOCKER_TLS=yes
export DOCKER_HOST=tcp://192.168.59.103:2376 # DOCKER

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

# POWERLINE REPOS
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# source "$HOME/Desktop/ASSETS/DEVELOPMENT/PYTHON/REPOS/powerline/powerline/bindings/zsh/powerline.zsh"

# OLD / UNUSED
# if [[ $(boot2docker status) == 'running' ]]; then \
#     export DOCKER_TLS_VERIFY=0
#     export DOCKER_TLS=yes
#     export DOCKER_HOST=tcp://192.168.59.103:2376 # DOCKER
#     $(boot2docker shellinit)
# fi
# if [[ -f `brew --prefix`/usr/local/bin/virtualenvwrapper.sh ]]; then
#     . `brew --prefix`/usr/local/bin/virtualenvwrapper.sh
# fi
# export SASS_LIBSASS_PATH="/Users/hcatlin/path/libsass:$SASS_LIBSASS_PATH" #LEESC
# export MANPATH="/usr/local/share/man:/usr/share/man:$MANPATH"
# export PATH="/usr/local/heroku/bin:$PATH" # HEROKU TOOLBELT
# export PATH="/usr/local/share/npm/bin:$PATH" # NPM BIN
# export PATH="/usr/local/bin/node:$PATH" #NODE
# export PATH="/usr/local/bin/npm:$PATH" #NPM
# export RBENV_ROOT="/usr/local/var/rbenv:$PATH" # RBENV
# export PATH="/usr/local/bin/ssh-copy-id:$PATH" # SSH COPY
# export PATH="/usr/local/bin/gsutil:$PATH" # GOOGLE UTILS
# NODE
# ulimit -n 10000 # SET SO THAT EMFILE error clears
# export ARCHFLAGS="-arch x86_64"

# WP-CLI Bash completions
# autoload bashcompinit
# bashcompinit
#
# VIRTUALENVWRAPPER

# export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox #SLIMERJS
# export PATH="/usr/local/bin/node:$PATH" # NODE
# export PATH="$(brew --prefix php55)/bin:$PATH" #PHP
# export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2376 # DOCKER
# source $HOME/.wp-cli/vendor/wp-cli/wp-cli/utils/wp-completion.zsh
