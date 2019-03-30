Plug 'mattn/emmet-vim'

function! EmmetOrUltiSnips()
  if getline('.') =~ '[<>]'
    return "\<plug>(emmet-expand-abbr)"
  else
    return "\<plug>(UltiSnips#ExpandSnippet)"
  endif
endfunction
let g:UltiSnipsExpandTrigger = '<F9>'
imap <expr> <tab> EmmetOrUltiSnips()
