-----------------------------------------------------------
-- Mason configuration file
-----------------------------------------------------------

-- Plugin: mason
-- url: https://github.com/williamboman/mason.nvim

local status_ok, mason = pcall(require, 'mason')
if not status_ok then
  return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
