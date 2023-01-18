-- ui.lua

local Utils = require('utils')

local auto_switch = true -- should theme switch between day and night
local same_theme = true -- should GUI & TUI have the same theme? GUI use TUI
local background = (Utils.is_day() and auto_switch) and 'light' or 'dark'
local gui_light_theme = 'dayfox'
local gui_dark_theme = 'nightfox'
local tui_light_theme = 'catppuccin-latte'
local tui_dark_theme = 'carbonfox'

vim.o.background = background
local tui_theme = background == 'dark' and tui_dark_theme or tui_light_theme
local gui_theme = same_theme and tui_theme or background == 'dark' and gui_dark_theme or gui_light_theme

-- so many neovim gui doesn't have this option it's headache
if Utils.is_gui() then -- running in GUI
  local OS = Utils.get_os() ---@value 'macos|windows|linxu|wsl'
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
  vim.cmd.colorscheme(gui_theme)
else -- running in terminal
  vim.cmd.colorscheme(tui_theme)
end
