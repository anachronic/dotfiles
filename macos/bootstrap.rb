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

# After that, install the keyboard bundle
ask_cmd_perm 'sudo mkdir -p "/Library/Keyboard Layouts"'

kb_layout_path = File.join(File.dirname(__FILE__), 'kblayout', 'us-intl-altgr-dead.bundle')
ask_cmd_perm "sudo cp -R '#{kb_layout_path}' '/Library/Keyboard Layouts'"

# Set defaults
defaults_bootstrap = File.join(__dir__, 'defaults', 'bootstrap.rb')
system "ruby #{defaults_bootstrap}"

# Set up terminfo
terminfo_bootstrap = File.join(__dir__, 'terminfo', 'bootstrap.rb')
system "ruby #{terminfo_bootstrap}"

# Then go ahead and install nvm
nvm_bootstrap = File.join(__dir__, 'nvm', 'bootstrap.rb')
system "ruby #{nvm_bootstrap}"

# Then go ahead and install everything from brewfile
