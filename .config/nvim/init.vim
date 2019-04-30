" My vimrc for neovim.

" Need to set this before plugin initialization.
let mapleader = "\<Space>"

" Fish people suggest that we do this
if &shell =~# 'fish$'
    set shell=sh
endif

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

call s:SourceConfigFilesIn('snippets')

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

" Hopefully this ends up always showing vim in english
set langmenu=en_US
let $LANG = 'en_US'

" Still can't believe these are not default
set nojoinspaces
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set splitright
set noswapfile

" Theme config
set background=light
colorscheme PaperColor
set cursorline

" Folding
set foldmethod=indent
set foldlevel=99

" Leader remaps
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>k :bd<CR>
nnoremap <leader>; :

" This is mostly taken from christoomey's vimrc
" Convenience
nnoremap j gj
nnoremap k gk
nnoremap <Esc> <Esc>:noh<CR>

" Swap 0 and ^. I tend to want to jump to the first non-whitespace character
" so make that the easier one to do.
nnoremap 0 ^
nnoremap ^ 0

" Meta remaps
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Ctrl remaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-s> :w<CR>

" Insert renamps
inoremap <C-v> <C-o>P
