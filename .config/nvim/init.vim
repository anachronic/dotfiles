" My vimrc for neovim.

" Need to set this before plugin initialization.
let mapleader = "\<Space>"

" Architecture mostly copied from Chris Toomey's
function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

" First we load the plugins
call plug#begin('~/.config/nvim/plugged')
call s:SourceConfigFilesIn('rcplugins')
call plug#end()

" Then we load own configs.
" I may move this to their separate files if the config gets too big
filetype plugin indent on
set termguicolors
set relativenumber
set scrolloff=3
set number
set clipboard+=unnamedplus
set hidden

" This remap allows execution of macros on visual lines
" Taken from https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Still can't believe these are not default
set nojoinspaces
set tabstop=4
set shiftwidth=4
set expandtab

" Theme config
" colorscheme jellybeans
set background=light
set background=dark

" Leader remaps
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>k :bd<CR>
nnoremap <leader><leader> <C-6>

" Meta remaps
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Ctrl remaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-s> :w<CR>
nnoremap <C-g> <C-[>
inoremap <C-g> <C-[>
