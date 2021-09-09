# Application-needed exports
export FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"
export SKIM_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"

# This should be removed soon
export RANGER_LOAD_DEFAULT_RC=FALSE

# Editor is nvim
export EDITOR='nvim'

# Pager: less
export PAGER='less'

# Terminal is kitty
export TERMINAL='kitty'

# macOS colored ls
export CLICOLOR=1

# Always use UTF-8
export LC_ALL=en_US.UTF-8

# see https://unix.stackexchange.com/a/62599
# This avoids path duplication and $path is an array
typeset -U path

# First party paths
path+=($HOME/.local/bin $HOME/dotfiles/bin)

# Vendor paths
export WORKON_HOME=$HOME/.virtualenvs
export NVM_DIR="$HOME/.nvm"
export SDKMAN_DIR="$HOME/.sdkman"
