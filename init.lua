local set = vim.opt
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

set.ignorecase = true
set.smartcase = true
set.scrolloff = 18

-- Remap Esc
keymap.set("i", "<C-c>", "<Esc>")

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

vim.o.foldcolumn = '1'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

set.backup = false
set.writebackup = false
set.swapfile = false

set.relativenumber = true
set.autoindent = true
set.clipboard = "unnamedplus"
set.expandtab = true
set.mouse = "a"
set.number = true
set.shiftwidth = 2
set.softtabstop = 2
set.tabstop = 2
vim.o.updatetime = 250

-- Configurações da tecla líder
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })

-- Remapping Ctrl + d and Ctrl + u
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', opts)
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', opts)

-- Remapping n and N
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', opts)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', opts)

-- Salvar e refazer
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', opts)
vim.api.nvim_set_keymap('i', '<C-s>', '<Esc>:w<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-z>', ':redo<CR>', opts)

-- Navegação entre buffers
keymap.set('n', 'g<Right>', ':bnext<CR>', opts)
keymap.set('n', 'g<Left>', ':bprevious<CR>', opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Resize window
keymap.set("n", "<leader>h", ":vertical resize -4<CR>", opts)
keymap.set("n", "<leader>l", ":vertical resize +4<CR>", opts)
keymap.set("n", "<leader>j", ":resize +4<CR>", opts)
keymap.set("n", "<leader>k", ":resize -4<CR>", opts)

-- Personalização do highlight para busca
vim.cmd [[highlight Search ctermfg=black ctermbg=yellow]]

-- Tabs
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Mover linha atual para cima
keymap.set("n", "<S-Up>", ":m .-2<CR>==", opts)
keymap.set("i", "<S-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv", opts)

-- Mover linha atual para baixo
keymap.set("n", "<S-Down>", ":m .+1<CR>==", opts)
keymap.set("i", "<S-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv", opts)

-- File Explorer and nvimtree
keymap.set('n', '<leader>e', ':Explore<CR>', opts)
keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
keymap.set('i', '<C-b>', '<Esc>:NvimTreeToggle<CR>', opts)

-- Load plugins configuration
require('plugins')
