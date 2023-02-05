-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- convenient netrw shortcut
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  --
  use {
	-- color scheme
	"catppuccin/nvim",
	as = "cattpuccin",
	config = function()
		require("catppuccin").setup({
	        flavour = "macchiato", -- latte, frappe, macchiato, mocha
            background = { light = "latte", dark = "frappe" },
            transparent_background = true
       	})
        vim.cmd.colorscheme "catppuccin"
	end
  }

  --[[use {
      "sainnhe/everforest",
      as = "everforest",
      config = function()
        vim.cmd.colorscheme "everforest"
      end
  }--]]

  use {
      "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
        require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
        }
    end
  }

  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate' })

  use('tpope/vim-fugitive')

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
    }
}
end)

require("after.plugin.fugitive")
require("after.plugin.lsp")
require("after.plugin.telescope")
require("after.plugin.treesitter")

-- folding
local vim = vim
local opt = vim.opt
local api = vim.api

--opt.foldmethod = "expr"
--opt.foldexpr = "nvim_treesitter#foldexpr()"

opt.foldmethod="expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
