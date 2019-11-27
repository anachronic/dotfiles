Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
      \   '*': {
      \     '*.c': {
      \       'alternate': '{}.h',
      \       'type': 'source'
      \     },
      \     '*.h': {
      \       'alternate': '{}.c',
      \       'type': 'header'
      \     },
      \     'src/*.vue': {
      \       'alternate': [
      \         'tests/unit/{dirname}/{basename}.spec.js',
      \         'tests/unit/{dirname}/{basename}.spec.ts',
      \         '{dirname}/{basename}.test.js',
      \       ],
      \       'type': 'vue'
      \     },
      \     'tests/unit/*.spec.js': {
      \       'alternate': [
      \         'src/{dirname}/{basename}.vue',
      \       ],
      \       'type': 'jest'
      \     },
      \     '*.test.js': {
      \       'alternate': '{basename}.js',
      \       'type': 'test',
      \     },
      \   }
      \ }
