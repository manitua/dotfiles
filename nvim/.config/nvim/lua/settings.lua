local o = vim.o  -- global options
local wo = vim.wo  -- window options
local bo = vim.bo  -- buffer options

-- colorscheme
vim.g.syntax_on = true
vim.cmd("colorscheme dracula")

-- visual
o.background         = "dark"
o.termguicolors      = true  -- Use true colors, required for some plugins
wo.number            = true
wo.relativenumber    = true
o.list               = true
o.listchars          = "tab:▸ ,extends:›,precedes:‹,nbsp:·,trail:·"
o.cursorline         = true
o.cursorcolumn       = true
o.colorcolumn        = "95"
o.showcmd            = true  -- Show command as it's being typed
o.showmode           = true

-- behaviour
o.scrolloff          = 1
o.sidescrolloff      = 5
o.lazyredraw         = true
o.ignorecase         = true  -- Ignore case when using lowercase in search
o.smartcase          = true  -- But don't ignore it when using upper case
wo.wrap              = false
o.expandtab          = true
o.shiftround         = true
o.shiftwidth         = 4
o.tabstop            = 4
o.softtabstop        = 4

-- Vim specific
o.hidden             = true -- Do not save when switching buffers
o.fileencoding       = "utf-8"
o.swapfile           = false
o.backup             = false
o.history            = 1000
o.undolevels         = 500
o.mouse              = ''
o.errorbells         = false
o.visualbell         = false

o.spell              = false
o.spelllang          = "en_us"
o.wildmode           = "longest,full"
o.completeopt        = "menuone,noinsert,noselect"
vim.opt.shortmess:append({c = true})
vim.opt.formatoptions:append({r = false, o = false, n = true})

require("go").setup {}
require("nvim-tree").setup {}

require("lualine").setup {
    options = {
        -- theme = 'nord',
        theme = 'dracula',
        -- theme = 'OceanicNext',
        extensions = { 'nvim-tree', 'quickfix' }
    },
}

local cmp = require("cmp")
cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    },
    mapping = {
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
        }),
    },
    sources = {
        { name = 'path' },
        { name = 'buffer' },
        { name = 'calc' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'vsnip' },
        { name = 'treesitter' },
    }
}

require("which-key").setup {}
require("nvim-autopairs").setup {}

require("gitsigns").setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
}
