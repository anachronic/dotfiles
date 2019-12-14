Plug 'tpope/vim-fugitive'

nnoremap <Leader>gg :Gstatus<CR>

" Open fugitive in a new tab.
nnoremap <Leader>gt :tabe<CR>:Gstatus<CR><C-w>k:q<CR>

" git gutter
Plug 'airblade/vim-gitgutter'
