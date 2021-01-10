Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set signcolumn=yes
set shortmess+=c
set updatetime=300

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use leader+k to show documentation in preview window
nnoremap <silent> gh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Default extensions
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-vetur', 
  \ 'coc-css', 
  \ 'coc-html', 
  \ 'coc-solargraph', 
  \ 'coc-python', 
  \ 'coc-git', 
  \ 'coc-actions', 
  \ 'coc-tailwindcss', 
  \ 'coc-pairs', 
  \ ]

" \ 'coc-pairs', 
nnoremap <F6> :CocAction<CR>
nnoremap <C-n> :CocCommand actions.open<CR>

" Trigger autocomplete with C-q
inoremap <silent><expr> <c-q> coc#refresh()

command! -nargs=0 Format :call CocAction('format')
nnoremap <leader><CR> :Format<CR>

let g:coc_filetype_map = {
    \ 'javascript.jest': 'javascript',
    \ 'typescript.jest': 'typescript'
    \ }

" something about tab completion, not sure if it'll work
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" K for documentation, I might want to change it to hover
nnoremap <silent> K :call <SID>show_documentation()<CR>
