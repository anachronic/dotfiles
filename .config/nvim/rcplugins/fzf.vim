Plug 'junegunn/fzf.vim'
if has("unix")
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        set rtp+=/usr/local/opt/fzf
        Plug '/usr/local/opt/fzf'
    else
        Plug '~/forks/fzf'
        Plug '~/.fzf'
    endif
endif

nnoremap <C-p> :Files<CR>
nnoremap <Leader><Leader> :Buffers<CR>

" The quickfix from Ack.vim is way better than :Rg from fzf. :(
Plug 'mileszs/ack.vim'

" Prefer ag over default
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Prefer ripgrep over anything
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Regular old ack
nnoremap <Leader>a :Ack<Space>

" From the amazing Chris Toomey
function! s:VisualAck()
  let temp = @"
  normal! gvy
  let escaped_pattern = escape(@", "[]().*")
  let @" = temp
  execute "Ack! '" . escaped_pattern . "'"
endfunction

nnoremap K :Ack! '<C-r><C-w>'<cr>
vnoremap K :<C-u>call <sid>VisualAck()<cr>
nnoremap <leader>h :Help<CR>
