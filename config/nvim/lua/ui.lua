-- ui.lua

local utils = require('utils')

if utils.isDay() then
  vim.g.ayucolor = 'light'
  vim.opt.background = 'light'
else
  vim.g.ayucolor = 'mirage'
  vim.opt.background = 'dark'
end

if vim.fn.has('gui_running') == 1 then -- running in GUI
  -- @value 'macos|windows|linxu|wsl'
  local OS = utils.getOS()
  if OS == 'windows' then
    vim.opt.guifont = 'Consolas:h10'
  elseif OS == 'macos' then
    -- if required we can check for has('gui_vimr')
    vim.opt.guifont = 'OperatorMonoLigaturized Nerd Font:h13'
  elseif OS == 'linux'  then
    vim.opt.guifont = 'Jetbrains Nerd Font:h13'
  end
  vim.cmd 'colo catppuccin'
else -- running in terminal
  vim.cmd 'colo nightfox'
end

-- Colorscheme
vim.g.ayu_comment_italic     = 1
vim.g.gruvbox_italic         = 1
vim.g.gruvbox_contrast_dark  = 'soft'
vim.g.gruvbox_contrast_light = 'soft'
vim.g.one_allow_italics      = 1
