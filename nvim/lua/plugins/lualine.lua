local mode_map = {
    ['NORMAL']   = '(のへの)',
    ['INSERT']   = '(のへの)',
    ['VISUAL']   = '(のへの)',
    ['V-LINE']   = '(のへの)',
    ['V-BLOCK']  = '(のへの)',
    ['COMMAND']  = '(のへの)',
    ['SELECT']   = '(のへの)',
    ['S-LINE']   = '(のへの)',
    ['REPLACE']  = '(のへの)',
}

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        refresh = {
            statusline = 0,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = {
            {
                'mode',
                fmt = function(s)
                    return mode_map[s] or s
                end,
            }, 
        },
        lualine_b = { "filename" },
        lualine_c = {},

        lualine_x = { "diff", "diagnostics" },
        lualine_y = { { "branch", icon = "" } },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {}, lualine_b = {}, lualine_c = {},
        lualine_x = {}, lualine_y = {}, lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
})
