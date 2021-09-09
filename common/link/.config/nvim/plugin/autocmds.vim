function! s:AnachronicAutocmds()
    augroup AnachronicAutocmds
        autocmd!
        autocmd FocusGained * checktime
        au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=120}
    augroup END
endfunction

call s:AnachronicAutocmds()
