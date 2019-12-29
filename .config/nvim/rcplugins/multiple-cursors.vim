Plug 'terryma/vim-multiple-cursors'

func! Multiple_cursors_before()
    let b:lexima_disabled = 1
endfunc

func! Multiple_cursors_after()
    let b:lexima_enabled = 1
endfunc
