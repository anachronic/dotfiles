# .zshrc
# Sanity for this century
unsetopt flow_control

# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Using emacs mode
bindkey -e

# Edit long commands using $EDITOR
# https://nuclearsquid.com/writings/edit-long-commands/
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

my-backward-delete-word() {
    local WORDCHARS=${WORDCHARS/\//}
    zle backward-delete-word
}
zle -N my-backward-delete-word
bindkey '^W' my-backward-delete-word

# go ahead and use some history. christ
HISTFILE=~/.zhistory
HISTSIZE=SAVEHIST=10000
setopt sharehistory
setopt extendedhistory

# Don't put commands that start with a space into history
setopt histignorespace

# tmux create/attach to session with name $PWD
function t() {
    local dirname=$(basename $PWD)

    if tmux has-session -t $dirname; then
        tmux attach -t $dirname
    else
        tmux new -s $dirname
    fi
}

# Prompt. what a headache
# This is stolen from @wincent. Show as many dollars/hashes depending on the
# level of the shell
local LVL=$(($SHLVL - 1))

if [[ $EUID -eq 0 ]]; then
    local SUFFIX=$(printf '#%.0s' {1..$LVL})
else
    local SUFFIX=$(printf '❯%.0s' {1..$LVL})
fi
setopt prompt_subst

# Next is version control
autoload -Uz vcs_info
precmd() {
    vcs_info
}

# This is mostly stolen from wincent's
zstyle ':vcs_info:*' use_simple true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%B%F{green}*%f%b'
zstyle ':vcs_info:*' unstagedstr '%B%F{red}*%f%b'
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
zstyle ':vcs_info:git*:*' formats '%B%F{003}[%f%F{074}%b%f%%b%c%u%B%F{003}]%f%%b '
zstyle ':vcs_info:git*:*' actionformats '%B%F{003}[%f%F{074}%b%f%%b%a%c%u%B%F{003}]%f%%b '

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%B%F{blue}*%f%b"
  fi
}

# It's worth saying the sources of this:
# colors from https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# codes from http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# shorten prompt from https://unix.stackexchange.com/a/273567
PROMPT='%B%F{005}%n@%m%f%b:%F{13}%1~%f ${vcs_info_msg_0_}%B%F{003}%(1j.&.)%f%F{131}%(?..!)%f%F{blue}$SUFFIX%f%b '
RPROMPT='%F{176}%/%f'

# From wincent's
# I've started to C-z neovim a lot lately
# Make CTRL-Z background things and unbackground them.
function fg-bg() {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
  else
    zle push-input
  fi
}
zle -N fg-bg
bindkey '^Z' fg-bg

# Tmuxinator support
if which tmuxinator &> /dev/null
then
    source ~/.zsh/tmuxinator.zsh
fi

# colors in man/less
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Aliases
source ~/.zsh/aliases

export PATH="$PATH:$HOME/.local/bin"

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# jumping around with z
[ -e ~/.z ] || touch ~/.z
[ -f ~/dotfiles/.zsh/z.sh ] && source ~/dotfiles/.zsh/z.sh

if [ "$(uname)" = "Darwin" ]; then
    export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/opt/openssl/lib/"
fi

# Rbenv!
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/nsalas/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

###-tns-completion-start-###
if [ -f /Users/nsalas/.tnsrc ]; then 
    source /Users/nsalas/.tnsrc 
fi
###-tns-completion-end-###

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
