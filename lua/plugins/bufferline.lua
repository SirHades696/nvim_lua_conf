-----------------------------------------------------------
-- Bufferline configuration file
-----------------------------------------------------------

-- Plugin: bufferline
-- url: https://github.com/akinsho/bufferline.nvim

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup(
{
    options =
    {
        -- Use nvim built-in lsp
        diagnostics = "nvim_lsp",
        -- Get out of the way on the left nvim-tree The location of
        offsets = {{
            filetype = "NvimTree",
            text = " File Explorer ",
            highlight = "Directory",
            text_align = "left"
        }},
        indicator_icon = '▎',
        modified_icon = '●',
        left_trunc_marker = '',
        right_trunc_marker = '',
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        mode = "buffers",
        view = "multiwindow",
        numbers = "ordinal",
        mapping  = true,
        max_name_length = 18,
        tab_size = 18,
        show_buffer_close_icons = false,
        separator_style = "slant",
        enforce_regular_tabs = false,
        color_icon = true,
        always_show_bufferline = true,
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = " "
          for e, n in pairs(diagnostics_dict) do
            local sym = e == "error" and " "
              or (e == "warning" and " " or "" )
            s = s .. n .. sym
          end
          return s
        end
    }
})
