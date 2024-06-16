return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-project.nvim",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local transform_mod = require("telescope.actions.mt").transform_mod

    local trouble = require("trouble")
    local trouble_telescope = require("trouble.providers.telescope")

    -- or create your custom action
    local custom_actions = transform_mod({
      open_trouble_qflist = function(_)
        trouble.toggle("quickfix")
      end,
    })

    telescope.setup({
      defaults = {
        path_display = { "truncate" },
        file_ignore_patterns = {
          "node_modules/*",
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.smart_send_to_qflist + custom_actions.open_trouble_qflist,
            ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
          },
        },
      },
      extensions = {
        project = {
          base_dirs = {
            "~/dev/src",
            { "~/dev/src2" },
            { "~/dev/src3", max_depth = 4 },
            { path = "~/dev/src4" },
            { path = "~/dev/src5", max_depth = 2 },
          },
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = true, -- default false
          -- default for on_project_selected = find project files
          on_project_selected = function(prompt_bufnr)
            -- Do anything you want in here. For example:
            local project_actions = require("telescope._extensions.project.actions")
            project_actions.change_working_directory(prompt_bufnr, false)
            require("harpoon.ui").nav_file(1)
          end,
        },
      },
    })

    telescope.load_extension("fzf")
    telescope.load_extension("dap")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    local builtin = require("telescope.builtin")
    keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find in open buffers" })
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files hidden=false<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set(
      "v",
      "<leader>fc",
      "<cmd>Telescope grep_string default_text=<cr>",
      { desc = "Find string under selection in cwd" }
    )
    keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
    keymap.set(
      "n",
      "<C-p>",
      ":lua require'telescope'.extensions.project.project{}<CR>",
      { noremap = true, silent = true }
    )
  end,
}
