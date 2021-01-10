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

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
