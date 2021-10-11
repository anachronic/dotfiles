#!/usr/bin/env ruby

# Nvm is very annoying to install because it uses curl | bash :(

def ask_cmd_perm(cmd)
  puts "I want to  run `#{cmd}`. You sure? [y/n]"
  response = gets.chomp

  exit 1 unless response == 'y'

  system cmd
end

puts 'This is a curl | bash script. USE CAUTION!!!!'
system 'mkdir -p ~/.nvm'
ask_cmd_perm 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash'
