vim.g.mapleader = ","

require("config.lazy")
require("config.settings")

vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })
vim.keymap.set("n", "<C-s>", ':w<CR>', { noremap = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true })

vim.keymap.set("n", "j", "gj", { noremap = true})
vim.keymap.set("n", "k", "gk", { noremap = true})

vim.keymap.set("n", "`", ':Neotree toggle<CR>', { noremap = true })

--vim.keymap.set({"n", "v" }, "yd", '0v$"+y<Esc>', { noremap = true })
vim.keymap.set("ca", "w!!", "silent! write !doas tee % >/dev/null")

vim.keymap.set("n", "n", "nzz", { noremap = true })
vim.keymap.set("n", "N", "Nzz", { noremap = true })
vim.keymap.set("n", "*", "*zz", { noremap = true })
vim.keymap.set("n", "#", "#zz", { noremap = true })
vim.keymap.set("n", "g*", "g*zz", { noremap = true })
vim.keymap.set("n", "g#", "g#zz", { noremap = true })
vim.keymap.set("n", "G", "Gzz", { noremap = true, desc = "Go to bottom and center" })

vim.keymap.set({ "n", "v" }, "gh", "0", { noremap = true, desc = "Go to start of line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { noremap = true, desc = "Go to end of line" })

vim.keymap.set({ "n" }, "Q", "gq", { noremap = true })
vim.keymap.set({ "n" }, "S", ":%s//g<Left><Left>", { noremap = true })

vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { noremap = true })

