return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{ "nvim-mini/mini.completion", version = "*" },
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require('mini.completion').setup()
	end,
}
