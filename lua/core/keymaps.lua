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
map('n', '<leader>cl', ':q<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<leader>tr', ':ToggleTerm direction=float<CR>')     -- open
map('t', '<Esc>', '<C-\\><C-n>')                            -- exit

-- NvimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>')                -- open/close
map('n', '<C-f>', ':NvimTreeRefresh<CR>')                   -- refresh
map('n', '<C-n>', ':NvimTreeFindFile<CR>')                  -- search file

-- Tagbar
map('n', '<leader>z', ':TagbarToggle<CR>')                  -- open/close

-- Find / Replace
map('n', '<leader>ff', ':/' )                               -- Find
map('n', '<leader>rr', ':%s/')                              -- Replace

-- Bufferline
map('n', '<leader>2', ':BufferLineCycleNext<CR>')           -- Next buff
map('n', '<leader>1', ':BufferLineCyclePrev<CR>')           -- Prev buff

-- Markdown
map('n', '<leader>mk', ':MarkdownPreview<CR>')              -- Markdown prev

-- Telescope
map('n', '<leader>tf', ':Telescope find_files hidden=true<CR>')     -- Find files
map('n', '<leader>tg', ':Telescope live_grep<CR>')      -- Live grep
map('n', '<leader>tb', ':Telescope buffers<CR>')        -- Search buff
map('n', '<leader>tht', ':Telescope help_tags<CR>')      -- Help tags

-- Nvim Comment
map('n', '<leader>cm', ':CommentToggle<CR>')        -- comment one line
map('v', '<leader>cm', ':\'<,\'>CommentToggle<CR>') -- comment selected lines in visual mode

-- Trouble
map('n', '<leader>xw', ':TroubleToggle workspace_diagnostics<CR>')  --workspace
map('n', '<leader>xd', ':TroubleToggle document_diagnostics<CR>')   --document
map('n', '<leader>xq', ':TroubleToggle quickfix<CR>')               --quickfix
map('n', '<leader>xl', ':TroubleToggle loclist<CR>')                --loclit
