-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Add empty lines before and after cursor line
vim.keymap.set("n", "<CR>", "o<Esc>k")
vim.keymap.set("n", "<S-CR>", "O<Esc>j")
