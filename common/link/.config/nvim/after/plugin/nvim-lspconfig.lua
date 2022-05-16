require'lspsaga'.init_lsp_saga {
    use_saga_diagnostic_sign = false,
    code_action_prompt = {
        enable = true,       -- do want code actions
        sign = false,        -- don't hint code actions in sign column
        virtual_text = false -- don't hint code actions in virtual text
    }
}

local on_attach = function(client, bufnr)
    -- Mappings.
    vim.keymap.set('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    vim.keymap.set('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    vim.keymap.set('n', 'K', "<Cmd>Lspsaga hover_doc<CR>")
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    -- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
    vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    -- vim.keymap.set('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
    vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>")
    vim.keymap.set('n', '<leader>.', "<cmd>Lspsaga code_action<CR>")

    -- vim.keymap.set('n', '<space>.', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        vim.keymap.set("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    elseif client.resolved_capabilities.document_range_formatting then
        vim.keymap.set("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    end
end

local on_attach_efm = function(client, bufnr)
    -- Mappings.
    vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>")
    vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>")

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        vim.keymap.set("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
    elseif client.resolved_capabilities.document_range_formatting then
        vim.keymap.set("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>")
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
require'lspconfig'.efm.setup{
    on_attach = on_attach_efm,
    filetypes = {
        'ruby',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'vue',
    }
}

local function organize_imports()
    local params = {
        command = "_typescript.organizeImports",
        arguments = {vim.api.nvim_buf_get_name(0)},
        title = ""
    }
    vim.lsp.buf.execute_command(params)
end

-- tsserver
-- npm i -g typescript-language-server typescript
require'lspconfig'.tsserver.setup{
    on_attach = on_attach_tsserver,
    commands = {
        OrganizeImports = {
            organize_imports,
            description = "Organize Imports"
        }
    }
}

-- jedi language server
-- pipx install jedi-language-server?
require'lspconfig'.jedi_language_server.setup{
    on_attach = on_attach
}

-- gem install solargraph
require'lspconfig'.solargraph.setup{
    on_attach = on_attach
}


-- yay -S vala-language-server
-- No need in macOS because this is linux-specific
require'lspconfig'.vala_ls.setup{
    on_attach = on_attach,
}

-- npm i -g vuels
require'lspconfig'.vuels.setup{
    on_attach = on_attach,
    init_options = {
        config = {
            vetur = {
                completion = {
                    autoImport = true,
                    tagCasing = 'kebab',
                    useScaffoldSnippets = true
                }
            }
        }
    }
}
