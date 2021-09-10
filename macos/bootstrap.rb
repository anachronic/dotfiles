#!/usr/bin/env ruby

require 'mkmf'

def ask_cmd_perm(cmd)
  puts "I want to run `#{cmd}`. You sure? [y/n]"
  response = gets.chomp

  exit 1 unless response == 'y'

  system cmd
end

def has_cmd(cmd)
  return !find_executable(cmd).nil?
end

# Get homebrew first
if has_cmd('brew')
  puts "You seem to already have brew installed, so I'm going to skip installation"
else
  ask_cmd_perm '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
end

# Then make sure both stow and ruby are correctly installed
ask_cmd_perm 'zsh -c "brew install stow ruby"'

# Then create folders so that stow doesn't take full ownership
system 'mkdir -p ~/.config/karabiner/'

# Then do link everything before stuff gets the chance to do it before you do
system 'stow -v -R -t ~ -d ~/dotfiles/macos/link .'

# Then go ahead and install everything from brewfile