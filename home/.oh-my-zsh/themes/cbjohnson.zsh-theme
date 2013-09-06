# FILE: cbjohnson.zsh-theme
# DESCRIPTION: oh-my-zsh theme file.
# AUTHOR: Charles B Johnson (mail@cbjohnson.info)
# BASED ON: kphoen
# VERSION: 1.0.0


if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
    PROMPT=$'
%{$fg_bold[red]%}%m # %~%{$reset_color%}$(git_prompt_info)$(git_prompt_status)
%{$fg_bold[green]%}%n %# '
    ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg_bold[magenta]%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
    ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[cyan]%} ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ="
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%} ✗"
else
    PROMPT='%~$(git_prompt_info)$(git_prompt_status)
%# '

    ZSH_THEME_GIT_PROMPT_PREFIX=" on"
    ZSH_THEME_GIT_PROMPT_SUFFIX=""
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
    ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
    ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
    ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
    ZSH_THEME_GIT_PROMPT_UNMERGED=" ="
    ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"
fi