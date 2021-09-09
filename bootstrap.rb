#!/usr/bin/env ruby

def default_install
  uname = `uname`.chomp

  is_mac = uname == 'Darwin'
  is_linux = uname == 'Linux'
  is_unknown = !is_mac && !is_linux

  installing = %w[common]

  installing << 'arch' if is_linux
  installing << 'macos' if is_mac

  if installing.size == 1
    puts "I don't know your system. I'm just going to install common. You sure? [y/n]"
    response = gets.chomp

    exit 1 unless response == 'y'
  else
    puts "I'm going to install the following: #{installing.join ', '}"
    puts 'Are you sure? [y/n]'
    response = gets.chomp

    exit 1 unless response == 'y'
  end

  install_modules installing
end

def install_modules(modules)
  modules.each do |m|
    puts "=== Installing #{m}"
    system("ruby ./#{m}/bootstrap.rb")
    puts
  end
end

default_install
