-- Load vim-plug plugin manager
vim.cmd [[
call plug#begin('~/.local/share/nvim/plugged')

" Add your plugins here
Plug 'nvim-lua/plenary.nvim'                    " Required by many plugins
Plug 'nvim-tree/nvim-web-devicons'              " Icons
Plug 'nvim-tree/nvim-tree.lua'                  " File explorer
Plug 'nvim-lualine/lualine.nvim'                " Status line
Plug 'nvim-treesitter/nvim-treesitter'          " Better syntax highlighting
Plug 'windwp/nvim-autopairs'                    " Auto pairs for brackets
Plug 'numToStr/Comment.nvim'                    " Easy commenting
Plug 'folke/tokyonight.nvim'                    " Color scheme

call plug#end()
]]

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.signcolumn = 'yes'

-- Set colorscheme
vim.cmd('colorscheme tokyonight-night')

-- Load plugin configurations
require('config.nvim-tree')
require('config.lualine')
require('config.treesitter')
require('config.nvim-autopairs')
require('config.comment')
