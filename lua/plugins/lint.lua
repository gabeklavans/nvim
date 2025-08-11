return {
	"mfussenegger/nvim-lint",
	keys = {
		"<leader>t",
	},
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
		}

		vim.keymap.set("n", "<leader>t", function()
			lint.try_lint()
		end, { desc = "lint file" })
	end,
}
