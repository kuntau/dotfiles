-- ui.lua

local utils = require('utils')


if utils.isDay() then
  vim.g.ayucolor = 'light'
  vim.opt.background = 'light'
else
  vim.g.ayucolor = 'mirage'
  vim.opt.background = 'dark'
end

-- so many neovim gui doesn't have this option it's headache
if utils.isGui() then -- running in GUI
  local OS = utils.getOS() -- @value 'macos|windows|linxu|wsl'
  if OS == 'windows' then
    vim.opt.guifont = 'Consolas:h10'
  elseif OS == 'macos' then
    -- if required we can check for has('gui_vimr')
    vim.opt.guifont = 'Liga_Operator_Mono_Book_Nerd_Font_Complete_Mono:h13'
    vim.opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'
    vim.opt.linespace = 1 -- Linespacing for GUI, not all implement this option
  elseif OS == 'linux'  then
    vim.opt.guifont = 'Jetbrains Nerd Font:h13'
  end
  vim.cmd 'colo nightfox'
else -- running in terminal
  vim.cmd 'colo nightfox'
end

-- Colorscheme
vim.g.ayu_comment_italic     = 1
vim.g.gruvbox_italic         = 1
vim.g.gruvbox_contrast_dark  = 'soft'
vim.g.gruvbox_contrast_light = 'soft'
vim.g.one_allow_italics      = 1
