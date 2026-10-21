local ok_ibl, ibl = pcall(require, "ibl")

ibl.setup({
    indent = {
        char = "",
        tab_char = "",
        highlight = "Comment",
    },
    scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        char = "",
        highlight = "SpecialKey",
    },
    exclude = {
        filetypes = { "help", "dashboard", "terminal", "markdown" },
        buftypes = { "terminal", "nofile" },
    },
})
