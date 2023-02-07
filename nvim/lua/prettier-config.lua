local prettier = require("prettier.nvim")
vim.api.nvim_command("autocmd BufWritePre *.html,*.js,*.css :call prettier#format_file()")
