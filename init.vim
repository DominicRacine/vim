set tabstop=4 softtabstop=4
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set expandtab
set shiftwidth=4
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set colorcolumn=80

call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader=" "
xnoremap("<leader>p", "\"_dP")

"movement
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>

inoremap jj <Esc>
