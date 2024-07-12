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

local function status()
  vim.cmd "Git status"
end

local function diff()
  vim.cmd "Git diff ."
end

local function create_repo()
  input({ prompt = "Repo name: " }, function(name)
    if name ~= "" then
      vim.cmd ("!gh repo create ".. name .." --public --push --source .")
    end
  end)
end




local which_key = require("which-key")
which_key.register({
  ["<leader>g"] = {
    name = "Git",
    s = { status, "Git status" },
    d = { diff, "Git diff" },
    c = {
      name = "Commit",
      a = { commitAll, "Git commit all" },
      c = { commitCurrent, "Git commit current file" },
    },
    p = { push, "Git push" },
    r = { create_repo, "Create a new github repo" },
  },
})
