-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        {
            "maxmx03/solarized.nvim",
            lazy = false,
            priority = 1000,
            opts = {},
            config = function()
                vim.o.background = 'light'
                vim.g.solarized_italics = false
                vim.g.solarized_visibility = "high"
                vim.g.solarized_contrast = "normal"
                vim.cmd.colorscheme("solarized")
            end
        },
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
            config = function()
                require("ibl").setup()
            end
        },
    },
})

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Line numbers
vim.opt.number = true

-- Indentation
vim.opt.smartindent = true -- Indent automatically
vim.opt.expandtab   = true -- Expand tabs to spaces
vim.opt.tabstop     = 4    -- Width of tab character
vim.opt.shiftwidth  = 4    -- Use 4 spaces for indentation
vim.opt.softtabstop = 4    -- TAB key inserts 4 spaces
