return {
  "nvim-treesitter/nvim-treesitter-context",
  init = function()
    vim.keymap.set("n", "\\t", function()
      require("treesitter-context").toggle()
    end, {
      desc = "Toggle TS-Context",
    })
  end,
}
