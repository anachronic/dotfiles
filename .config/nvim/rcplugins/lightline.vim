Plug 'itchyny/lightline.vim'

let lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }


let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'filename', 'readonly', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ }
function! LightLineFilename()
  return expand('%')
endfunction
