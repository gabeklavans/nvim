return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio", -- for UI
        "leoluz/nvim-dap-go",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        require("dap-go").setup()

        vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "dap toggle breakpoint" })
        vim.keymap.set("n", "<space>drc", dap.run_to_cursor, { desc = "dap run to cursor" })
        vim.keymap.set("n", "<space>dc", dap.continue, { desc = "dap continue" })
        vim.keymap.set("n", "<space>dsi", dap.step_into, { desc = "dap step into" })
        vim.keymap.set("n", "<space>dso", dap.step_over, { desc = "dap step over" })
        vim.keymap.set("n", "<space>df", dap.step_out, { desc = "dap finish (step out)" })
        vim.keymap.set("n", "<space>dsb", dap.step_back, { desc = "dap step back" })
        vim.keymap.set("n", "<space>dr", dap.restart, { desc = "dap restart" })
        vim.keymap.set("n", "<space>dt", dap.terminate, { desc = "dap terminate" })

        vim.keymap.set("n", "<space>?", function()
            dapui.eval(nil, { enter = true })
        end, { desc = "dap eval under cursor" })
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        vim.keymap.set("n", "\\u", dapui.toggle, { desc = "dap ui toggle" })

    end
}
