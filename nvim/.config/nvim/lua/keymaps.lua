-- set <space> to the <leader> key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- clear search highlights
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

--buffer management
keymap.set("n", "<Tab>", "<cmd>bnext<CR>") -- go to next buffer
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>") -- go to previous buffer
keymap.set("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Unload current buffer" })
keymap.set("n", "<leader>X", "<cmd>bwipeout<CR>", { desc = "Wipeout current buffer" }) -- like :bdelete, but really delete the buffer

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window [H]orizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits [E]qual size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })

-- tab management
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "[O]pen new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to [N]ext tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to [P]revious tab" })
keymap.set("n", "<leader>tb", "<cmd>tabnew %<CR>", { desc = "Open current [B]uffer in new tab" })

-- vim pane navigation
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- disable arrow keys in normal mode
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("manitua-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
