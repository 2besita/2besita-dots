local M = {}

function M.save_doas()
    if vim.fn.expand("%:p") == "" then
        vim.notify("No file name", vim.log.levels.WARN)
        return
    end

    vim.cmd("write !doas tee % > /dev/null")
    vim.cmd("edit!")
end

function M.toggle_boolean()
    local word = vim.fn.expand("<cword>")

    local bool_map = {
        ["true"] = "false", ["false"] = "true",
        ["True"] = "False", ["False"] = "True",
        ["TRUE"] = "FALSE", ["FALSE"] = "TRUE",
        ["yes"] = "no", ["no"] = "yes",
        ["on"] = "off", ["off"] = "on",
    }

    if bool_map[word] then
        vim.cmd("normal! ciw" .. bool_map[word])
    end
end

return M
