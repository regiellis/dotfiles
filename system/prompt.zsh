# PROMPT ZSH- PERSONA IO
# MARCH 2013
# 

function current_rbenv {
    [ -f .rbenv-version ] && echo " $(rbenv version | awk '{print $1}')"
}

function current_venv {
    [ $VIRTUAL_ENV ] && echo ' '`basename $VIRTUAL_ENV`
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    hg root >/dev/null 2>/dev/null && echo '☿' && return
    echo '○'
}
