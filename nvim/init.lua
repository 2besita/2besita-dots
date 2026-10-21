require('vim._core.ui2').enable({})

require("options")
require("pack")
require("autocmds")
require("keymaps")

vim.cmd.colorscheme("echidna")

require("plugins.lualine")
require("plugins.fzf")
require("plugins.snacks")
require("plugins.multicursors")
require("plugins.ibl")
