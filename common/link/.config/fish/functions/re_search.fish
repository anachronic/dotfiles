function re_search
	history -z | fzf --read0 --height=10 --exact --tiebreak=index | perl -pe 'chomp if eof' | read -lz result
    and commandline -- $result
    commandline -f repaint
end
