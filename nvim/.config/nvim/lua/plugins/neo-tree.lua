return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  keys = {
    { "<C-n>", "<cmd>Neotree filesystem reveal left toggle=true<CR>", desc = "Toggle file explorer" },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ["<cr>"] = "open",
          ["<tab>"] = "open",
        },
      },
    },
  },
}
