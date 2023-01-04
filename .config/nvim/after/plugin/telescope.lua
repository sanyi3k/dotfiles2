local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
  return
end

local actions_status, actions = pcall(require, "telescope.actions")
if not actions_status then
  return
end

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

telescope.load_extension("fzf")
