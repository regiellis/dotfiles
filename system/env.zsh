# ENV ZSH - PERSONA IO
# MARCH 2013

# EDITOR --------------------------
export EDITOR="$(which subl) --new-window --wait"


# PATHS --------------------------
PATH="$HOME/bin:/usr/local/share/python:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin:$PATH"
export MANPATH="/usr/local/share/man:/usr/X11/man:/usr/share/man:$MANPATH"
export PATH="/usr/local/bin/node:$PATH" # NODE 
export PATH="$HOME/.rbenv/bin:$PATH" # RBENV
export PATH="/usr/local/share/npm/bin:$PATH" # NPM BIN
export PATH="/usr/local/Cellar/php53/5.3.17/bin:$PATH" # PHP
export PATH="/usr/local/bin/gsutil:$PATH" # GOOGLE UTILS
export PATH="/usr/local/Cellar/ssh-copy-id/6.0p1/bin:$PATH" # SSH COPY
export PATH="/usr/local/heroku/bin:$PATH" # HEROKU TOOLBELT

# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# PYTHON
export PIP_RESPECT_VIRTUALENV="true"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python"
export VIRTUALENVWRAPPER_HOOK_DIR="/Users/regi/.virtualenvs"
export WORKON_HOME="$HOME/www/apps/Python"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

if [[ -f `brew --prefix`/usr/local/bin/virtualenvwrapper.sh ]]; then
    . `brew --prefix`/usr/local/bin/virtualenvwrapper.sh
fi

# GITHUB
export GITHUB_ROOT="/Users/regi/GitHub/"

# SENCHA EXPORTS
export PATH="/Applications/SenchaSDKTools:$PATH"
export PATH="/Applications/SenchaSDKTools/command:$PATH"
export PATH="/Applications/SenchaSDKTools/jsbuilder:$PATH"
export PATH="/Applications/SenchaSDKTools/appbuilder:$PATH"

