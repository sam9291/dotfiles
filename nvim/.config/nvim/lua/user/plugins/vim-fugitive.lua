return {
  "tpope/vim-fugitive",
  config = function()
    -- vim-fugitive mapping
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open git tool" })
    vim.keymap.set("n", "<leader>gf", ":G fetch --prune<CR>", { desc = "Git fetch prune" })
    vim.keymap.set("n", "<leader>gp", ":G pull<CR>", { desc = "Git pull" })
    vim.keymap.set("n", "<leader>gb", ":G blame<CR>", { desc = "Git blame" })
    vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>", { desc = "Git merge take left (local)" })
    vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>", { desc = "Git merge take right (remote)" })
    vim.keymap.set("n", "<leader>gm", ":Gvdiffsplit!<CR>", { desc = "Git merge diff split" })
  end,
}
