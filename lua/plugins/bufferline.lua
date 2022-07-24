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
        separator_style = "padded_slant",
        enforce_regular_tabs = false,
        color_icon = true,
        always_show_bufferline = true,
        diagnostics_update_in_insert = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" ..count.. ") "
        end,
        custom_areas = {
          right = function()
            local result = {}
            local seve = vim.diagnostic.severity
            local error = #vim.diagnostic.get(0, {severity = seve.ERROR})
            local warning = #vim.diagnostic.get(0, {severity = seve.WARN})
            local info = #vim.diagnostic.get(0, {severity = seve.INFO})
            local hint = #vim.diagnostic.get(0, {severity = seve.HINT})

            if error ~= 0 then
              table.insert(result, {text = "  " .. error, guifg = "#f7768e" })
            end

            if warning ~= 0 then
              table.insert(result, {text = "  " .. warning, guifg = "#fff747" })
            end

            if hint ~= 0 then
              table.insert(result, {text = "  " .. hint, guifg = "#9ece6a" })
            end

            if info ~= 0 then
              table.insert(result, {text = "  " .. info, guifg = "#8accf9" })
            end
            return result
          end,
        }
    }
})
