" This colorizes hex colors and whatnot
Plug 'chrisbra/Colorizer'

" I just use solarized and get it over with
Plug 'lifepillar/vim-solarized8'

" Dracula
Plug 'dracula/vim'

" onehalf
Plug 'sonph/onehalf', {'rtp': 'vim/'}

function! AnachronicHighlights() abort
    highlight Folded gui=NONE guibg=#313640 guifg=#5c6370
    highlight CocErrorVirtualText gui=italic cterm=italic guifg=#cc6666
    highlight CocErrorSign guifg=#cc6666

    highlight CocWarningSign  ctermfg=Brown guifg=#d75f00
    highlight CocWarningVirtualText gui=italic cterm=italic ctermfg=Brown guifg=#ff922b
endfunction

augroup AnachronicColors
    autocmd!
    autocmd ColorScheme * call AnachronicHighlights()
augroup END
