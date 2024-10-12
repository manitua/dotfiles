return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    spec = {
      { "<leader>s", group = "[S]earch" },
      { "<leader>t", group = "[T]ab" },
      { "<leader>w", group = "[W]indow" },
    },
  },
}
