local keymap = function(mode, key, results)
    vim.api.nvim_set_keymap(mode, key, results, { noremap = true, silent = true })
end

--changing leader key
vim.g.mapleader = ' '
--comment multiple
keymap('v', 'c', '<CR>:s/^/#')
--autoimport typescript
keymap("n", "<leader>hi", ':TypescriptOrganizeImports<CR>')
keymap("n", "<leader>mi", ':TypescriptAddMissingImports<CR>')
--moving around in normal mode
keymap('n', 'j', 'h')
keymap('n', 'l', 'j')
keymap('n', ';', 'l')
--moving around in visual mode
keymap('v', 'j', 'h')
keymap('v', 'l', 'j')
keymap('v', ';', 'l')
--show recent files
keymap('n', '<leader>fr', ':History<CR>')
keymap('n', '<leader>frr', ':Files<CR>')

--open nvim-tree file explorer
keymap('n', '<leader>e', ':NvimTreeToggle<CR>')
keymap('n', '<leader>ee', ':NvimTreeFocus<CR>')

--save file
keymap('n', 'ss', ':w<CR>')
--save and quit
keymap('n', 'sq', ':wq!<CR>')
--quit
keymap('n', '<leader>q', ':q!<CR>')
--configuring jj to esc fuction
keymap('i', 'jj', '<Esc>')
keymap('v', 'jj', '<Esc>')
--source file
keymap('n', '<leader>sv', ':so %<CR>')

-- jump forward to identical word
-- keymap('n', 'jf', 'g*')
-- keymap('n', 'jb', 'g#')

--search and replace
keymap('n', "<leader>sr", ":%s/")
--removing highlight from word
keymap('n', "<leader>j", ':noh<CR>')
--open terminal
keymap('n', '<leader>t', ':vsplit<CR> :terminal<CR>')
--close terminal
keymap('t', '<leader>q', "<C-\\><C-n> :q!<CR>")

--creating and changing tab
keymap('n', '<leader>nn', ':BufferNext<CR>')
keymap('n', '<leader>nw', ':tabnew<CR>')
keymap('n', 'nb', ':BufferClose<CR>')
keymap('n', '<leader>vv', ':BufferPrevious<CR>')

--insert new line in normal mode
keymap('n', '<leader>o', 'o<esc>')
--toggle prettier
keymap('n', '<leader>fm', ':Prettier<CR>')
