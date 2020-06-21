Plug 'itchyny/lightline.vim'

let g:lightline = {
      \ 'colorscheme': 'onehalfdark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'cocstatus', 'currentstatus' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename',
      \   'cocstatus': 'ach#coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ 'component': {
      \   'fileencoding': '%{&fenc!=#""?&fenc:&enc}%<',
      \ }
      \ }


function! LightLineFilename()
  return expand('%')
endfunction

" Coc integration
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

