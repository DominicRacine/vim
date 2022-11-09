-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

-- stylua: ignore start
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'                                                         -- Package manager

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable "make" == 1 }

  if is_bootstrap then
    require('packer').sync()
  end
end)
-- stylua: ignore end

--options
vim.o.tabstop=4
vim.o.softtabstop=4
vim.o.exrc=true
vim.o.relativenumber=true
vim.o.nu=true
vim.o.hlsearch=false
vim.o.hidden=true
vim.o.expandtab=true
vim.o.shiftwidth=4
vim.o.wrap=false
vim.o.smartcase=true
vim.o.swapfile=false
vim.o.backup=false
vim.o.undofile=true
vim.o.incsearch=true
vim.o.scrolloff=8
vim.o.colorcolumn=80

--[[
call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none
]]

vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("i", "<c-h>", "<Left>")
vim.keymap.set("i", "<c-l>", "<Right>")
vim.keymap.set("i", "<c-k>", "<Up>")
vim.keymap.set("i", "<c-j>", "<Down>")

-- Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set("<leader>p", "\"_dP")
