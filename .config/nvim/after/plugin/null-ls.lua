local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

-- format on save
vim.api.nvim_clear_autocmds({ group = group })
vim.api.nvim_create_autocmd(event, {
  group = group,
  callback = function()
    vim.lsp.buf.format({ async = async })
  end,
  desc = "[lsp] format on save",
})


null_ls.setup()
