local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fs', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>hs', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>tt', ':Telescope <CR>')
