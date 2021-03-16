Plug 'tpope/vim-fugitive'
" Plug 'sodapopcan/vim-twiggy'
Plug 'kdheepak/lazygit.nvim'

nnoremap <Leader>gg :LazyGit<CR>

" Open fugitive in a new tab.
nnoremap <Leader>gt :tabe<CR>:Gstatus<CR><C-w>k:q<CR>
