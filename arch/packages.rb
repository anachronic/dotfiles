#!/usr/bin/env ruby

def ask_cmd_perm(cmd)
  puts "I need sudo and I'm gonna run `#{cmd}`. continue? [y/n]"
  response = gets.chomp

  exit 1 unless response == 'y'
  system cmd
end


pacman_file = File.join(__dir__, '/pacman', '/official')
cmd = "cat #{pacman_file} | xargs sudo pacman -S --needed"

ask_cmd_perm cmd
