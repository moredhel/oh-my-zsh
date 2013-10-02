function collapse_pwd {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '>' && return
}

function battery_charge {
    echo $(acpi | cut -d',' -f 2)
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}


PROMPT='\
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%} in %{$fg_bold[grey]%}(%{$fg_bold[green]%}%}%~%{$fg_bold[grey]%})%{$reset_color%}$(git_prompt_info)
%{$fg[magenta]%}$(battery_charge)\ %{$fg[green]%}$(prompt_char)>%{$reset_color%} %{$fg[cyan]%}'

#$(git_prompt_info)$(prompt_char)$fg[green] '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
