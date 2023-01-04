local status, _ = pcall(vim.cmd, "colorscheme moonfly")
if not status then
  print("Colorscheme not found!")
  return
end


vim.cmd([[highlight WinSeparator guibg=None]])
vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
vim.cmd([[highlight NvimTreeBg guibg=NONE]])
