return {
  "Mofiqul/vscode.nvim",
  config = function()
    -- VsCode dark theme setup
    local c = require("vscode.colors").get_colors()
    require("vscode").setup({
      -- Alternatively set style in setup
      style = "dark",

      -- Enable transparent background
      transparent = false,

      -- Enable italic comment
      italic_comments = false,

      -- Underline `@markup.link.*` variants
      underline_links = true,

      -- Disable nvim-tree background color
      disable_nvimtree_bg = true,

      -- Override colors (see ./lua/vscode/colors.lua)
      color_overrides = {
        vscLineNumber = "#FFFFFF",
      },

      -- Override highlight groups (see ./lua/vscode/theme.lua)
      group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
      },
    })

    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>TL", function() require("vscode").load("light") end, { desc = "Switch to light theme" })
    keymap.set("n", "<leader>TD", function() require("vscode").load("dark") end, { desc = "Switch to dark theme" })
    require("vscode").load()
  end,
}
