# .zshrc
# Sanity for this century
unsetopt flow_control

# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit

# Prompt. what a headache
# This is stolen from @wincent. Show as many dollars/hashes depending on the
# level of the shell
local LVL=$(($SHLVL - 1))

if [[ $EUID -eq 0 ]]; then
    local SUFFIX=$(printf '#%.0s' {1..$LVL})
else
    local SUFFIX=$(printf '$%.0s' {1..$LVL})
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
zstyle ':vcs_info:git*:*' formats '%B%F{003}[%f%F{074}%b%f%%b|%c%u%B%F{003}]%f%%b '
zstyle ':vcs_info:git*:*' actionformats '%B%F{003}[%f%F{074}%b%f%%b|%a%c%u%B%F{003}]%f%%b '

function +vi-git-untracked() {
  emulate -L zsh
  if [[ -n $(git ls-files --exclude-standard --others 2> /dev/null) ]]; then
    hook_com[unstaged]+="%B%F{blue}*%f%b"
  fi
}

# It's worth saying the sources of this:
# colors from https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
# codes from http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
PROMPT='%F{177}%~%f ${vcs_info_msg_0_}%B%F{131}%(?..!)%f%F{blue}$SUFFIX%f%b '
RPROMPT='%F{006}%n%f@%F{041}%m'

# Application-needed exports
export FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"
export RANGER_LOAD_DEFAULT_RC=FALSE

# Aliases
source ~/.zsh/aliases
