return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local keymap = vim.keymap
    keymap.set("n", "<C-n>", "<cmd>Neotree filesystem reveal left toggle=true<CR>", { desc = "Toggle file explorer" })

    require("neo-tree").setup {
      window = {
        mappings = {
          ["<cr>"] = "open",
          ["<tab>"] = "open",
        },
      },
    }
  end,
}
