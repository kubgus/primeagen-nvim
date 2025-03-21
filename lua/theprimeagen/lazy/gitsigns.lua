return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup {
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable = true,
            signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
            numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
            linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
            word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
            watch_gitdir = {
                follow_files = true
            },
            auto_attach = true,
            attach_to_untracked = false,
            current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 1000,
                ignore_whitespace = false,
                virt_text_priority = 100,
                use_focus = true,
            },
            current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
            sign_priority = 6,
            update_debounce = 100,
            status_formatter = nil, -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            preview_config = {
                -- Options passed to nvim_open_win
                border = 'single',
                style = 'minimal',
                relative = 'cursor',
                row = 0,
                col = 1
            },
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                vim.keymap.set('n', '<leader>ga', gitsigns.stage_hunk)
                vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk)

                vim.keymap.set('v', '<leader>ga', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                vim.keymap.set('v', '<leader>gr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)

                vim.keymap.set('n', '<leader>gA', gitsigns.stage_buffer)
                vim.keymap.set('n', '<leader>gR', gitsigns.reset_buffer)
                vim.keymap.set('n', '<leader>gp', gitsigns.preview_hunk)
                vim.keymap.set('n', '<leader>gi', gitsigns.preview_hunk_inline)

                vim.keymap.set('n', '<leader>gb', function()
                    gitsigns.blame_line({ full = true })
                end)

                vim.keymap.set('n', '<leader>gd', gitsigns.diffthis)

                vim.keymap.set('n', '<leader>gD', function()
                    gitsigns.diffthis('~')
                end)

                vim.keymap.set('n', '<leader>gQ', function() gitsigns.setqflist('all') end)
                vim.keymap.set('n', '<leader>gq', gitsigns.setqflist)

                -- Toggles
                vim.keymap.set('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
                vim.keymap.set('n', '<leader>gtd', gitsigns.toggle_deleted)
                vim.keymap.set('n', '<leader>gtw', gitsigns.toggle_word_diff)
            end
        }
    end
}
