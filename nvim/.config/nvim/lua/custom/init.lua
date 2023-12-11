local opt = vim.opt

-- visual
opt.colorcolumn    = "95" -- highlight screen column
opt.relativenumber = true -- show the line number relative to the line with the cursor in front of each line
opt.cursorline     = true
opt.cursorcolumn   = true
opt.mouse          = ""   -- disable mouse support
opt.fillchars      = { eob = "~" }
opt.list           = true
opt.listchars      = "tab:▸ ,extends:›,precedes:‹,nbsp:·,trail:·"

-- behaviour
opt.scrolloff      = 1
opt.sidescrolloff  = 5
opt.undofile       = false   -- disable automatic saves of undo history to an undo file
opt.fileencoding   = "utf-8" -- file-content encoding for the current buffer
opt.swapfile       = false   -- do not use a swapfile for the buffer
opt.wrap           = false   -- long lines will not wrap

vim.cmd('hi TrSpace ctermbg=red guibg=red')
vim.fn.matchadd('TrSpace', [[\s\+$]]) -- highlight trailing whitespace(s)
