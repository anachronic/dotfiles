Plug 'tpope/vim-dispatch'

autocmd FileType javascript let b:dispatch = 'npx vue-cli-service test:unit %'
let g:dispatch_compilers = {
    \ 'npx vue-cli-service test:unit': 'vue'
    \ }
