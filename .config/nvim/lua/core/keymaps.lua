vim.g.mapleader = " "
local keymap = vim.keymap

keymap.set("n", "x", '"_x')

-- telescope
keymap.set("n", "<leader>o", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>O", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>")
keymap.set("n", "<leader>F", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>h", "<cmd>Telescope help_tags<cr>")

-- window navigation 
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Lspsaga
keymap.set("n", "<leader>Q", "<cmd>Lspsaga code_action<cr>")
keymap.set("n", "<leader>W", "<cmd>Lspsaga show_line_diagnostics<cr>")

-- centering searchs and jumps
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

-- Copy will be stay in register
keymap.set("x", "<leader>p", "\"_dP")

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>E", ":NvimTreeFindFile<CR>")

-- Move code 
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Lspsaga
local opts = { noremap = true, silent = true}
keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
keymap.set("n", "<leader>]", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side

-- DAP
keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
keymap.set("n", "<leader>ds", "<cmd>lua require('dap').continue()<CR>")
keymap.set("n", "<leader>dc", "<cmd>lua require('dapui').close()<CR>")
keymap.set("n", "<leader>do", "<cmd>lua require('dapui').open()<CR>")

