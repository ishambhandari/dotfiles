-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- coming out to normal mode
keymap.set("i", "jk", "<Esc>")

--Select all
keymap.set("n", "c-a", "gg<S-v>G")

--tabedits
keymap.set("n", "te", ":tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<S-tab>", ":tabprev<Return>", opts)
keymap.set("n", "sl", "<C-w>l")

--move window
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sj", "<C-w>j")

--create window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

--Diagnostics
keymap.set("n", "C-S-j", function()
  vim.diagnostic.goto_next()
end, opts)

-- jump down up
vim.api.nvim_set_keymap("n", "<C-j>", "10j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "10k", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<C-k>", "10k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-j>", "10j", { noremap = true, silent = true })

