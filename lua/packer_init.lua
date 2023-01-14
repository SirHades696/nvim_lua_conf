-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
      -- Add you plugins here:
    use 'wbthomason/packer.nvim' -- packer can manage itself

      -- File explorer
    use 'kyazdani42/nvim-tree.lua'

      -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

      -- Autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
          require('nvim-autopairs').setup{}
        end
      }

    -- autotags
    use {'windwp/nvim-ts-autotag',
        config= function()
            require('nvim-ts-autotag').setup{}
        end
    }

      -- Icons
    use 'kyazdani42/nvim-web-devicons'

      -- Tag viewer
    use 'preservim/tagbar'

      -- Treesitter interface
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use { 'p00f/nvim-ts-rainbow' }

      -- Color schemes
    use 'folke/tokyonight.nvim'

      -- Color CSS
    use 'norcalli/nvim-colorizer.lua'

      -- LSP
    use 'neovim/nvim-lspconfig'

      -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
          'L3MON4D3/LuaSnip',
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-buffer',
          'saadparwaiz1/cmp_luasnip',
        },
      }
    use "jose-elias-alvarez/null-ls.nvim"
      -- Statusline
    use {
        'feline-nvim/feline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
      }

      -- Bufferline
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

      -- git labels
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
          require('gitsigns').setup{}
        end
      }

      -- Dashboard (start screen)
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
      }

      -- MarkDown preview
    use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })

    -- fast loading nvim
    use 'lewis6991/impatient.nvim'


    -- Telescope
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Nvim Comment
    use "terrortylor/nvim-comment"

    -- Trouble
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", config = "require('plugins/trouble')"}

    -- Mason Packages
    use { "williamboman/mason.nvim" }

    -- Toggle Terminal
    use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
      require("toggleterm").setup()
    end
    }

    -- Snippets
    use "rafamadriz/friendly-snippets"

    -- Docstrings
    use {
        'kkoomen/vim-doge',
        run = ':call doge#install()'
    }

    if packer_bootstrap then
    require('packer').sync()
  end
end)
