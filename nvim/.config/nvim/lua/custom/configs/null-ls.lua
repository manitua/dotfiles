local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
  -- webdev stuff
  --b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),

  -- Lua
  b.formatting.stylua,

  -- Golang
  b.formatting.goimports,
  b.formatting.gofmt,

  -- scripting
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

  --confguration
  b.formatting.jsonnetfmt,
  b.formatting.packer,
  b.formatting.hclfmt,

  -- IaC
  b.diagnostics.terraform_validate
}

null_ls.setup({
  debug = true,
  sources = sources,
})
