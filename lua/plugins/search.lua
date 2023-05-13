return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    config = function()
        local actions = require('telescope.actions')
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {"%.jpg", "%.png", "%.jpeg", "%.gif", "%.svg"},
                mappings = {
                    i = {
                        ["<esc>"] = actions.close
                    },
                },
            },
        }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
}
