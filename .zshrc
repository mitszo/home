autoload -U compinit; compinit
autoload promptinit; promptinit; prompt walters

PROMPT='%B%#%b '

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

#zsh binding
bindkey -e

#
export EDITOR=vim
export LANG=ja_JP.UTF-8
export HGENCODING=utf-8

# alias
alias ls='ls -G'
alias ll='ls -l -G'

# PATH
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=~/bin:$PATH
# PATH for MySQL
export PATH=/usr/local/mysql/bin:${PATH}

export ECSHOP=$HOME/Dropbox/ecsteady/git-ecsteady/shop/
export ECBACK=$HOME/Dropbox/ecsteady/git-ecsteady/backoffice/

