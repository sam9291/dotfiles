return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load tokyonight
  {
    "LazyVim/LazyVim",
    "folke/tokyonight.nvim",
    opts = {
      colorscheme = "moon",
    },
  },
}
