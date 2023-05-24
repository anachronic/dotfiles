local linker = require('gitlinker')
local actions = require('gitlinker.actions')
local ok, private = pcall(require, 'ach.private.gitlinker')

local callbacks = {}
if ok and private then
    private.inject_callbacks(callbacks)
end

linker.setup({
    callbacks = callbacks,
    mappings = nil,
    opts = {
        print_url = false,
    },
})

vim.api.nvim_create_user_command('Permalink', function(opts)
    local mode = vim.api.nvim_get_mode().mode

    local callback_opts = {}
    if opts.bang then
        callback_opts['action_callback'] = actions.open_in_browser
    end
    linker.get_buf_range_url(mode, callback_opts)
end, { bang = true, range = true })
