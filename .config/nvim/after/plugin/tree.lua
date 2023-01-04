local status, nvimtree = pcall(require, "nvim-tree")
if not status then
  return
end

-- recommended settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "▼",
          arrow_open = "➤"
        }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  }
})
