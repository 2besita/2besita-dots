local ok, mc = pcall(require, "multicursor-nvim")
if not ok then return end

mc.setup()

local set = vim.keymap.set

-- add/skip cursor above/below
set({ "n", "x" }, "<up>",   function() mc.lineAddCursor(-1) end)
set({ "n", "x" }, "<down>", function() mc.lineAddCursor(1) end)
set({ "n", "x" }, "<leader><up>",   function() mc.lineSkipCursor(-1) end)
set({ "n", "x" }, "<leader><down>", function() mc.lineSkipCursor(1) end)

-- add/skip cursor by matching word
set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end)
set({ "n", "x" }, "<leader>N", function() mc.matchAddCursor(-1) end)
set({ "n", "x" }, "<leader>s", function() mc.matchSkipCursor(1) end)
set({ "n", "x" }, "<leader>S", function() mc.matchSkipCursor(-1) end)
set({"n", "x"}, "<leader>mca", mc.matchAllAddCursors)

-- mouse
set("n", "<c-leftmouse>",   mc.handleMouse)
set("n", "<c-leftdrag>",    mc.handleMouseDrag)
set("n", "<c-leftrelease>", mc.handleMouseRelease)

-- toggle cursors
set({ "n", "x" }, "<c-q>", mc.toggleCursor)

mc.addKeymapLayer(function(layerSet)
    layerSet({ "n", "x" }, "<left>",  mc.prevCursor)
    layerSet({ "n", "x" }, "<right>", mc.nextCursor)
    layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)

-- cursor appearance
local hl = vim.api.nvim_set_hl
hl(0, "MultiCursorCursor",         { reverse = true })
hl(0, "MultiCursorVisual",         { link = "Visual" })
hl(0, "MultiCursorSign",           { link = "SignColumn" })
hl(0, "MultiCursorMatchPreview",   { link = "Search" })
hl(0, "MultiCursorDisabledCursor", { reverse = true })
hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
hl(0, "MultiCursorDisabledSign",   { link = "SignColumn" })
