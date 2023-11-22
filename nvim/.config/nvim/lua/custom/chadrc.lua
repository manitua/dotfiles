---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",

  hl_override = {
    CursorLine = {
      bg = {"black2", 2}
    }
  }
}

M.plugins = "custom.plugins"

return M
