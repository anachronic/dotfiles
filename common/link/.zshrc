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

    if tmux has-session -t $dirname 2>/dev/null 1>/dev/null ; then
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

if [ -z "${LF_LEVEL+x}" ]
then
    local LF_SUFFIX=""
else
    local LF_SUFFIX="[LF]"
fi

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

# wincent's
# Use "cbt" capability ("back_tab", as per `man terminfo`), if we have it:
if tput cbt &> /dev/null; then
  bindkey "$(tput cbt)" reverse-menu-complete # make Shift-tab go to previous completion
fi

# It's worth saying the sources of this:
# colors from https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# codes from http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
# shorten prompt from https://unix.stackexchange.com/a/273567
PROMPT='%B%F{005}%n@%m%f%b:%F{13}%1~%f ${vcs_info_msg_0_}%B%F{003}%(1j.&.)%f%F{131}%(?..!)%f%F{red}$LF_SUFFIX%f%F{blue}$SUFFIX%f%b '
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

# OSC7: cwd reporting for new shells. Mostly needed by foot. Dunno about kitty
autoload -U add-zsh-hook
function osc7 {
    local LC_ALL=C
    export LC_ALL

    setopt localoptions extendedglob
    input=( ${(s::)PWD} )
    uri=${(j::)input/(#b)([^A-Za-z0-9_.\!~*\'\(\)-\/])/%${(l:2::0:)$(([##16]#match))}}
    print -n "\e]7;file://${HOSTNAME}${uri}\e\\"
}
add-zsh-hook -Uz chpwd osc7

# ti: set window title
function ti() {
    printf "\e];$1\e\\"
}

# syntax highlighting: pacman -S zsh-syntax-highlighting
function () {
    # path might change in macOS, haven't figured it out yet
    local linuxpluginpath="/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
    local macospluginpath="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

    [ "$(uname)" = "Linux" ] && [ -e "$linuxpluginpath" ] && source "$linuxpluginpath"
    [ "$(uname)" = "Darwin" ] && [ -e "$macospluginpath" ] && source "$macospluginpath"
}

if [ $(uname) = "Linux" ]; then
    # Use GPG for ssh key caching. This is crazy
    export GPG_TTY=$(tty)
    gpg-connect-agent updatestartuptty /bye >/dev/null
fi

# Might need tuning
export VIRTUALENVWRAPPER_PYTHON=~/.local/share/pipx/venvs/virtualenvwrapper/bin/python
[ -f ~/.local/bin/virtualenvwrapper.sh ] && source ~/.local/bin/virtualenvwrapper.sh

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Rbenv!
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
