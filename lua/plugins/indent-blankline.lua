-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim


local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

--colors
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#1EFF8E gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#8E1EFF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#1E8EFF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#8EFF1E gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#FF8E1E gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C2C2C2 gui=nocombine]]

indent_blankline.setup {
  char = "▏",
  use_treesitter = true,
  show_first_indent_level = false,
  filetype_exclude = {
    'help',
    'dashboard',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'NvimTree',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
  char_highlight_list = {
      "IndentBlanklineIndent1",
      "IndentBlanklineIndent2",
      "IndentBlanklineIndent3",
      "IndentBlanklineIndent4",
      "IndentBlanklineIndent5",
      "IndentBlanklineIndent6",
  }
}
