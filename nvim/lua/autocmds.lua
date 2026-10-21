vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("CmdLineLeave", {
    group = vim.api.nvim_create_augroup("ClearCommandLine", { clear = true }),
    callback = function()
        vim.defer_fn(function()
            vim.cmd("echo ''")
        end, 50)
    end,
})

vim.opt.wildmode = "noselect:lastused,full"
vim.opt.wildoptions = "pum"

local cmd_group = vim.api.nvim_create_augroup("CmdlineComplete", { clear = true })
vim.api.nvim_create_autocmd("CmdlineChanged", {
    group = cmd_group,
    pattern = ":",
    callback = function()
        vim.fn.wildtrigger()
    end,
})

vim.keymap.set("c", "<Up>", function()
    return vim.fn.wildmenumode() == 1 and "<C-E><Up>" or "<Up>"
end, { expr = true })
vim.keymap.set("c", "<Down>", function()
    return vim.fn.wildmenumode() == 1 and "<C-E><Down>" or "<Down>"
end, { expr = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "text", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.cmd([[silent! %s/| /│ /g]])
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        -- Free up Ctrl+l for your navigation plugin
        vim.keymap.del("n", "<C-l>", { buffer = true })

        vim.keymap.set("n", "<Leader>r", "<Plug>NetrwRefresh", { buffer = true, remap = true })
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
