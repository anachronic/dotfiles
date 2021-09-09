#
# ~/.bashrc
#

# If not running interactively, don't do anything
PS1='[\u@\h \W]\$ '

[[ $- != *i* ]] && return

# application specific stuff
export RANGER_LOAD_DEFAULT_RC=FALSE
eval $(keychain --eval --quiet id_rsa ~/.ssh/id_rsa)

# redefs
alias e='nvim'
alias vi='nvim'
alias vim='nvim'

# Navigation
alias ls='ls --color=auto'
alias l='ls --color=auto -lF'
alias la='ls --color=auto -alF'
alias ..='cd ..'

# git and any vc commands
alias gcl='git clone'
alias gst='git status'
alias gc='git commit --verbose'
alias gup='git pull --rebase'
alias gp='git push'
alias gco='git checkout'

# pacman & AUR
alias pacin='sudo pacman -S'
alias pacrem='sudo pacman -R'
alias pacloc='pacman -Qs'
alias pacupg='sudo pacman -Syu'
alias pacupd='sudo pacman -Sy'
alias pacq='pacman -Ss'
alias aurin='aurman -S --noedit'
alias aurq='aurman --aur -Ss'

# configs
alias i3c='vim ~/.config/i3/config'
alias brc='vim ~/.bashrc'
alias xdef='vim ~/.Xdefaults'
alias pcfg='vim ~/.config/polybar/config'
alias vcd='cd ~/.config/nvim/'
alias vrc='vim ~/.config/nvim/init.vim'
alias rrc='vim ~/.config/ranger/rc.conf'

# reloads
alias so='source ~/.bashrc'
