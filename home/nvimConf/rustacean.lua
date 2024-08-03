vim.g.rustaceanvim = {
    tools = {},
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set(
                "n",
                "<leader>vca",
                function()
                    vim.cmd.RustLsp('codeAction')
                end,
                { silent = true, buffer = bufnr }
            )
        end,
        default_settings = {
            ['rust-analyzer'] = {
            },
        },
    },
    dap = {},
}
