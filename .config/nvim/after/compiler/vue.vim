if exists("current_compiler")
  finish
endif
let current_compiler = "npx vue-cli-service"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet makeprg=npx\ vue-cli-service
CompilerSet errorformat=%.%#\ at\ %f:%l:%c,%.%#\ at\ %.%#(%f:%l:%c)

let &cpo = s:cpo_save
unlet s:cpo_save
