local linker = require('gitlinker')
local ok, private = pcall(require, 'ach.private.gitlinker')

local callbacks = {}
if ok and private then
    private.inject_callbacks(callbacks)
end

linker.setup({
    callbacks = callbacks,
})
