local M = {}

M.treesitter = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- web
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "svelte",

    -- dev
    "make",
    "go",
    "gomod",
    "gowork",
    "c",
    "rust",
    "c_sharp",
    "dockerfile",

    -- scripting
    "bash",
    "python",

    -- serialization
    "json",
    "yaml",

    -- IaC
    "bicep",
    "terraform",

    --confguration
    "toml",
    "hcl",
    "jsonnet",

    -- text
    "markdown",
    "markdown_inline",
    "latex",

    -- misc
    "comment",
    "regex",
    "http",
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- web
    "html-lsp",
    "css-lsp",
    "prettier",

    -- Go
    "gopls",
    "goimports",

    -- scripting
    "shfmt",
    "shellcheck",

    -- serialization
    "json-lsp",
    "yaml-language-server",

    -- IaC
    "bicep-lsp",
    "terraform-ls",

    --confguration
    "jsonnet-language-server",

    -- pipelines
    "azure-pipelines-language-server",
  }
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.gitsigns = {
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '-' },
    topdelete    = { text = '-' },
    changedelete = { text = '~' },
  },
}

return M
