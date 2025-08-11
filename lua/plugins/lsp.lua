return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()

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
					table.insert(chars, ".")
					table.insert(chars, ">")
					client.server_capabilities.completionProvider.triggerCharacters = chars

					vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
				end
			end,
		})
	end,
}
