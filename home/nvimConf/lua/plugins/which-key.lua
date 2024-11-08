return {
	-- which-key helps you remember key bindings by showing a popup
	-- with the active keybindings of the command you started typing.
	-- { "ellisonleao/gruvbox.nvim" },
	{
		"folke/which-key.nvim",
		-- event = "VeryLazy",
		opts = {
			plugins = { spelling = true },
			defaults = {
				mode = { "n", "v" },
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.add(opts.defaults)
		end,
	},
}
