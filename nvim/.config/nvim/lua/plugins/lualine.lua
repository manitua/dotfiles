return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require "lualine"
    local lazy_status = require "lazy.status" -- to configure lazy pending updates count

    -- LSP clients attached to buffer
    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local clients = vim.lsp.get_clients { bufnr = bufnr }
      if next(clients) == nil then
        return ""
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return "\u{f085} " .. table.concat(c, "|")
    end

    local registry = require "mason-registry"

    local mason_has_updates = function()
      local installed_packages = registry.get_installed_package_names()
      local pkgs_to_upgrade = 0

      local function callback(success)
        if success then
          pkgs_to_upgrade = pkgs_to_upgrade + 1
        end
      end

      for _, pkg in pairs(installed_packages) do
        local p = registry.get_package(pkg)
        if p then
          p:check_new_version(callback)
        end
      end

      return pkgs_to_upgrade ~= 0 and "\u{f019} " .. pkgs_to_upgrade or ""
    end

    lualine.setup {
      options = {
        theme = "catppuccin",
        section_separators = { left = "", right = "" },
        component_separators = { left = "󰿟", right = "󰿟" },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#fab387" },
          },
          {
            mason_has_updates,
            color = { fg = "#f38ba8" },
          },
          {
            clients_lsp,
            color = { fg = "#89b4fa" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    }
  end,
}
