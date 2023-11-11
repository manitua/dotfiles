local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Go lsp
lspconfig["gopls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    }
  },
  vim.cmd(
    "autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 1000)"
  )
}

-- bicep lsp
local bicep_lsp_bin = "/home/jasmin/.local/share/nvim/mason/bin/bicep-lsp"

lspconfig["bicep"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    bicep_lsp_bin
  }
}

-- YAML lsp
lspconfig["yamlls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/docker-compose.*"
      }
    }
  }
}

-- azure pipelines lsp
lspconfig["azure_pipelines_ls"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = {
          "/azure-pipeline*.y*l",
        }
      }
    }
  }
}

-- lsps with default config
local servers = {
  "html",
  "cssls",
  "pylsp",
  "jsonls",
  "jsonnet_ls",
  "terraformls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
