return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require "telescope"
      local actions = require "telescope.actions"

      telescope.setup {
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }

      telescope.load_extension "ui-select"
      telescope.load_extension "fzf"

      local builtin = require "telescope.builtin"
      local keymap = vim.keymap

      keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find [F]iles in cwd" })
      keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[G]rep string in cwd" })
      keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
      keymap.set("n", "<leader>fc", builtin.grep_string, { desc = "Find string under [C]ursor in cwd" })
      keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find [R]ecent files" })
      keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Telescope [H]elp tags" })
      keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find normal mode [K]eymappings" })
      keymap.set("n", "<leader>fb", builtin.builtin, { desc = "Find [B]uiltin Telescope community pickers" })
      keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find [D]iagnostics" })

      keymap.set("n", "<leader>/", function()
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = "[/] Fuzzily search in current buffer" })
    end,
  },
}
