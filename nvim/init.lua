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

-- syntax
opt.syntax = 'on'

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

-- Lazy Setup

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
    {
    'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'nvim-treesitter/nvim-treesitter'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'neovim/nvim-lspconfig'},
}


-- Treesitter configuration
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    ensure_installed = "c", -- Only install C tree-sitter parser
}

-- LSP and Completion
local lspconfig = require'lspconfig'
local cmp = require'cmp'

-- nvim-cmp setup
cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body)
      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'buffer' },
    { name = 'path' }
  })
})

-- Clangd setup for C
lspconfig.clangd.setup{
    on_attach = function(_, bufnr)
        -- [Key mapping and additional setup]
    end,
}

