vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- clipboard
opt.clipboard = "unnamedplus"

-- backspase
opt.backspace = "indent,eol,start"

-- tabs & indentation
opt.expandtab = true
opt.tabstop = 2
opt.autoindent = true
opt.shiftwidth = 2

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.wrap = true
opt.scrolloff = 10

-- search settings
-- opt.ignorecase = true
-- opt.smartcase = true

opt.autoread = true -- enable detection of external changes

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- opt.winblend = 40 -- window opacity (0-100)
-- opt.pumblend = 40 -- popup menu opacity (0-100)

opt.wildignore:append({ "*/node_modules/*" })
