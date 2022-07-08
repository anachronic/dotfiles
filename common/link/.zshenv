# XDG defs. Mostly linux but doesn't hurt macOS
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Application-needed exports
export FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"
export SKIM_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

# theming
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtkrc-2.0
export QT_QPA_PLATFORMTHEME=qt5ct

# This should be removed soon
export RANGER_LOAD_DEFAULT_RC=FALSE

# default terminal apps
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export TERMINAL='alacritty'

# macOS colored ls
export CLICOLOR=1

# Always use UTF-8
export LC_ALL=en_US.UTF-8

# see https://unix.stackexchange.com/a/62599
# This avoids path duplication and $path is an array
typeset -U path

# First party paths
path+=($HOME/.local/bin)
path+=($HOME/.cargo/bin)
path+=($HOME/go/bin)

# Vendor paths
export WORKON_HOME=$HOME/.virtualenvs
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"

# I hate to have to do this
[ -f "$HOME/.zsh/work.sh" ] && source "$HOME/.zsh/work.sh"
