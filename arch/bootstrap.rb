#!/usr/bin/env ruby
# Assume ruby is installed
# Assume GNU stow is also installed

# First install official packages
packages_file = File.join(__dir__, 'packages.rb')
system("ruby #{packages_file}")

# Then install paru

# Then AUR. This might take a while

# Make ~/.config so that we don't stow EVERYTHING in .config
# This can be particularly annoying in Linux
system('mkdir -p ~/.config')
system('mkdir -p ~/.local/bin')
system('stow -v -R -t ~ -d ~/dotfiles/arch/link .')
