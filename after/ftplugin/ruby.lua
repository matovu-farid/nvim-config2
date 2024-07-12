local map = vim.keymap.set

map("n", "<leader>em",":Emodel", { desc = "Edit model" })
map("n", "<leader>ev",":Eview", { desc = "Edit view" })
map("n", "<leader>ec",":Econtroller", { desc = "Edit controller" })
