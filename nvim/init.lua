local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- linewrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursorline
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true
opt.iskeyword:append("-")

vim.cmd [[
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    {
        "navarasu/onedark.nvim", -- This is the plugin for the OneDark theme
        config = function()
            require('onedark').setup {
                -- configuration options here
            }
            require('onedark').load()
        end
    },
    {
        "itchyny/lightline.vim", -- This is the plugin for lightline
        config = function()
            -- Any additional configuration for lightline goes here
        end
    },
    {
        "preservim/nerdtree",
        config = function()

        vim.api.nvim_create_autocmd("VimEnter",{
            pattern = "*",
            command = "NERDTree"
        })
        end
    },
    -- init.lua:
    {
    'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }
}

