-- TODO: Setup nerd tree shortcuts
--
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require('ensure_packer')()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
	-- color scheme
	"catppuccin/nvim",
	as = "cattpuccin",
	config = function()
		require("catppuccin").setup({
	        flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { light = "latte", dark = "mocha" }
       	})
        vim.cmd.colorscheme "catppuccin"
	end
  }
  
  -- todo highlight
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

  -- latex
  use {
      'lervag/vimtex',
      config = function()
        vimtex_view_method = 'zathura'
        vimtex_compiler_method = 'latexrun'
    end
  }

  -- file explorer
  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    require('nvim-tree').setup()
  end
}
end)

