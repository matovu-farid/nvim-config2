local code = require "luasnip.loaders.from_vscode"
code.lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets" } }
require("colorizer").setup { mode = "virtualtext" }

require "configs.telescope"

pcall(function()
  vim.keymap.del("n", "<leader>e")
  vim.keymap.del("n", "<tab>")
end)


