" Needs to be here to stop neovim builtin ftplugin from messing with it

" Stop auto commenting everywhere
" needs autocmd because neovim builtins explicitly set formatoptions
autocmd FileType * set formatoptions=jql
