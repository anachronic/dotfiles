local actions = require "fzf-lua.actions"
local util = require('ach.util')

-- Will be set by zshenv so it's safe
local default_skim_cmd = vim.fn.getenv('SKIM_DEFAULT_COMMAND')

require'fzf-lua'.setup {
  winopts = {
    win_height       = 0.85,            -- window height
    win_width        = 0.80,            -- window width
    win_row          = 0.30,            -- window row position (0=top, 1=bottom)
    win_col          = 0.50,            -- window col position (0=left, 1=right)
    -- win_border    = false,           -- window border? or borderchars?
    win_border       = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    hl_normal        = 'Normal',        -- window normal color
    hl_border        = 'FloatBorder',   -- window border color
  },
  fzf_bin             = 'sk',           -- Jumping into the rust train
  fzf_layout          = 'list',      -- fzf '--layout='
  fzf_args            = '',             -- adv: fzf extra args, empty unless adv
  fzf_binds           = {               -- fzf '--bind=' options
    ["f2"]            = "toggle-preview",
    ["f3"]            = "toggle-preview-wrap",
    ["shift-down"]    = "preview-page-down",
    ["shift-up"]      = "preview-page-up",
    ["ctrl-u"]        = "unix-line-discard",
    ["ctrl-f"]        = "half-page-down",
    ["ctrl-b"]        = "half-page-up",
    ["ctrl-a"]        = "toggle-all",
  },
  preview_border      = 'border',       -- border|noborder
  preview_wrap        = 'nowrap',       -- wrap|nowrap
  preview_opts        = 'hidden',       -- hidden|nohidden
  preview_vertical    = 'down:45%',     -- up|down:size
  preview_horizontal  = 'right:60%',    -- right|left:size
  preview_layout      = 'flex',         -- horizontal|vertical|flex
  flip_columns        = 120,            -- #cols to switch to horizontal on flex
  -- default_previewer   = "bat",       -- override the default previewer?
                                        -- by default uses the builtin previewer
  -- provider setup
  files = {
    previewer         = false,          -- uncomment to override previewer
    prompt            = 'Files ❯ ',
    cmd               = default_skim_cmd, -- "find . -type f -printf '%P\n'",
    git_icons         = false,           -- show git icons?
    file_icons        = false,           -- show file icons?
    color_icons       = false,           -- colorize file|git icons
    actions = {
      ["default"]     = actions.file_edit,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      ["ctrl-q"]      = actions.file_sel_to_qf,
      ["ctrl-y"]      = function(selected) print(selected[2]) end,
    }
  },
  git = {
    status = {
      prompt        = 'GitStatus ❯ ',
      cmd           = "git status -s",
      previewer     = "git_diff",
      file_icons    = true,
      git_icons     = true,
      color_icons   = true,
    },
    commits = {
      prompt          = 'Commits ❯ ',
      cmd             = "git log --pretty=oneline --abbrev-commit --color",
      preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
      actions = {
        ["default"] = nil,
      },
    },
    bcommits = {
      prompt          = 'BCommits ❯ ',
      cmd             = "git log --pretty=oneline --abbrev-commit --color --",
      preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
      actions = {
        ["default"] = nil,
      },
    },
    branches = {
      prompt          = 'Branches ❯ ',
      cmd             = "git branch --all --color",
      preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
      actions = {
        ["default"] = actions.git_switch,
      },
    },
    icons = {
      ["M"]           = { icon = "M", color = "yellow" },
      ["D"]           = { icon = "D", color = "red" },
      ["A"]           = { icon = "A", color = "green" },
      ["?"]           = { icon = "?", color = "magenta" },
      -- ["M"]          = { icon = "★", color = "red" },
      -- ["D"]          = { icon = "✗", color = "red" },
      -- ["A"]          = { icon = "+", color = "green" },
    },
  },
  grep = {
    previewer = false,
    prompt            = 'Rg ❯ ',
    input_prompt      = 'Grep For ❯ ',
    -- cmd               = "rg --vimgrep",
    rg_opts           = "--hidden --column --line-number --no-heading " ..
                        "--color=always --smart-case -g '!{.git,node_modules}/*' " ..
                        "-g '!{poetry.lock,package-lock.json,yarn.lock,Gemfile.lock}'",
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    actions = {
      ["default"]     = actions.file_edit,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      ["ctrl-q"]      = actions.file_sel_to_qf,
      ["ctrl-y"]      = function(selected) print(selected[2]) end,
    }
  },
  buffers = {
    prompt            = 'Buffers ❯ ',
    file_icons        = true,         -- show file icons?
    color_icons       = true,         -- colorize file|git icons
    sort_lastused     = true,         -- sort buffers() by last used
    actions = {
      ["default"]     = actions.buf_edit,
      ["ctrl-s"]      = actions.buf_split,
      ["ctrl-v"]      = actions.buf_vsplit,
      ["ctrl-t"]      = actions.buf_tabedit,
      ["ctrl-x"]      = actions.buf_del,
    }
  },
  -- placeholders for additional user customizations
  loclist = {},
  helptags = {},
  manpages = {},
  -- optional override of file extension icon colors
  -- available colors (terminal):
  --    clear, bold, black, red, green, yellow
  --    blue, magenta, cyan, grey, dark_grey, white
  file_icon_colors = {
    ["lua"]   = "blue",
  },
}

util.map('n', '<leader>h', '<cmd>FzfLua help_tags<CR>')
util.map('n', '<C-p>', "<cmd>FzfLua files<CR>")
util.map('n', '<leader>b', '<cmd>FzfLua buffers<cr>')
util.map('n', '<leader>a', "<cmd>FzfLua live_grep<cr>")
