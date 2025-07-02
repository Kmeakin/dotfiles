-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Automatically create directories if not present
MiniDeps.add("mateuszwieloch/automkdir.nvim")

-- Line numbers
vim.opt.number = true

-- Indentation
vim.opt.smartindent = true -- Indent after certain characters
vim.opt.autoindent  = true -- Use indent from previous line on new lines
vim.opt.expandtab   = true -- Expand tabs to spaces
vim.opt.tabstop     = 4    -- Width of tab character
vim.opt.shiftwidth  = 4    -- Use 4 spaces for indentation
vim.opt.softtabstop = 4    -- TAB key inserts 4 spaces

MiniDeps.add("lukas-reineke/indent-blankline.nvim")
require("ibl").setup()

-- Whitespace
vim.opt.list = true
vim.o.listchars = 'tab:⇥ ,multispace:•,trail:•'

-- Search
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase  = true -- Unless search contains uppercase

-- Theme
-- MiniDeps.add("scottmckendry/cyberdream.nvim")
-- MiniDeps.add("craftzdog/solarized-osaka.nvim")
-- MiniDeps.add("ellisonleao/gruvbox.nvim")
-- MiniDeps.add("sainnhe/sonokai")
MiniDeps.add("maxmx03/solarized.nvim")
vim.cmd("colorscheme solarized")
