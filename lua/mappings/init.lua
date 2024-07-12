require "nvchad.mappings"
require "mappings.git"
require "mappings.treesitter"

local scratch = require "scratch"
local telescopeBuiltins = require "telescope.builtin"

local map = vim.keymap.set
local input = vim.ui.input

map("n", "<leader>rt", telescopeBuiltins.resume, { desc = "Resume last telescope" })
map("n", "<leader>h", telescopeBuiltins.help_tags, { desc = "Search help tags" })

-- reset keymaps
vim.keymap.del("n",  "<leader>e")
-- map("n", "<leader>e", function()
--   scratch.open({ bufname = "scratch" })
-- end, { desc = "Open scratch buffer" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>on", ":only<CR>", { desc = "Close all other windows" })

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>z", ":qa<CR>", { desc = "Quit all" })
map("n", "<leader>q", ":bw<CR>", { desc = "Quit" })
map("n", "<leader>sa", ":wall<CR>", { desc = "Save all" })
map("n", "<leader>x", ":source %<CR>", { desc = "Resource" })
map("n", "<leader>rn", function()
  input({ prompt = "New name: " }, vim.lsp.buf.rename)
end, { desc = "Resource" })
map("n", "<leader>gs", ":G stash", { desc = "Git stash" })
map("n", "<leader>sne", function()
  require("scissors").editSnippet()
end)
map({ "n", "x" }, "<leader>sna", function()
  require("scissors").addNewSnippet()
end)
map("n", "]q", ":cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", ":cprev<CR>", { desc = "Previous quickfix" })
map("n", "]e", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "gl", ":vertical wincmd L<CR>", { silent = true, noremap = true, desc = "Put buffer on the right" })
map("n", "gh", ":vertical wincmd H<CR>", { silent = true, noremap = true, desc = "Put buffer on the left" })
map("n", "gj", ":wincmd J<CR>", { silent = true, noremap = true, desc = "Put buffer on the top" })
map("n", "gk", ":wincmd K<CR>", { silent = true, noremap = true, desc = "Put buffer on the bottom" })
map("n", "<C-w>|", ":vertical split right<CR>", { silent = true, noremap = true, desc = "vertical split" })
map("n", "<C-w>_", ":split<CR>", { silent = true, noremap = true, desc = "horzontal split" })
map(
  "n",
  "<leader>fp",
  ":Telescope neovim-project discover<CR>",
  { silent = true, noremap = true, desc = "Find project" }
)
map(
  "n",
  "<leader>fh",
  ":Telescope neovim-project history<CR>",
  { silent = true, noremap = true, desc = "Find project" }
)
map("n", "gt", ":tab split<CR>", { silent = true, noremap = true, desc = "Put buffer in new tab" })
map("n", "<leader>ll", ":NeovimProjectLoadRecent<CR>", { silent = true, noremap = true, desc = "Load recent project" })
map("n", "<leader>ns", "<cmd>lua require('package-info').show()<cr>", { silent = true, noremap = true })
map("n", "gtd", vim.lsp.buf.type_definition, { desc = "Type definition" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Type definition" })

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })
function Split(s, delimiter)
  result = {}
  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

function PrintTable(table)
  for k, v in pairs(table) do
    print(k, v)
  end
end

local function syscall()
  input({ prompt = "Enter command: " }, function(cmd)
    if cmd ~= "" then
      local termComand = '2TermExec cmd="' .. cmd .. '"'
      vim.cmd(termComand)
    end
  end)
end

map("n", "<leader>tr", syscall, { desc = "Run command" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("i", "<C-y>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true
