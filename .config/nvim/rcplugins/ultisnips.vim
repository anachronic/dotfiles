Plug 'SirVer/ultisnips'

let g:UltiSnipsSnippetDirectories=["ultisnips"]
let g:UltiSnipsExpandTrigger="<tab>"

if has('mac')
    let g:UltiSnipsSnippetsDir = "/Users/nsalas/.config/nvim/ultisnips"
else
    let g:UltiSnipsSnippetsDir = "/home/nsalas/.config/nvim/ultisnips"
endif

