local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
    -- let Paq manage itself
    "savq/paq-nvim";

    -- colorscheme
    "dracula/vim";
    "arcticicestudio/nord-vim";
    "morhetz/gruvbox";
    "phanviet/vim-monokai-pro";

    -- ui
    "kyazdani42/nvim-tree.lua";
    "kyazdani42/nvim-web-devicons";
    "tpope/vim-fugitive";
    "gennaro-tedesco/nvim-commaround";
    "folke/which-key.nvim";

    -- fuzzy searching
    "nvim-lua/popup.nvim";
    "nvim-lua/plenary.nvim";
    "nvim-telescope/telescope.nvim";

    -- lsp
    "crispgm/nvim-go";
    "neovim/nvim-lspconfig";
    {"nvim-treesitter/nvim-treesitter", run='TSUpdate'};
    "hrsh7th/nvim-cmp";
    "hrsh7th/cmp-nvim-lsp";
    "romgrk/nvim-treesitter-context";

    -- snippets
    "hrsh7th/vim-vsnip";
    "hrsh7th/vim-vsnip-integ";
    "hrsh7th/cmp-buffer";

    -- statusline
    "nvim-lualine/lualine.nvim";

    -- git
    "lewis6991/gitsigns.nvim";

    -- autopairs
    "windwp/nvim-autopairs";
}

require("settings") -- lua/settings.lua
require("maps") -- lua/maps.lua
require("lsp") -- lua/lsp.lua
