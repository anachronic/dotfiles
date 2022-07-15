local lspconfig = require('lspconfig')
local hover = require('lspsaga.hover')
local diagnostic = require('lspsaga.diagnostic')
local codeaction = require('lspsaga.codeaction')
local null_ls = require('null-ls')

require('lspsaga').init_lsp_saga({
    use_saga_diagnostic_sign = false,
    code_action_prompt = {
        enable = true, -- do want code actions
        sign = false, -- don't hint code actions in sign column
        virtual_text = false, -- don't hint code actions in virtual text
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
    vim.keymap.set('n', 'K', hover.render_hover_doc, only_buffer)
    vim.keymap.set('n', ']d', diagnostic.navigate('next'), only_buffer)
    vim.keymap.set('n', '[d', diagnostic.navigate('prev'), only_buffer)
    vim.keymap.set('n', '<leader>.', codeaction.code_action, only_buffer)

    local enabled_formmater_lsps = {
        ['null-ls'] = true,
    }

    if not enabled_formmater_lsps[client.name] then
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    local formatting_enabled = (
        client.resolved_capabilities.document_formatting
        or client.resolved_capabilities.document_range_formatting
    )

    if formatting_enabled then
        vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.formatting, only_buffer)
    end
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

        null_ls.builtins.diagnostics.eslint_d,
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
    on_attach = on_attach
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
-- lspconfig.volar.setup({
--     on_attach = on_attach
-- })

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
