return {
	recommended = {
		ft = "nix",
		root = "flake.nix",
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				nil_ls = {},
			},
		},
	},
	{
		"stevearc/conform.nvim",
		optional = true,
		opts = {
			formatters_by_ft = {
				nix = { "nixfmt" },
			},
		},
	},
}
