-----------------------------------------------------------
-- File manager configuration file
-----------------------------------------------------------

-- Plugin: nvim-tree
-- url: https://github.com/kyazdani42/nvim-tree.lua

-- Keybindings are defined in `core/keymaps.lua`:
-- https://github.com/kyazdani42/nvim-tree.lua#keybindings

local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
    return
end

-- Call setup:
-- Each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`)

-- Folders
vim.cmd [[ highlight NvimTreeFolderName guifg=#9a6ace gui=bold ]]
vim.cmd [[ highlight NvimTreeOpenedFolderName guifg=#7dcfff gui=italic,bold,underline ]]
vim.cmd [[ highlight NvimTreeEmptyFolderName guifg=#f7768e gui=italic,bold ]]
vim.cmd [[ highlight NvimTreeRootFolder guifg=#7dcfff gui=italic,bold,underline ]]

-- Indent Marker
vim.cmd [[highlight NvimTreeIndentMarker guifg=#83ff63 ]]

-- Opened File
vim.cmd [[ highlight NvimTreeOpenedFile gui=italic,bold ]]

-- Symbolic link
vim.cmd [[ highlight NvimTreeSymlink guifg=#08FF83 gui=italic,bold ]]

-- Diagnostics
vim.cmd [[ highlight NvimTreeLspDiagnosticsError guifg=#f7768e ]]
vim.cmd [[ highlight NvimTreeLspDiagnosticsWarning guifg=#fff747 ]]
vim.cmd [[ highlight NvimTreeLspDiagnosticsInformation guifg=#9ece6a ]]
vim.cmd [[ highlight NvimTreeLspDiagnosticsHint guifg=#8accf9 ]]

-- Folders
vim.cmd [[ highlight NvimTreeFolderIcon guifg=#7dcfff ]]



nvim_tree.setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    --disable_netrw = false, -> already disabled on `/core/options.lua`
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    --ignore_buffer_on_setup = false,
    --open_on_setup = true,
    --open_on_setup_file = true,
    open_on_tab = true,
    sort_by = "name",
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    update_cwd = true,
    view = {
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- user mappings go here
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        highlight_opened_files = "all",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    --ignore_ft_on_setup = {},
    system_open = {
        cmd = "",
        args = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = true,
        custom = {},
        exclude = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = true,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
        },
    },
}
