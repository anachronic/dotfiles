" This is a MINIMAL vimrc intended to be used with vscode

" Need to set this before plugin initialization.
let mapleader = "\<Space>"

" Line numbers
set scrolloff=3

" Use the system clipboard
set clipboard+=unnamedplus

" Allow to hide buffer with unsaved changes without being prompted
set hidden

" This remap allows execution of macros on visual lines
" Taken from https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

function! CopyFilePathToClipboard()
  let @+=expand("%")
endfunction

" Don't autoinsert two spaces when joining
set nojoinspaces

" Indent to 4, use spaces over tabs
" These could be overriden by editorconfig or lang specific settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Use the mouse. It's 2020, for christ's sake
set mouse=a

" allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set whichwrap=b,h,l,s,<,>,[,],~

" Allow unrestricted backspacing
set backspace=indent,start,eol

" Always try syntax unless specified in /after
set foldmethod=syntax
set foldlevel=99

" Leader remaps
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>k :bd<CR>
nnoremap <leader>; :
nnoremap <leader>c *Ncgn
nnoremap <leader>y :call CopyFilePathToClipboard()<CR>

" See https://github.com/asvetliakov/vscode-neovim/issues/58
" Need nmap for folding to work correctly
nmap j gj
nmap k gk

" This is mostly taken from christoomey's vimrc
" Convenience
nnoremap Y y$

" Swap 0 and ^. I tend to want to jump to the first non-whitespace character
" so make that the easier one to do.
nnoremap 0 ^
nnoremap ^ 0

" Ctrl remaps
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-s> :w<CR>

" Command remaps
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Quickfix maps
nnoremap <Down> :cnext<CR>
nnoremap <Up> :cprevious<CR>

" Remap quote shortcuts
nnoremap ciq ci"
nnoremap caq ca"
nnoremap viq vi"
nnoremap vaq va"
nnoremap diq di"
nnoremap daq da"
nnoremap yiq yi"
nnoremap yaq ya"

" Remap paren shortcuts
nnoremap ci0 ci)
nnoremap ca0 ca)
nnoremap vi0 vi)
nnoremap va0 va)
nnoremap di0 di)
nnoremap da0 da)
nnoremap yi0 yi)
nnoremap ya0 ya)

" VSCode remapping
xmap gc  <Plug>VSCodeCommentary
nmap gc  <Plug>VSCodeCommentary
omap gc  <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap <silent> za :call VSCodeNotify('editor.toggleFold')<CR>
nnoremap <silent> zc :call VSCodeNotify('editor.fold')<CR>
nnoremap <silent> zo :call VSCodeNotify('editor.unfold')<CR>
nnoremap <silent> zC :call VSCodeNotify('editor.foldRecursively')<CR>
nnoremap <silent> zO :call VSCodeNotify('editor.unfoldRecursively')<CR>
nnoremap <silent> zM :call VSCodeNotify('editor.foldAll')<CR>
nnoremap <silent> zR :call VSCodeNotify('editor.unfoldAll')<CR>

call plug#begin('~/.config/nvim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
call plug#end()

let g:sneak#use_ic_scs = 1

