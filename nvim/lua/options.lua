--  text editing
vim.opt.virtualedit = "none"
vim.opt.clipboard = "unnamedplus"
vim.opt.startofline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 5
vim.opt.fillchars = { eob = " " }
vim.opt.spell = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoread = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.inccommand = "split"

-- visuals
-- vim.opt.guicursor = "n-v-i-c:block,a:blinkwait0-blinkoff400-blinkon350" -- block for block, beam25 por beam
vim.opt.guicursor = ""
vim.opt.relativenumber = false
vim.opt.number = true
-- vim.opt.signcolumn = "yes:1"
vim.opt.signcolumn = "no"
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.showtabline = 0
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.colorcolumn = "0"
vim.opt.encoding = "utf-8"
vim.opt.winborder = "single"
vim.g.loaded_matchparen = 1

-- command etc
vim.opt.timeoutlen = 500
vim.opt.linebreak = true
vim.opt.autochdir = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 30
vim.g.netrw_browse_split = 4
