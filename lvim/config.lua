-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.reload_config_on_save = true

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "theprimeagen/vim-be-good" },
}

lvim.colorscheme = 'onedark'
lvim.format_on_save = true
vim.wo.relativenumber = true
