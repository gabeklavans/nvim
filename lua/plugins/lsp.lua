return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-lspconfig").setup_handlers({
			function(server_name)
				vim.lsp.enable(server_name)
			end,

			-- overrides would go next, if I had any
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("my.lsp", {}),
			callback = function(args)
				local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
				if client:supports_method("textDocument/completion") then
					-- trigger auto-complete on every alpha character
					local chars = {}
					for i = 65, 122 do
						table.insert(chars, string.char(i))
					end
					client.server_capabilities.completionProvider.triggerCharacters = chars

					vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
				end
			end,
		})
	end,
}
