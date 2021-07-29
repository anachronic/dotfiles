#!/usr/bin/env ruby

def match_or_fail(str, regex)
  match = str.match(regex)

  exit(1) if match[1].nil?

  match[1]
end

def get_bluetooth_card_spec
  cards = `pactl list cards`
  cards = cards.split "\n\n"

  # TODO: Fetch the bluetooth card correctly
  cards[2]
end

def bluetooth_card_name(spec)
  match_or_fail(spec, /\tName: (.*)$/)
end

def bluetooth_card_profile(spec)
  match_or_fail(spec, /\t+Active Profile: (.*)$/)
end

def toggle
  spec_before = get_bluetooth_card_spec
  profile_before = bluetooth_card_profile(spec_before)

  case profile_before
  when 'a2dp-sink-sbc'
    next_profile = 'headset-head-unit-msbc'
  when 'headset-head-unit-msbc'
    next_profile = 'a2dp-sink-sbc'
  else
    next_profile = 'a2dp-sink-sbc'
  end

  card_name = bluetooth_card_name(spec_before)
  system("pactl set-card-profile #{card_name} #{next_profile}")

  spec_after = get_bluetooth_card_spec
  puts bluetooth_card_profile(spec_after)
end

def main
  if ARGV.empty?
    spec = get_bluetooth_card_spec
    puts bluetooth_card_profile(spec)
  elsif ARGV.length == 1 && ARGV[0] == 'toggle'
    toggle
  else
    exit 1
  end
end

if __FILE__ == $0
  main
end
