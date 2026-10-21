vim.g.mapleader = " "
local func = require("functions")

vim.keymap.set('n', '<leader>db', ':lua require("snacks").dashboard()<CR>', { desc = 'Open dashboard', silent = true })
vim.keymap.set('n', '<leader>e', ':lua require("snacks").explorer()<CR>', { desc = 'Open sidebar', silent = true })
vim.keymap.set('n', '<leader>sg', ':lua require("snacks").picker.grep()<CR>', { desc = 'Search (ripgrep)', silent = true })
vim.keymap.set('n', '<leader>pf', ':lua require("snacks").picker.files()<CR>', { desc = 'Search (file picker)', silent = true })

-- vim.keymap.set('n', "<leader>e", func.toggle_netrw, { desc = 'Toggle explorer bottombar', silent = true })
-- vim.keymap.set('n', '<M-h>', func.toggle_netrw_hidden, { silent = true, desc = "Toggle hidden files in Netrw" })

vim.keymap.set('v', '<M-j>', ":m '>+1<CR>gv=gv", { desc = 'Move current line below (visual)', silent = true })
vim.keymap.set('v', '<M-k>', ":m '<-2<CR>gv=gv", { desc = 'Move current line above (visual)', silent = true })

vim.keymap.set('v', "<", "<gv", { desc = 'Move indentation left' })
vim.keymap.set('v', ">", ">gv", { desc = 'Move indentation right' })

vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus left buffer', silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus lower buffer', silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus upper buffer', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus right buffer', silent = true })

vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'Split window vertically', silent = true })
vim.keymap.set('n', '<leader>wh', ':below split<CR>', { desc = 'Split window horizontally', silent = true })
vim.keymap.set('n', '<leader>wd', ':close<CR>', { desc = 'Close current window', silent = true })
vim.keymap.set('n', '<leader>wo', ':only<CR>', { desc = 'Close other windows', silent = true })

vim.keymap.set('n', '<leader><leader>', ":cd %:p:h<CR>", { silent = true })
vim.keymap.set("x", 'p', [["_dP]], { desc = 'Pasting doesn\'t yank', silent = true })
vim.keymap.set({'n', 'v' }, '<leader>d', [["_d]], { desc = 'Delete without yanking' })
vim.keymap.set('n', '<C-c>', ':nohl<CR>', { desc = 'Stop search highlighting' })
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word cursor is on globally" })

vim.keymap.set('n', '<leader>t', func.toggle_boolean, { desc = 'Toggle boolean value' })

vim.keymap.set({ 'n', 'v' }, '<leader>sd', func.save_doas, { desc = 'Save current file with DOAS privilege', silent = true })

vim.keymap.set('n', 'C-u', '<C-u>zz', { desc = 'Scroll up with cursor centered' })
vim.keymap.set('n', 'C-d', '<C-d>zz', { desc = 'Scroll down with cursor centered' })

vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result with cursor centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result with cursor centered' })

vim.keymap.set("n", "<leader>u", function()
    vim.cmd.packadd("nvim.undotree")
    require("undotree").open()
end, { desc = "Toggle Builtin Undotree" })
