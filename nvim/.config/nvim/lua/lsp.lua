require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "comment",
        "dockerfile",
        "go",
        "gomod",
        "gowork",
        "hcl",
        "html",
        "http",
        "javascript",
        "json",
        "latex",
        "lua",
        "make",
        "markdown",
        "python",
        "regex",
        "rust",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "yaml",
    },

    highlight = {
        enable = true,
        disable = {},
    },

    indent = {
        enable = false,
        disable = {},
    },

    autopairs = {
        enable = true
    }
}

require("treesitter-context").setup {
    enable = true
}

local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', '<space>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', '<space>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

nvim_lsp.gopls.setup { on_attach=on_attach, capabilities=capabilities }
