#!/usr/bin/env ruby

# ok, this is VERY janky, but i just want to get this done
def default(key, rest)
  cmd = "defaults write #{key} #{rest}"
  puts cmd
  system cmd
end

# Set all defaults here
default 'com.apple.dock', '"autohide" -bool "true"'     # Autohide dock
default 'com.apple.dock', '"mru-spaces" -bool "false"'  # Don't rearrange spaces in a mru-way
default '-g', 'InitialKeyRepeat -int 20'                # This is some unintelligible shit
default '-g', 'KeyRepeat -int 2'                        # Same as above. read https://gist.github.com/hofmannsven/ff21749b0e6afc50da458bebbd9989c5
default 'com.apple.finder', '"ShowPathbar" -int 1'      # Show pathbar below in finder

# Doesn't seem to work at all
default 'com.apple.menuextra.clock', '"DateFormat" -string "EEE d MMM  HH:mm"'   # Show pathbar below in finder

# Then go ahead and make post-set tasks (like killing the dock)
system 'killall Dock'
