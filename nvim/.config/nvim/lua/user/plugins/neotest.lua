return {
  "nvim-neotest/neotest",
  event = "LspAttach",
  dependencies = {
    "Issafalcon/neotest-dotnet",
  },
  config = function()
    local neotest = require("neotest")
    neotest.setup({
      adapters = {
        require("neotest-dotnet"),
      },
    })
    vim.keymap.set("n", "<leader>tr", function()
      neotest.run.run()
    end, { desc = "Run unit test" })
    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run unit tests in file" })
    vim.keymap.set("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap" })
    end, { desc = "Debug unit test" })
    vim.keymap.set("n", "<leader>tk", function()
      neotest.run.stop()
    end, { desc = "Stop nearest running unit test" })
    vim.keymap.set("n", "<leader>ta", function()
      neotest.run.attach()
    end, { desc = "Attach nearest unit test" })
    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Open test summary" })
    vim.keymap.set("n", "<leader>tSo", function()
      neotest.summary.open()
    end, { desc = "Force open test summary" })
    vim.keymap.set("n", "<leader>tSq", function()
      neotest.summary.close()
    end, { desc = "Force close test summary" })
  end,
}
