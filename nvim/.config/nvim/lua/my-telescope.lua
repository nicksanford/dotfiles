local setup, telescope = pcall(require, "telescope")
if not setup then
  print("telescope not installed")
  return
end

local setup, actions = pcall(require, "telescope.actions")
if not setup then
  print("telescope actions not installed")
  return
end
-- local action_state = require('telescope.actions.state')
telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
        ["<C-j>"] = actions.move_selection_next, -- move to next result
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
        ["<C-h>"] = "which_key"
      },
    },
  },
  -- },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
    -- Default configuration for builtin pickers goes here:
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
