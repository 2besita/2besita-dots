vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
            if not ev.data.active then vim.cmd.packadd(name) end
            vim.cmd("TSUpdate")
        end
    end,
})

vim.pack.add({
    "https://github.com/hesperus-theme/hesperus.nvim.git",
    "https://github.com/2besita/echidna.nvim.git",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/folke/snacks.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/norcalli/nvim-colorizer.lua",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
    "https://github.com/xiyaowong/transparent.nvim.git",
    "https://github.com/jake-stewart/multicursor.nvim.git",
    "https://github.com/jpe90/export-colorscheme.nvim.git",
    "https://github.com/lewis6991/gitsigns.nvim.git",
    "https://github.com/nvim-mini/mini.nvim.git",
    "https://github.com/code-biscuits/nvim-biscuits.git",
    "https://github.com/ibhagwan/fzf-lua.git",
})

vim.api.nvim_create_user_command("PackDel", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (:PackDel plugin1 plugin2)" })

vim.api.nvim_create_user_command("PackUpdate", function(opts)
    if opts.args:match("%S") then
        local plugins = vim.split(opts.args, "%s+", { trimempty = true })
        vim.pack.update(plugins)
    else
        vim.pack.update()
    end
end, { nargs = "*", desc = "Update all plugins or specific ones" })

require("plugins.fzf")
require('transparent').setup({
    extra_groups = {
        "NormalFloat", 
        "NvimTreeNormal",
        "LualineNormal",
        "LualineInsert",
        "LualineVisual",
        "LualineReplace",
        "LualineCommand",
        "LualineInactive",
    },
    exclude_groups = {},
})

require('mini.pairs').setup({})
require('mini.surround').setup({
    mappings = {
        add = 'sa',
        delete = 'sd',
        find = 'sf',
        find_left = 'sF',
        highlight = 'sh',
        replace = 'sr',
        suffix_last = 'l',
        suffix_next = 'n',
    },
})

require('nvim-treesitter').setup({
    install_dir = vim.fn.stdpath('data') .. '/site',
})

local ensure_installed = {
    "c", "rust", "typescript", "javascript", "html",
    "html", "lua", "json", "toml",
}

require('nvim-treesitter').install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then
            return
        end
        pcall(vim.treesitter.start, buf, lang)
    end,
})

require('nvim-biscuits').setup({
    default_config = {
        max_length = 20,
        min_distance = 5,
        prefix_string = ""
    },
    language_config = {
        markdown = {
            disabled = true
        }
    }
})
