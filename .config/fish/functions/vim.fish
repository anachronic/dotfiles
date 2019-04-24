function vim
    if which nvim > /dev/null 2>&1
        nvim
    else
        vim
    end
end
