require "nvchad.options"
-- add yours here!

local o = vim.o
local g = vim.g
-- o.cursorlineopt ='both' -- to enable cursorline!
o.foldcolumn = "0" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true
o.relativenumber = true
g.vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets"
g.dadbod_manage_dbext = true
-- g.ale_fixers = {
--    eruby= { 'erb-formatter' }
-- }
