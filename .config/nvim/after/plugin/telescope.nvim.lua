local actions = require('telescope.actions')
local util = require('ach.util')

-- Load highlighting from lspconfig
require('vim.lsp.diagnostic')._define_default_signs_and_highlights()

local map = util.map

-- Well, telescope is kind of a jerk with hidden files, so new strategy
-- We can show hidden files by using hidden true, but I'm keeping this until
-- I'm sure telescope does what I want
--
-- local find_files_cmd = {
--     "rg",
--     "--color=never",
--     "--no-heading",
--     "--with-filename",
--     "--line-number",
--     "--column",
--     "--smart-case",
--     "--follow",
--     "--hidden",
--     "-g !.ccls-cache ",
--     "-g !.*cache/*",
--     "-g !.git/*",
--     "-g !tags*",
--     "-g !cscope*",
--     "-g !compile_commands.json",
--     "-g !*.map",
--     "-g !*.dmp",
--     "--files"
-- }

map('n', '<leader>h', '<cmd>Telescope help_tags<CR>')
map('n', '<C-p>', "<cmd>lua require('telescope.builtin').find_files({hidden=true})<CR>")
map('n', '<leader>b', '<cmd>Telescope buffers<cr>')
map('n', '<leader>a', '<cmd>Telescope live_grep<cr>')


require('telescope').setup{
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_position = "bottom",
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {
                mirror = false,
            },
            vertical = {
                mirror = false,
            },
        },
        -- file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_sorter =  require'telescope.sorters'.get_fzy_sorter,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist,
            }
        }
    }
}
