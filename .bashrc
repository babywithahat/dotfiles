#
# ~/.bashrc
#

# If not running interactively, don't do anything
export EDITOR=vim
export LANG=en_US.UTF-8
export LANGUAGE="en_US:en_AU:en_GB:en"
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
