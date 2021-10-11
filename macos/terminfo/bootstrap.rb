#!/usr/bin/env ruby

# First make the terminfo dir
system "mkdir -p ~/.terminfo"

# Then compile the new terminfo database
Dir[File.join(__dir__, '*.terminfo')].each do |terminfo|
  system "tic -o ~/.terminfo #{terminfo}"
end

puts
puts "terminfo installed"
