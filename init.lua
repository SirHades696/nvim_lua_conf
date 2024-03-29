--[[

Neovim init file
Maintainer: brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

local _impatient, impatient = pcall(require, "impatient")

if _impatient then
    impatient.enable_profile()
end

-- Import Lua modules
require('packer_init')
require('core/provider')
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/colors')
require('core/statusline')
require('plugins/telescope')
require('plugins/nvim-comment')
require('plugins/bufferline')
require('plugins/colorizer')
require('plugins/nvim-tree')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-lspconfig')
require('plugins/nvim-treesitter')
require('plugins/null-ls')
require('plugins/alpha-nvim')
require('plugins/mason')
require('plugins/snippets')
require('plugins/persisted')

-- init.lua
vim.api.nvim_create_autocmd({ "VimLeave" }, {
  callback = function()
    vim.fn.jobstart('notify-send "NVIM CLOSE"', {detach=true})
  end,
})
