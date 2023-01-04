local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer() -- true if packer installed

-- auto update all plugins
vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
    augroup end
  ]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "olimorris/onedarkpro.nvim"
  use "bluz71/vim-moonfly-colors"
  use "numToStr/Comment.nvim" -- gc + motion
  use "nvim-lua/plenary.nvim" -- lua functions that plugins use
  use "nvim-lualine/lualine.nvim"

  use {
    "nvim-tree/nvim-tree.lua", -- file explorer
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }

  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x"
  }

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  use "neovim/nvim-lspconfig"
  use "mfussenegger/nvim-jdtls"

  use "hrsh7th/cmp-nvim-lsp"
  use { "glepnir/lspsaga.nvim", branch = "main" }
  use "jose-elias-alvarez/typescript.nvim"
  use "onsails/lspkind.nvim"

  use {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {

      }
    end,
  }

  use "lewis6991/gitsigns.nvim"

  -- use "MunifTanjim/eslint.nvim"
  -- remove ID : #2022-12-30-1
  use 'jose-elias-alvarez/null-ls.nvim'
  use "MunifTanjim/prettier.nvim"
  use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    require('git-conflict').setup()
  end}
  use ({ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}})

  use 'mbbill/undotree'
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'tpope/vim-fugitive'

  if packer_bootstrap then
    packer.sync()
  end
end)
