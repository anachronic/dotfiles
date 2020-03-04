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
endfunction

augroup AnachronicColors
    autocmd!
    autocmd ColorScheme * call AnachronicHighlights()
augroup END
