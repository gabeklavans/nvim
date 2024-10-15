return {
  "nvim-treesitter/nvim-treesitter-context",
  config = function()
    local tscontext = require("treesitter-context")

    tscontext.setup {
      max_lines = 8,
      multiline_threshold = 2,
      trim_scope = "outer",
    }

    vim.keymap.set("n", "\\t", tscontext.toggle, { desc = "Toggle TS-Context" })
  end,
}
