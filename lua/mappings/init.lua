require "nvchad.mappings"
require("mappings.git")
require("mappings.treesitter")
-- add yours here

local map = vim.keymap.set
local input = vim.ui.input
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<leader>z",":qa<CR>", {desc = "Quit all"})
map("n", "<leader>q",":q<CR>", {desc = "Quir"})
map("n", "<leader>sa",":wall<CR>", {desc = "Save all"})
map("n", "<leader>x", ":source %<CR>", {desc = "Resource"})
map("n", "<leader>rn", function() input({prompt="New name: "}, vim.lsp.buf.rename) end, {desc = "Resource"})
map("n", "<leader>gs", ":G stash", {desc="Git stash"})
map("n", "<leader>sne", function() require("scissors").editSnippet() end)
map({ "n", "x" }, "<leader>sna", function() require("scissors").addNewSnippet() end)
map("n", "]e", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map('n', 'gl', ":vertical wincmd L<CR>", { silent = true, noremap = true, desc = "Put buffer on the right" })
map('n', 'gh', ":vertical wincmd H<CR>", { silent = true, noremap = true, desc = "Put buffer on the left" })
map('n', 'gj', ":wincmd J<CR>", { silent = true, noremap = true, desc = "Put buffer on the top" })
map('n', 'gk', ":wincmd K<CR>", { silent = true, noremap = true, desc = "Put buffer on the bottom" })
map('n', '<C-w>|', ":vertical split right<CR>", { silent = true, noremap = true, desc = "vertical split" })
map('n', '<C-w>_', ":split<CR>", { silent = true, noremap = true, desc = "horzontal split" })


