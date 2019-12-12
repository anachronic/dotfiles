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

" Make RF, which works like counsel-rg from emacs!
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --hidden -g "!.git" --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '$(echo {q} | sed "s| |.*|g")')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}

  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(options), a:fullscreen)
endfunction

command! -nargs=* -bang RF call RipgrepFzf(<q-args>, <bang>0)

" From the amazing Chris Toomey
function! s:VisualAck()
  let temp = @"
  normal! gvy
  let escaped_pattern = escape(@", "[]().*")
  let @" = temp
  execute "RF! " . escaped_pattern
endfunction
"
" Regular old ack
nnoremap <Leader>a :RF<cr>

nnoremap K :RF! <C-r><C-w><cr>
vnoremap K :<C-u>call <sid>VisualAck()<cr>
nnoremap <leader>h :Help<CR>
