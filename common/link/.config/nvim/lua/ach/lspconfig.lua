local lspconfig = require('lspconfig')
local saga = require('lspsaga')
local null_ls = require('null-ls')
local fidget = require('fidget')
local aerial = require('aerial')

aerial.setup({
    backends = { 'lsp', 'treesitter' },
})

vim.api.nvim_create_user_command("AO", "AerialOpen", {})
vim.api.nvim_create_user_command("AC", "AerialClose", {})

fidget.setup({
    window = {
        blend = 0,
    },
})

saga.init_lsp_saga({
    code_action_lightbulb = {
        enable = true,
        enable_in_insert = false,
        virtual_text = false,
    },
})

local on_attach = function(client, bufnr)
    local only_buffer = { buffer = bufnr }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, only_buffer)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, only_buffer)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, only_buffer)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, only_buffer)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, only_buffer)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, only_buffer)
    vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', only_buffer)
    vim.keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<CR>', only_buffer)
    vim.keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', only_buffer)
    vim.keymap.set('n', '<leader>.', '<cmd>Lspsaga code_action<CR>', only_buffer)

    vim.api.nvim_buf_create_user_command(0, 'Dia', vim.diagnostic.setqflist, {})

    local enabled_formatter_lsps = {
        ['null-ls'] = true,
    }

    if not enabled_formatter_lsps[client.name] then
        client.server_capabilities.documentFormattingProvider = nil
        client.server_capabilities.documentRangeFormattingProvider = nil
    end

    local formatting_enabled = (
        client.server_capabilities.documentFormattingProvider
        or client.server_capabilities.documentRangeFormattingProvider
    )

    if formatting_enabled then
        vim.keymap.set('n', '<leader><CR>', function()
            vim.lsp.buf.format({ async = true })
        end, only_buffer)
    end

    -- this should only be done with supported languages
    aerial.on_attach(client, bufnr)
end

-- pacman -S stylua
-- pipx install flake8 black isort
-- npm i -g prettier eslint_d typescript
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,

        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.diagnostics.flake8.with({
            command = 'pflake8',
        }),
        null_ls.builtins.diagnostics.golangci_lint,
    },
    diagnostics_format = '[#{c}] #{m} (#{s})',
    on_attach = on_attach,
})

-- tsserver
-- npm i -g typescript-language-server typescript
-- diagnostics disabled because null ls will handle them
lspconfig.tsserver.setup({
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

-- brew install lua-language-server
-- pacman -S lua-language-server
lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
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

-- npm i -g @volar/vue-language-server
lspconfig.volar.setup({
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
