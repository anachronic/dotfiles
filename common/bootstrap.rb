#!/usr/bin/env ruby
# Assume ruby is installed
# Assume GNU stow is also installed

# Make ~/.config so that we don't stow EVERYTHING in .config
# This can be particularly annoying in Linux
system('mkdir -p ~/.config')
system('mkdir -p ~/.config')
system('stow -v -R -t ~ -d ~/dotfiles/common/link .')
