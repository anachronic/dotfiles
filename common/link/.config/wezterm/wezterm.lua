local wezterm = require('wezterm')

local config = {
    font_size = 15,
    font = wezterm.font('Iosevka Nerd Font Mono'),
    color_scheme = 'Catppuccin Macchiato',

    hide_tab_bar_if_only_one_tab = true,
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    keys = {
        {
            key = 'i',
            mods = 'CTRL',
            action = wezterm.action.SendString('\x1b[17~'),
        },
        -- this should only be available on linux
        {
            key = 'v',
            mods = 'ALT',
            action = wezterm.action.PasteFrom('Clipboard'),
        },
    },
}

return config
