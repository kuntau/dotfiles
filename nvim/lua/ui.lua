-- ui.lua

local F = vim.fn
local isDay = require('utils').isDay

if isDay() then
  vim.g.ayucolor = 'light'
  vim.opt.background = 'light'
else
  vim.g.ayucolor = 'mirage'
  vim.opt.background = 'dark'
end

if F.has('gui_running') == 0 then -- means running in terminal
  if F.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
  end
  vim.cmd 'colo catppuccin'
else -- running in GUI
  vim.opt.guioptions:remove('t')
  if F.has('win32') or F.has('win64') then
    vim.opt.guifont = 'Consolas:h10'
  end
end

-- Colorscheme
vim.g.ayu_comment_italic=1
vim.g.gruvbox_italic=1
vim.g.gruvbox_contrast_dark='soft'
vim.g.gruvbox_contrast_light='soft'
vim.g.one_allow_italics=1
