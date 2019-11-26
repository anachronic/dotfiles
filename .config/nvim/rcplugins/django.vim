" Plug 'tweekmonster/django-plus.vim'
"
" au BufNewFile,BufRead *.html set filetype=htmldjango
"
" function TryDjango()
"     if b:is_django != 1
"         set filetype=html
"     endif
" endfunction
"
" autocmd FileType html call TryDjango()
"
