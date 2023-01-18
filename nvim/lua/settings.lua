local options = {
	number = true,
	relativenumber = true,
	autoindent = true,
	smartindent = true,
	title = true,
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	smarttab = true,
	backup = false,
	cursorline = true,
	splitright = true,
	scrolloff = 5,
	wrap = true,
	fileencoding = 'utf-8',
	termguicolors = true,
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

vim.cmd[[highlight Cursorline gui=underline ctermbg=NONE guibg=NONE]]
vim.cmd[[hi Normal guibg=NONE cterm=NONE]]
vim.cmd[[set termguicolors]]
