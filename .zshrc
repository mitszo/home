autoload -U compinit; compinit
autoload promptinit; promptinit; prompt walters


#zsh 
setopt auto_cd
setopt correct
setopt cdable_vars

#zsh history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt append_history
setopt hist_ignore_dups
setopt hist_verify
setopt share_history

#zsh
setopt magic_equal_subst

# vcs_info
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}


#PROMPT='%B%#%b '
#RPROMPT="%1(v|%F{green}%1v%f|)"
PROMPT="%B%#%b %1(v|%F{green}%1v%f|)"


#zsh binding
bindkey -e

#
export EDITOR=vim
export LANG=ja_JP.UTF-8
export HGENCODING=utf-8

# alias
alias ls='ls -G'
alias ll='ls -l -G'



