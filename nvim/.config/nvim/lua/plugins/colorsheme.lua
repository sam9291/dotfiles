return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load tokyonight
  {
    "LazyVim/LazyVim",
    "folke/tokyonight.nvim",
    "oxfist/night-owl.nvim",
    opts = {
      colorscheme = "night-owl",
    },
  },
}
