Plug 'tpope/vim-fugitive'
Plug 'sodapopcan/vim-twiggy'

nnoremap <Leader>gg :Gstatus<CR>

" Open fugitive in a new tab.
nnoremap <Leader>gt :tabe<CR>:Gstatus<CR><C-w>k:q<CR>
