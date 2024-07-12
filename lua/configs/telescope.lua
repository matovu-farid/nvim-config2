-- EXAMPLE
local telescope = require "telescope"
-- print(vim.inspect(telescope))
telescope.setup {
  defaults = {

    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").cycle_history_next,
        ["<C-k>"] = require("telescope.actions").cycle_history_prev,
      },
    },
    path_display = { "smart", "truncate" },
    dynamic_preview_title = true,
    selection_strategy = "reset",
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.87,
      height = 0.87,
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
    },
  },
}
