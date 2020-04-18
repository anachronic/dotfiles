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

" True color
set termguicolors

" Line numbers
set number
set relativenumber
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

" Hopefully this ends up always showing vim in english
set langmenu=en_US
let $LANG = 'en_US'

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

" Substitute for <Tab> in macros. Has to do with tab completion in command
" mode I think
set wildcharm=<C-z>

" allow <BS>/h/l/<Left>/<Right>/<Space>, ~ to cross line boundaries
set whichwrap=b,h,l,s,<,>,[,],~

set wildmode=longest:full,full

" shortmess, I'll comment each one
set shortmess+=A " Never print annoying swapfile messages
set shortmess+=I " No splash screen

" Split to right and below always
" can't believe there are not default
set splitright
set splitbelow

" Highlight the line where the cursor is at
set cursorline

" Allow unrestricted backspacing
set backspace=indent,start,eol

" Theme config
silent! colorscheme onehalfdark
set background=dark

" Always try syntax unless specified in /after
set foldmethod=syntax
set foldlevel=99

" This next section until the leader remaps is stolen from wincent's
if exists('$SUDO_USER')
    " don't create root-owned files
    set noswapfile
else
    set directory=~/.config/nvim/tmp/swap//     " keep swap files out of the way
endif

if has('persistent_undo')
    " don't create root-owned files
    if exists('$SUDO_USER')
        set noundofile
    else
        " keep undo files out of the way
        set undodir=~/.config/nvim/tmp/undo
        " actually use undo files
        set undofile
    endif
endif

if has('mksession')
    " override ~/.vim/view default
    set viewdir=~/.config/nvim/tmp/view

    " save/restore just these (with `:{mk,load}view`)
    set viewoptions=cursor,folds
endif


" Leader remaps
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>o :on<CR>
nnoremap <leader>k :bd<CR>
nnoremap <leader>; :
nnoremap <leader>c *Ncgn
nnoremap <leader>y :call CopyFilePathToClipboard()<CR>

" This is mostly taken from christoomey's vimrc
" Convenience
nnoremap j gj
nnoremap k gk
nnoremap <Esc> <Esc>:execute "normal \<Plug>(LoupeClearHighlight)"<CR>

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

" Command remaps
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Quickfix maps
nnoremap <Down> :cnext<CR>
nnoremap <Up> :cprevious<CR>

" Stolen from wincent!
" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

" Insert renamps
inoremap <C-v> <C-o>P:noh

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
