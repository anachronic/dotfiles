Plug '/usr/share/vim/vimfiles'
Plug 'junegunn/fzf.vim'

" This makes FZF really usable...
let $FZF_DEFAULT_COMMAND="rg --hidden -g '!.git' -l ''"

" Mappings
nnoremap <C-p> :Files<CR>
nnoremap <leader>a :Ag<space>

" A special rg command, not really sure on its use yet since it matches file
" names, but could be useful with some tweaks.
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

