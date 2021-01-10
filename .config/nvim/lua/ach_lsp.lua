local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>.', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        require('lspconfig').util.nvim_multiline_command [[
        :hi LspReferenceRead cterm=bold ctermbg=red guibg=#bf361b
        :hi LspReferenceText cterm=bold ctermbg=red guibg=#bf361b
        :hi LspReferenceWrite cterm=bold ctermbg=red guibg=#bf361b
        augroup lsp_document_highlight
          autocmd!
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
    ]]
    end
end

-- npm i -g vuels tsserver
-- pip install jedi-language-server
-- npm i -g diagnostic-languageserver

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = {
    "jedi_language_server",
    "tsserver",
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup { on_attach = on_attach }
end

local on_attach_diagnosticls = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap("n", "<leader><CR>", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end


nvim_lsp.diagnosticls.setup{
    on_attach = on_attach_diagnosticls,
    filetypes = {
        "javascript",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "vue",
        "python",
    },
    init_options = {
        filetypes = {
            ["javascript.jsx"] = "eslint",
            javascript = "eslint",
            javascriptreact = "eslint",
            typescriptreact = "eslint",
            vue = "eslint",
            python = "pylint",
        },
        linters = {
            eslint = {
                sourceName = "eslint",
                command = "./node_modules/.bin/eslint",
                rootPatterns = { "package.json", "nuxt.config.js", "vue.config.js" },
                debounce = 100,
                args = {
                    "--stdin",
                    "--stdin-filename",
                    "%filepath",
                    "--format",
                    "json",
                },
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity",
                };
                securities = {
                    [2] = "error",
                    [1] = "warning"
                }
            },
            pylint = {
                sourceName = pylint,
                command = pylint,
                args = {
                    "--output-format",
                    "text",
                    "--score",
                    "no",
                    "--msg-template",
                    "'{line}:{column}:{category}:{msg} ({msg_id}:{symbol})'",
                    "%file"
                },
                formatPattern = {
                    "^(\\d+?):(\\d+?):([a-z]+?):(.*)$",
                    {
                        line = 1,
                        column = 2,
                        security = 3,
                        message = 4
                    }
                },
                securities = {
                    informational = "hint",
                    refactor = "info",
                    convention = "info",
                    warning = "warning",
                    error = "error",
                    fatal = "error"
                },
                offsetColumn = 1,
                formatLines = 1
            },
        },
        formatters = {
            prettier = {
                command = './node_modules/.bin/prettier',
                args = { '--stdin-filepath', '%filepath' },
                rootPatterns = {
                    ".prettierrc",
                    ".prettierrc.js",
                    ".prettierrc.json",
                    ".prettierrc.yml",
                    ".prettierrc.yaml",
                    ".prettier.config.js",
                    ".prettier.config.cjs",
                    "package.json",
                },
            }
        },
        formatFiletypes = {
            vue = "prettier",
            javascript = "prettier",
            typescript = "prettier",
            javascriptreact = "prettier",
            typescriptreact = "prettier",
        }
    }
}

nvim_lsp.vuels.setup{
    on_attach = on_attach;
    init_options = {
        config = {
            vetur = {
                autoImport = true;
            },
            format = {
                defaultFormatter = {
                    js = "prettier";
                    ts = "prettier";
                }
            }
        }
    }
}
