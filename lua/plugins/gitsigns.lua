return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map('n', ']c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ ']c', bang = true })
                else
                    gitsigns.nav_hunk('next')
                end
            end)

            map('n', '[c', function()
                if vim.wo.diff then
                    vim.cmd.normal({ '[c', bang = true })
                else
                    gitsigns.nav_hunk('prev')
                end
            end)

            -- Actions
            map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "[H]unk [S]tage" })
            map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "[H]unk [R]eset" })
            map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "[H]unk [S]tage" })
            map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,
                { desc = "[H]unk [R]eset" })
            map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "[H]unk [U]ndo Stage" })
            map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "Buff[h]er [R]eset" })
            map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "[H]unk [P]review" })
            map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = "[H]uh? [B]lame Line" })
            map('n', '<leader>ht', gitsigns.toggle_current_line_blame, { desc = "[H]uh? [T]oggle Inline Blame" })
            map('n', '<leader>hd', gitsigns.diffthis, { desc = "Buff[h]er [D]iff" })
            -- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
            map('n', '<leader>td', gitsigns.toggle_deleted)
        end
    }
}
