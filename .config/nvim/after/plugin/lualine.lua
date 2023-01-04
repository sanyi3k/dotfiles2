local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup{
    options = { globalstatus = true, theme = 'dracula' , section_separators = '', component_separators = ''}
}
