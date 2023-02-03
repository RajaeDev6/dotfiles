local options = {
    number = true,
	autoindent = true,
	smartindent = true,
    breakindent = true,
	title = true,
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	smarttab = true,
	backup = false,
	cursorline = true,
    termguicolors = true,
	splitright = true,
	scrolloff = 5,
	wrap = true,
	fileencoding = 'utf-8',
	mouse ='a',
	winblend = 0,
	background = 'dark',
	syntax = 'enable',
	linespace = 8,
	textwidth = 90,
	hidden = true,
	completeopt='menuone,noinsert,noselect',
	incsearch = true,
	undofile = true,
}
for option, value in pairs(options) do
	vim.opt[option] = value
end

vim.api.nvim_create_autocmd('TextYankPost',{
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 200,
        })
        print("text copied")
    end,
    desc = "copy text"
})



