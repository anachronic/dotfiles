local feline = require('feline')
local palette = require('catppuccin.palettes').get_palette()

--[[
lhs: mode branch filename modified diagnostics
rhs: opt_encoding opt_eol language linecol
--]]

local mode_names = {
    ['n'] = { 'NORMAL', palette.lavender },
    ['no'] = { 'N-PENDING', palette.lavender },
    ['i'] = { 'INSERT', palette.green },
    ['ic'] = { 'INSERT', palette.green },
    ['t'] = { 'TERMINAL', palette.green },
    ['v'] = { 'VISUAL', palette.flamingo },
    ['V'] = { 'V-LINE', palette.flamingo },
    [''] = { 'V-BLOCK', palette.flamingo },
    ['R'] = { 'REPLACE', palette.maroon },
    ['Rv'] = { 'V-REPLACE', palette.maroon },
    ['s'] = { 'SELECT', palette.maroon },
    ['S'] = { 'S-LINE', palette.maroon },
    [''] = { 'S-BLOCK', palette.maroon },
    ['c'] = { 'COMMAND', palette.peach },
    ['cv'] = { 'COMMAND', palette.peach },
    ['ce'] = { 'COMMAND', palette.peach },
    ['r'] = { 'PROMPT', palette.teal },
    ['rm'] = { 'MORE', palette.teal },
    ['r?'] = { 'CONFIRM', palette.mauve },
    ['!'] = { 'SHELL', palette.green },
}

local components = {
    active = {},
    inactive = {},
}

-- left and right hand sides only
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

-- LHS active: vim mode, branch, filename, (diag?), (venv?)
table.insert(components.active[1], {
    provider = function()
        return mode_names[vim.api.nvim_get_mode().mode][1] or ''
    end,
    left_sep = 'block',
    right_sep = 'block',
    hl = function()
        return {
            fg = palette.base,
            bg = mode_names[vim.api.nvim_get_mode().mode][2] or palette.lavender,
            style = 'bold',
        }
    end,
})

table.insert(components.active[1], {
    provider = 'git_branch',
    short_provider = function()
        local gitstatus = vim.b.gitsigns_status_dict

        if gitstatus and gitstatus['head'] then
            local head = gitstatus['head']

            if #head > 20 then
                return string.sub(head, 1, 15) .. '...'
            end

            return head
        end

        return ''
    end,
    left_sep = 'block',
    right_sep = 'block',
    truncate_hide = true,
    hl = function()
        return {
            fg = mode_names[vim.api.nvim_get_mode().mode][2] or palette.lavender,
            bg = palette.surface1,
        }
    end,
})

table.insert(components.active[1], {
    provider = {
        name = 'file_info',
        opts = {
            file_modified_icon = '[+]',
            file_readonly_icon = '[RO]',
            type = 'relative-short',
        },
    },
    left_sep = ' ',
    right_sep = ' ',
})

table.insert(components.active[1], {
    provider = "diagnostic_errors",
    hl = function()
        return {
            fg = palette.red,
            style = 'bold',
        }
    end,
})

table.insert(components.active[1], {
    provider = "diagnostic_warnings",
    hl = function()
        return {
            fg = palette.yellow,
            style = 'bold',
        }
    end,
})

table.insert(components.active[1], {
    provider = "diagnostic_info",
    hl = function()
        return {
            fg = palette.blue,
            style = 'bold',
        }
    end,
})

-- RHS (eol?) (encoding?) filetype position
table.insert(components.active[2], {
    provider = function()
        local eol = vim.bo.fileformat

        if eol ~= 'unix' then
            return eol
        end

        return ''
    end,
    hl = function()
        return {
            fg = palette.red,
            style = 'bold',
        }
    end,
})

table.insert(components.active[2], {
    provider = function()
        local encoding = vim.bo.fenc
        if encoding ~= 'utf-8' then
            return encoding
        end

        return ''
    end,
    hl = function()
        return {
            fg = palette.red,
            style = 'bold',
        }
    end,
})

table.insert(components.active[2], {
    provider = {
        name = 'file_type',
        opts = {
            case = 'lowercase',
        },
    },
    left_sep = ' ',
    right_sep = ' ',
    truncate_hide = true,
})

table.insert(components.active[2], {
    provider = {
        name = 'position',
        opts = {
            padding = {
                line = 3,
                col = 2,
            },
        },
    },
    left_sep = 'block',
    right_sep = 'block',
    hl = function()
        return {
            bg = mode_names[vim.api.nvim_get_mode().mode][2] or palette.lavender,
            fg = palette.base,
            style = 'bold',
        }
    end,
})

-- LHS inactive: only filename
table.insert(components.inactive[1], {
    provider = {
        name = 'file_info',
        opts = {
            file_modified_icon = '[+]',
            file_readonly_icon = '[RO]',
            type = 'relative',
        },
    },
    short_provider = {
        name = 'file_info',
        opts = {
            file_modified_icon = '[+]',
            file_readonly_icon = '[RO]',
            type = 'relative-short',
        },
    },
    left_sep = ' ',
    right_sep = ' ',
})

-- RHS inactive: only position
table.insert(components.inactive[2], {
    provider = {
        name = 'position',
        opts = {
            padding = {
                line = 3,
                col = 2,
            },
        },
    },
    right_sep = 'block',
})

feline.setup({
    components = components,
})
