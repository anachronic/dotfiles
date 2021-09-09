set -gx FZF_DEFAULT_COMMAND "rg --hidden -g '!.git' -l ''"

# Editor is neovim or vim otherwise
if which nvim > /dev/null 2>&1
    set -gx EDITOR "nvim"
else
    set -gx EDITOR "vim"
end
