Plug 'scrooloose/nerdtree'

nnoremap <A-1> :NERDTreeToggle<CR>
nnoremap <leader>gf :NERDTreeFind<CR>

" I use this so much that I feel like it needs a better shortcut
" I used to have C-x j mapped in emacs so j makes senese
" Mnemonic is 'jump'
nnoremap <leader>j :NERDTreeFind<CR>

let g:NERDTreeIgnore = ['\~$', '__pycache__']
