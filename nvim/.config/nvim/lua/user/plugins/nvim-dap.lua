return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local map = vim.keymap.set

    local dap, dapui = require("dap"), require("dapui")
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    dap.adapters.coreclr = {
      type = "executable",
      command = "/opt/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }
    dap.configurations.cs = {
      {
        type = "coreclr",
        name = "Attach to process",
        request = "attach",
        processId = require("dap.utils").pick_process,
      },
    }
    dap.adapters.netcoredbg = {
      type = "executable",
      command = "/opt/netcoredbg/netcoredbg",
      args = { "--interpreter=vscode" },
    }
    dapui.setup()
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
    vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef", bg = "#31353f" })
    vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379", bg = "#31353f" })
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapLogPoint",
      { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
    )

    local function start_debugger(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        local dap_config = {
          type = "coreclr",
          name = "Launch Debug",
          request = "launch",
          cwd = function()
            return vim.fn.getcwd()
          end,
          program = selection.value,
        }
        dap.run(dap_config)
      end)
      return true
    end

    map("n", "<Leader>ds", function()
      local opts = {
        prompt_title = "Select dotnet app .dll file to start debugging",
        attach_mappings = start_debugger,
        cwd = vim.fn.getcwd(),
      }
      builtin.find_files(opts)
    end, { silent = true, desc = "Start Debugger" })
    map("n", "<leader>dt", dap.toggle_breakpoint, { silent = true, desc = "Toggle Breakpoint" })
    map("n", "<F9>", dap.toggle_breakpoint, { silent = true, desc = "Toggle Breakpoint" })
    map("n", "<F5>", dap.continue, { silent = true, desc = "Continue" })
    map("n", "<S-F5>", dap.close, { silent = true, desc = "Close Debugger" })
    map("n", "<F11>", dap.step_into, { silent = true, desc = "Step Into" })
    map("n", "<F10>", dap.step_over, { silent = true, desc = "Step Over" })
    map("n", "<F12>", dap.step_out, { silent = true, desc = "Step Out" })
    map("n", "<Leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { silent = true, desc = "Set Breakpoint Condition" })
    map("n", "<Leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end, { silent = true, desc = "Set log point" })
    map("n", "<Leader>dr", dap.repl.open, { silent = true, desc = "Open REPL Pane" })
    map("n", "<Leader>dl", dap.run_last, { silent = true, desc = "DAP run last" })
    map("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", { silent = true, noremap=true, desc = "Reset DAP UI Layout" })
  end,
}
