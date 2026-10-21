local ok_snacks, snacks = pcall(require, "snacks")
if not ok_snacks then return end

snacks.setup({
    explorer = { },

    picker = {
        sources = {
            files = {
                layout = {
                    preset = "vscode",
                },
            },

            recent = {
                layout = {
                    preset = "vscode",
                },
            },

            explorer = {
                git_status = true,
                auto_close = false,
                layout = {
                    auto_hide = { "input" },
                    preset = "sidebar",
                    preview = false,
                    layout = {
                        width = 40,
                    },
                },
                formatters = {
                    file = { filename_only = true },
                    severity = { pos = "right" },
                },
            },
        },
    },

    dashboard = {
        enabled = true,
        width = 30,
        row = nil,
        col = nil,
        pane_gap = 4,
        autokeys = "1232567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
        preset = {
            keys = {
                {
                    icon = " ",
                    key = "f",
                    desc = "search files",
                    action = ":lua Snacks.dashboard.pick('files')"
                },
                {
                    icon = "",
                    key = "r",
                    desc = "recent",
                    action = ":lua Snacks.dashboard.pick('oldfiles')",
                },
                {
                    icon = "",
                    key = "m",
                    desc = "mango",
                    action = ":lua Snacks.dashboard.pick('files', { cwd = '/home/nora/.config/mango/' })",
                },
                {
                    icon = "󱄅",
                    key = "x",
                    desc = "nix",
                    action = ":lua Snacks.dashboard.pick('files', { cwd = '/etc/nixos' })",
                },
                {
                    icon = "",
                    key = "c",
                    desc = "neovim",
                    action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })",
                },
                {
                    icon = " ",
                    key = "q",
                    desc = "exit",
                    action = ":qa",
                },
            },
        },
        formats = {
            icon = function(item)
                if item.file and item.icon == "file" or item.icon == "directory" then
                    return Snacks.dashboard.icon(item.file, item.icon)
                end
                return { item.icon, width = 2, hl = "icon" }
            end,
            footer = { "%s", align = "center" },
            header = { "%s", align = "center" },
            file = function(item, ctx)
                local fname = vim.fn.fnamemodify(item.file, ":~")
                fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                if #fname > ctx.width then
                    local dir = vim.fn.fnamemodify(fname, ":h")
                    local file = vim.fn.fnamemodify(fname, ":t")
                    if dir and file then
                        file = file:sub(-(ctx.width - #dir - 2))
                        fname = dir .. "/…" .. file
                    end
                end
                local dir, file = fname:match("^(.*)/(.+)$")
                return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
            end,
        },
        sections = {
            {
                section = "terminal",
                cmd = "chafa ~/Imagetic/Icons/tichel.png --format symbols --size 30x13 --stretch --symbols digit --fg-only --stretch",
                height = 13,
                padding = 1,
            },
            {
                icon = "󰚋",
                title = "shortcuts",
                section = "keys",
                padding = 0 },
        },
    },
})
