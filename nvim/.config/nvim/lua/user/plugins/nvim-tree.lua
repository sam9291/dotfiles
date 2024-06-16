return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local function on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- nvim-tree keymap

      vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts("Toggle"))
      vim.api.nvim_set_keymap("n", "<C-f>", ":NvimTreeFindFile<CR>", opts("Find file"))
    end

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup({
      on_attach= on_attach,
      git = {
        enable = true,
        ignore = false,
      },
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = false,
      },
    })
  end,
}
