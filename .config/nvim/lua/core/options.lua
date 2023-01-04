local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true

opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

opt.cursorline = true

opt.termguicolors = true
opt.scrolloff = 8
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "100"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.laststatus = 3

local function status_line()
    return "%= %m %f"
end
opt.winbar = status_line()

opt.updatetime = 50





























