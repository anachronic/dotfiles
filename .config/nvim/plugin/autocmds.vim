function! s:AnachronicAutocmds()
    augroup AnachronicAutocmds
        autocmd!
        autocmd FocusGained * checktime
    augroup END
endfunction

call s:AnachronicAutocmds()
