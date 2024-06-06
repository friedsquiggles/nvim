return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {},
    })

    local map = vim.keymap.set
    -- Basic debugging keymaps, feel free to change to your liking!
    map("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
    map("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
    map("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    map("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    map("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    map("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Breakpoint" })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }
  end,
}

-- }
-- require('dapui').setup()
-- require('dap-go').setup()
-- require('nvim-dap-virtual-text').setup()
-- vim.fn.sign_define('DapBreakpoint', { text='🔴', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
--
-- -- Debugger
-- vim.api.nvim_set_keymap("n", "<leader>dt", ":DapUiToggle<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", {noremap=true})
-- vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset = true})<CR>", {noremap=true})
