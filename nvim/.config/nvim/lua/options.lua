local o = vim.opt
local g = vim.g

-- line numbers
o.number = true -- print the line number in front of each line
o.numberwidth = 2 -- minimal number of columns to use for the line number
o.relativenumber = true -- show the line number relative to the line with the cursor in front of each line

-- tabs & indentation
o.tabstop = 2 -- number of spaces that a <Tab> in the file counts for
o.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
o.softtabstop = 2 -- number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.expandtab = true -- in Insert mode: Use the appropriate number of spaces to insert a <Tab>
o.shiftround = true -- round indent to multiple of 'shiftwidth'

-- line wrapping
o.wrap = false -- long lines will not wrap

-- search settings
o.ignorecase = true -- ignore case when using lowercase in search
o.smartcase = true -- but don't ignore it when using upper case

-- cursor line
o.cursorline = true -- highlight the text line of the cursor
o.cursorcolumn = true -- highlight the screen column of the cursor
o.colorcolumn = "80" -- highlight screen at column

-- appearance
o.termguicolors = true -- use true colors, required for some plugins
o.signcolumn = "yes" -- always draw the signcolumn
o.background = "dark" -- adjust the default color group to "dark"
o.list = true -- enable list mode to see the difference between tabs and spaces and for trailing blanks
o.listchars = "tab:▸ ,extends:›,precedes:‹,nbsp:·,trail:·" -- strings to use in 'list' mode
o.laststatus = 3 -- show always statusline and ONLY on the last window

-- behaviour
o.mouse = "" -- disable mouse support
o.scrolloff = 5
o.sidescrolloff = 5
o.swapfile = false -- do not use a swapfile for the buffer
o.undofile = false -- disable automatic saves of undo history to an undo file
o.fileencoding = "utf-8" -- file-content encoding for the current buffer
o.history = 1000 -- a history of ":" commands
o.undolevels = 500 -- maximum number of changes that can be undone

-- split windows
o.splitbelow = true -- splitting a window will put the new window below the current
o.splitright = true -- splitting a window will put the new window right of the current one
o.inccommand = "split" -- shows the effects of a command incrementally in the buffer and partial off-screen results in a preview window

-- clipboard
o.clipboard:append "unnamedplus" -- use system clipboard register "+" as default register

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- highlight trailing whitespace(s)
vim.cmd "hi TrSpace ctermbg=red guibg=red"
vim.fn.matchadd("TrSpace", [[\s\+$]])

-- built in file explorer
g.netrw_liststyle = 3 -- tree style listing
