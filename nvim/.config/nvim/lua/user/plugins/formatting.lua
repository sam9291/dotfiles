return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "dprint" },
        typescript = { "dprint" },
        javascriptreact = { "dprint" },
        typescriptreact = { "dprint" },
        svelte = { "dprint" },
        css = { "dprint" },
        html = { "dprint" },
        json = { "dprint" },
        yaml = { "dprint" },
        markdown = { "dprint" },
        graphql = { "dprint" },
        csharp = { "dprint" },
        lua = { "stylua" },
      },
      -- format_on_save = {
      -- 	lsp_fallback = true,
      -- 	async = false,
      -- 	timeout_ms = 5000,
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fm", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 10000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
