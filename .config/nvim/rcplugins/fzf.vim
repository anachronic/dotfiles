Plug 'junegunn/fzf.vim'
if has("unix")
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        set rtp+=/usr/local/opt/fzf
        Plug '/usr/local/opt/fzf'
    else
        Plug '~/forks/fzf'
    endif
endif

nnoremap <C-p> :Files<CR>
nnoremap <Leader><Leader> :Buffers<CR>
nnoremap <Leader>a :Rg<Space>

