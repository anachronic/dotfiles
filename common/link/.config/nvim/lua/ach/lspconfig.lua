local lspconfig = require('lspconfig')
local fidget = require('fidget')
local aerial = require('aerial')

aerial.setup({
    backends = { 'lsp', 'treesitter' },
})

vim.api.nvim_create_user_command('AO', 'AerialOpen', {})
vim.api.nvim_create_user_command('AC', 'AerialClose', {})

fidget.setup({
    window = {
        blend = 0,
    },
})

vim.diagnostic.config({
    virtual_text = {
        prefix = '●',
    },
    severity_sort = true,
    float = {
        source = 'always',
    },
})

-- Rounded diagnostic borders
vim.diagnostic.config({
    float = { border = 'rounded' },
})

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
    close_events = { 'BufHidden', 'InsertLeave' },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
})

local on_attach = function(client, bufnr)
    local only_buffer = { buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, only_buffer)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, only_buffer)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, only_buffer)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, only_buffer)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, only_buffer)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, only_buffer)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, only_buffer)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, only_buffer)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, only_buffer)
    vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, only_buffer)
    vim.keymap.set('n', '<leader><CR>', function()
        vim.lsp.buf.format({ async = true })
    end, only_buffer)

    vim.api.nvim_buf_create_user_command(0, 'Dia', vim.diagnostic.setqflist, {})
end

-- pacman -S stylua
-- pipx install flake8 black isort
-- npm i -g prettier eslint_d typescript

-- tsserver
-- npm i -g typescript-language-server typescript
lspconfig.ts_ls.setup({
    on_attach = on_attach,
})

-- bash language server
-- pacman -S bash-language-server shellcheck
lspconfig.bashls.setup({
    on_attach = on_attach,
})

-- jedi language server
-- pipx install jedi-language-server
lspconfig.jedi_language_server.setup({
    on_attach = on_attach,
})

-- ruff language server
-- pipx install ruff
lspconfig.ruff.setup({
    on_attach = on_attach,
})

-- brew install lua-language-server
-- pacman -S lua-language-server
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = { 'vim', 'awesome' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- volar. Seems like no longer supported
-- npm i -g @volar/vue-language-server
lspconfig.volar.setup({
    on_attach = on_attach,
})

-- eslint
-- npm i -g vscode-langservers-extracted
lspconfig.eslint.setup({
    on_attach = on_attach,
})

-- pacman -S rust-analyzer
-- brew install rust-analyzer
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
})

-- gopls langserver
-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup({
    on_attach = on_attach,
})
