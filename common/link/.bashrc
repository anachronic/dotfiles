#
# ~/.bashrc
#

# If not running interactively, don't do anything
PS1='[\u@\h \W]\$ '

[[ $- != *i* ]] && return

# application specific stuff
export RANGER_LOAD_DEFAULT_RC=FALSE
# eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa)

# redefs
alias e='nvim'
alias vi='nvim'
alias vim='nvim'
# Navigation
alias ls='ls --color=auto'
alias l='ls --color=auto -lF'
alias la='ls --color=auto -alF'
alias ..='cd ..'
alias pacq='pacman -Ss'

# reloads
alias so='source ~/.bashrc'
