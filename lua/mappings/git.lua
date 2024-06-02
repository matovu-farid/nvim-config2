local map = vim.keymap.set
local input = vim.ui.input
local function stageAll()
  vim.cmd "Git add ."
end

local function stageCurrent()
  vim.cmd "Git add %"
end
local function commit(stager)
  stager()
  input({ prompt = "Commit message: " }, function(message)
    if message ~= "" then
      vim.cmd('Git commit -m "' .. message .. '"')
    end
    return message
  end)
end

local function commitAll()
  commit(stageAll)
end

local function commitCurrent()
  commit(stageCurrent)
end
local function push()
  vim.cmd "Git push"
end

local function stash()
  vim.cmd "Git stash"
end

local function create_repo()
  input({ prompt = "Repo name: " }, function(name)
    if name ~= "" then
      vim.cmd ("!gh repo create ".. name .."--public --push --source .")
    end
  end)
end

map("n", "<leader>gs", stash, { desc = "Git stash" })
map("n", "<leader>gca", commitAll, { desc = "Git commit All" })
map("n", "<leader>gcc", commitCurrent, { desc = "Git commit Current file" })
map("n", "<leader>gp", push, { desc = "Git push" })
map("n", "<leader>gcr", create_repo, { desc = "Create a new github repo" })
