return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>f", group = "[F]ind" },
      { "<leader>s", group = "[S]plit" },
      { "<leader>t", group = "[T]ab" },
    },
  },
}
