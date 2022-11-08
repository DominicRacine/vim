local fn = vim.fn
DATA_PATH = fn.stdpath 'data'
local install_path = DATA_PATH .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.api.nvim_exec([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source init.lua | PackerCompile
  augroup end
  ]],
  false
)

return require('packer').startup(function(use)

use 'wbthomason/packer.nvim'    -- Package manager
use 'nvim-lua/plenary.nvim'     -- Lua Plugin Testing Library
use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
}


if packer_bootstrap then
    require('packer').sync()
  end
end)

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
vim.keymap.set("i", "<c-j>", "<Down>"

-- Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' ')

vim.keymap.set("<leader>p", "\"_dP")
