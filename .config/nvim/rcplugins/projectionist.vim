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
      \         'src/{dirname}/{basename}.ts',
      \         'src/{dirname}/{basename}.js',
      \       ],
      \       'type': 'jest'
      \     },
      \     '*.test.js': {
      \       'alternate': '{basename}.js',
      \       'type': 'test',
      \     },
      \     '*.py': {
      \       'alternate': '{dirname}/tests/test_{basename}.py',
      \       'type': 'source'
      \     },
      \     '**/tests/test_*.py': {
      \       'alternate': '{dirname}/{basename}.py',
      \       'type': 'test'
      \     },
      \     '**/tests/views/test_*.py': {
      \       'alternate': '{dirname}/views/{basename}.py',
      \       'type': 'test'
      \     },
      \   }
      \ }
