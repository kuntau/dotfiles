-- ui.lua

local utils = require('utils')

local auto_darkmode = false
local diff_gui_theme = true
local gui_theme = 'nightfox'
local tui_theme = 'nightfox'

if utils.isDay() and auto_darkmode then
  vim.o.background = 'light'
else
  vim.o.background = 'dark'
end

-- so many neovim gui doesn't have this option it's headache
if utils.isGui() then -- running in GUI
  local OS = utils.getOS() -- @value 'macos|windows|linxu|wsl'
  if OS == 'windows' then
    vim.o.guifont = 'Consolas:h10'
  elseif OS == 'macos' then
    -- if required we can check for has('gui_vimr')
    vim.o.guifont = 'Liga_Operator_Mono_Book_Nerd_Font_Complete_Mono:h13'
    -- vim.o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'
    vim.o.linespace = 1 -- Linespacing for GUI, not all implement this option
  elseif OS == 'linux'  then
    vim.o.guifont = 'Jetbrains Nerd Font:h13'
  end
  vim.cmd.colorscheme (diff_gui_theme and gui_theme or tui_theme)
else -- running in terminal
  vim.cmd.colorscheme (tui_theme)
end
