return {
    "theprimeagen/harpoon",
    config = function()
        -- harpoon mapping
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set('n', '<leader>a', mark.add_file, { desc = "Add file to harpoon" })
        vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu, { desc = "View harpoon quick menu" })
        vim.keymap.set('n', '<leader>j', function() ui.nav_file(1) end, { desc = "Go to harpoon 1" })
        vim.keymap.set('n', '<leader>k', function() ui.nav_file(2) end, { desc = "Go to harpoon 2" })

    end
}
