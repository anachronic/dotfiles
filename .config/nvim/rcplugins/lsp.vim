Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

autocmd BufEnter * lua require'completion'.on_attach()
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
