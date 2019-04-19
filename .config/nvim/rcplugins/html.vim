Plug 'mattn/emmet-vim'

" We expand emmet with tab
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" This is great for html
Plug 'valloric/MatchTagAlways'

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'eruby' : 1,
    \ 'vue' : 1,
    \}
