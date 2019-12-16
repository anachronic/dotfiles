imap <buffer> <expr><tab>
  \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
  \ emmet#isExpandable() ? "\<Plug>(emmet-expand-abbr)" :
  \ pumvisible() ? "\<C-n>" :
  \ "\<tab>"
