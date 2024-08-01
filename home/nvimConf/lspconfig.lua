local lspconfig = require("lspconfig")
local cmp = require("cmp")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local cmp_select = { behavior = cmp.SelectBehavior.Select }

vim.opt.completeopt = { "menu", "menuone", "noselect" }

lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
        vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
        vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    end,
    settings = {
        Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            }
        }
    }
}

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})
