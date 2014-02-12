#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#


#tab completion stuff
zstyle ':completion:*' special-dirs true 
zstyle ':completion:*' menu select
autoload -Uz compinit
compinit
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*:default' menu 'select=0'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' list-colors '=(#b) #([0-9]#)*=36=31'

alias ls='ls --color'
alias l='ls -lFh'

autoload -Uz promptinit
promptinit
autoload -U colors && colors
PROMPT="%{$fg[yellow]%}[%n@%M %{$fg_bold[blue]%}%~%{$fg_no_bold[yellow]%}]$ "
RPROMPT="%{$fg_bold[yellow]%}%t%{$reset_color%}"
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

# how baby jesus wants it
export EDITOR="vim"

#ctrl arrows
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

#page up and down
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history

#begin and end
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

#delete
bindkey '^[[3~' delete-char

alias gaa='git add --all'
alias gst='git status'
alias gsts='git status -s'
alias gdt='git difftool'
alias gtpsh='git push'


case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0; %~\a"}
    preexec () {print -Pn "\e]0;$3\a"}
  ;;
esac
## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
