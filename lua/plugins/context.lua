return {
  "nvim-treesitter/nvim-treesitter-context",
  init = function()
    vim.keymap.set("n", "<leader>tc", function()
      require("treesitter-context").toggle()
    end, {
      desc = "[T]oggle TS-[C]ontext",
    })
  end,
}
