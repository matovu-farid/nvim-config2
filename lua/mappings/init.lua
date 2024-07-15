require "nvchad.mappings"
require "mappings.git"
require "mappings.treesitter"
require "mappings.treesitter"


local scratch = require "scratch"
local telescopeBuiltins = require "telescope.builtin"
local whichKey = require("which-key")

local map = vim.keymap.set
local input = vim.ui.input

map("n", "<leader>rt", telescopeBuiltins.resume, { desc = "Resume last telescope" })
map("n", "<leader>h", telescopeBuiltins.help_tags, { desc = "Search help tags" })

-- reset keymaps
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
whichKey.register({
  ["<leader>sn"] = {
    name = "Snippet",
    a = { function()
      require("scissors").addNewSnippet()
    end, "Add new snippet" },
    e = { function()
      require("scissors").editSnippet()
    end, "Edit snippet" },

  },
})
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


local cmp = require "cmp"

cmp.setup {
  mapping = {
    ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },

    ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },

  },
}
local ls = require("luasnip")
map({"i", "s"}, "<C-]>", function() ls.jump( 1) end, {silent = true})
map({"i","s"}, "<C-[>", function() ls.jump(-1) end, {silent = true})

whichKey.register({
    c = {
        name = "AI/Codeactions",
      h = { "<cmd>ChatGPT<CR>", "ChatGPT" },
      e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
      g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
      t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      u = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    }
},  { prefix = "<leader>" })

map('n', '<leader>cp', ':Copilot panel<CR>', { desc = "Open Copilot panel" })
