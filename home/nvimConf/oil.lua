require("oil").setup({
    default_file_explorer = true,
    columns = { "icon" },
    kemaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
    },
    view_options = {
        show_hidden = true,
    },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<space>-", require("oil").toggle_float)
