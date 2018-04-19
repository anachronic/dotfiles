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
set relativenumber
set clipboard+=unnamedplus
color dracula
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Leader remaps
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>o :on<CR>

" Meta remaps
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==

" Ctrl remaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
