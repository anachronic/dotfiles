local lspconfig = require('lspconfig')
local hover = require('lspsaga.hover')
local diagnostic = require('lspsaga.diagnostic')
local codeaction = require('lspsaga.codeaction')

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

    if client.resolved_capabilities.document_formatting then
        vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.formatting, only_buffer)
    elseif client.resolved_capabilities.document_range_formatting then
        vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.formatting, only_buffer)
    end
end

local on_attach_efm = function(client, bufnr)
    local only_buffer = { buffer = bufnr }

    vim.keymap.set('n', '[d', diagnostic.navigate('next'), only_buffer)
    vim.keymap.set('n', ']d', diagnostic.navigate('prev'), only_buffer)

    if client.resolved_capabilities.document_formatting then
        vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.formatting, only_buffer)
    elseif client.resolved_capabilities.document_range_formatting then
        vim.keymap.set('n', '<leader><CR>', vim.lsp.buf.formatting, only_buffer)
    end
end

local on_attach_tsserver = function(client, bufnr)
    -- EFM will handle formatting for tsserver.
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    on_attach(client, bufnr)
end

-- efm
-- brew install efm-langserver
-- will need eslint, flake8 and prettier
lspconfig.efm.setup({
    on_attach = on_attach_efm,
    filetypes = {
        'ruby',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'vue',
    },
})

local function organize_imports()
    local params = {
        command = '_typescript.organizeImports',
        arguments = { vim.api.nvim_buf_get_name(0) },
        title = '',
    }
    vim.lsp.buf.execute_command(params)
end

-- tsserver
-- npm i -g typescript-language-server typescript
lspconfig.tsserver.setup({
    on_attach = on_attach_tsserver,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = 'Organize Imports',
        },
    },
})

-- jedi language server
-- pipx install jedi-language-server?
lspconfig.jedi_language_server.setup({
    on_attach = on_attach,
})

-- gem install solargraph
lspconfig.solargraph.setup({
    on_attach = on_attach,
})

-- brew install lua-language-server
-- pacman -S lua-language-server
lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
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

-- npm i -g vuels
lspconfig.vuels.setup({
    on_attach = on_attach,
    init_options = {
        config = {
            vetur = {
                completion = {
                    autoImport = true,
                    tagCasing = 'kebab',
                    useScaffoldSnippets = true,
                },
            },
        },
    },
})

-- gopls langserver
-- go install golang.org/x/tools/gopls@latest
lspconfig.gopls.setup({
    on_attach = on_attach,
})
