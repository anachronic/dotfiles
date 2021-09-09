function vim
    if which nvim > /dev/null 2>&1
        nvim $argv
    else
        vim $argv
    end
end
