require'lspsaga'.init_lsp_saga {
    error_sign = 'ﮊ',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    border_style = "round",
}

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "bicep",
        "c",
        "c_sharp",
        "comment",
        "css",
        "dockerfile",
        "go",
        "gomod",
        "gowork",
        "hcl",
        "html",
        "http",
        "javascript",
        "json",
        "jsonnet",
        "latex",
        "lua",
        "make",
        "markdown",
        "python",
        "regex",
        "rust",
        "svelte",
        "terraform",
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

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
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

nvim_lsp.azure_pipelines_ls.setup({
    on_attach=on_attach,
    capabilities=capabilities,
})
nvim_lsp.bashls.setup({ on_attach=on_attach, capabilities=capabilities })
nvim_lsp.gopls.setup { on_attach=on_attach, capabilities=capabilities }
nvim_lsp.jsonls.setup { on_attach=on_attach, capabilities=capabilities }
nvim_lsp.jsonnet_ls.setup { on_attach=on_attach, capabilities=capabilities }
nvim_lsp.yamlls.setup({
    yaml = {
        schemas = {
            ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*.yml',
            ['https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json'] = '/docker-compose.*'
        }
    },
    on_attach = on_attach,
    capabilities=capabilities,
})

nvim_lsp.terraformls.setup({ on_attach=on_attach, capabilities=capabilities })

local bicep_lsp_bin = "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"
nvim_lsp.bicep.setup({
    on_attach=on_attach, capabilities=capabilities,
    cmd = { "dotnet", bicep_lsp_bin }
})
vim.cmd("autocmd BufNewFile,BufRead *.bicep set filetype=bicep")

local on_attach_dotnet = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local pid = vim.fn.getpid()
-- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
local omnisharp_bin = "/home/jasmin/Downloads/omnisharp/OmniSharp"
nvim_lsp.omnisharp.setup({
    on_attach=on_attach_dotnet, capabilities=capabilities,
    cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }
})
