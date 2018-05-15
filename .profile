# Application-needed exports
export FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"
export RANGER_LOAD_DEFAULT_RC=FALSE
export EDITOR=nvim
export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$PATH:$HOME/dotfiles/bin"

# ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval "$(<~/.ssh-agent-thing)" > /dev/null
fi
