local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
                capabilities = capabilities
            },
        },
    },
    dap = {},
}
