-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<Leader>h', '<C-w>h')
map('n', '<Leader>j', '<C-w>j')
map('n', '<Leader>k', '<C-w>k')
map('n', '<Leader>l', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<C-u>', ':so %<CR>')

-- Fast saving with <leader> and s
map('n', '<leader>w', ':w<CR>')
map('i', '<leader>w', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<leader>tr', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>')       -- open/close
map('n', '<C-f>', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<C-n>', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Find / Replace
map('n', '<leader>f', ':/' )
map('n', '<leader>r', ':%s/')

-- Bufferline
map('n', '<leader>2', ':BufferLineCycleNext<CR>')
map('n', '<leader>1', ':BufferLineCyclePrev<CR>')

-- Markdown
map('n', '<leader>mk', ':MarkdownPreview<CR>')
