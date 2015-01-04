PROMPT='%{$fg[cyan]%}[%c]$(git_prompt_info)$(hg_prompt_info)%{$reset_color%}'
RPROMPT='%{$fg[red]%}%p$(virtualenv_prompt_info)%{$reset_color%} %{$fg[red]%}⮂%{$reset_color%}%{$fg[white]%}%{$bg[red]%} %? %{$reset_color%}'

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[red]%}(env):%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%} %{$fg[yellow]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}*%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"

ZSH_THEME_HG_PROMPT_PREFIX="%{$reset_color%} %{$fg[yellow]%}["
ZSH_THEME_HG_PROMPT_DIRTY="%{$fg[red]%}*%{$fg[yellow]%}"
ZSH_THEME_HG_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_HG_PROMPT_CLEAN=""
