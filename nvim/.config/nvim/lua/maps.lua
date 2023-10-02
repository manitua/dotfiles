local map = vim.api.nvim_set_keymap

-- leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables
vim.g.maplocalleader = ' '

-- commaround (commenting plugin)
map("v", "gc", "<Plug>ToggleCommaround", {})

options = { noremap = true }

-- nerdtree
map('n', '<C-n>', ':NvimTreeToggle<CR>', options)

--LSPSaga
map('n', 'gh', ':Lspsaga lsp_finder<CR>', options)
map('n', 'gs', ':Lspsaga signature_help<CR>', options)
map('n', 'gr', ':Lspsaga rename<CR>', options)
map('n', 'gd', ':Lspsaga preview_definition<CR>', options)
map('n', '<leader>ca', ':Lspsaga code_action<CR>', options)
map('v', '<leader>ca', ':<C-U>Lspsaga range_code_action<CR>', options)
map('n', 'K', ':Lspsaga hover_doc<CR>', options)
map('n', '<leader>t', ':Lspsaga open_floaterm<CR>', options)
map('n', '<C-f>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", options)
map('n', '<C-b>', "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", options)

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', options)

-- VSnip
-- Expand
map('i', '<C-k>', "vsnip#expandable()?'<Plug>(vsnip-expand)':'<C-k>'", { expr = true, silent = true})
map('s', '<C-k>', "vsnip#expandable()?'<Plug>(vsnip-expand)':'<C-k>'", { expr = true, silent = true})
-- Expand or jump
map('i', '<C-l>', "vsnip#available(1)?'<Plug>(vsnip-expand-or-jump)':'<C-l>'", {expr = true})
map('s', '<C-l>', "vsnip#available(1)?'<Plug>(vsnip-expand-or-jump)':'<C-l>'", {expr = true})

-- Jump forward or backward
map('i', '<Tab>', "vsnip#jumpable(1)?'<Plug>(vsnip-jump-next)':'<Tab>'", { expr = true})
map('s', '<Tab>', "vsnip#jumpable(1)?'<Plug>(vsnip-jump-next)':'<Tab>'", { expr = true})
map('i', '<S-Tab>', "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<S-Tab>'", { expr = true})
map('s', '<S-Tab>', "vsnip#jumpable(-1)?'<Plug>(vsnip-jump-prev)':'<S-Tab>'", { expr = true})

-- Center file when moving
map('n', 'j', 'jzz', options)
map('n', 'k', 'kzz', options)

-- Center matches when searcing
map('n', 'N', 'Nzz', options)
map('n', 'n', 'nzz', options)

-- Window navigation
map('n', '<C-Left>', '<C-W>5>', options)
map('n', '<C-Down>', '<C-W>5-', options)
map('n', '<C-Up>', '<C-W>5+', options)
map('n', '<C-Right>', '<C-W>5<', options)
map('n', '<M-h>', '<C-W><left>', options)
map('n', '<M-j>', '<C-W><down>', options)
map('n', '<M-k>', '<C-W><up>', options)
map('n', '<M-l>', '<C-W><right>', options)
