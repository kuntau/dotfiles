-- ui.lua

local Utils = require('utils')

local auto_switch = true -- should theme switch between day and night
local same_theme = true -- should GUI & TUI have the same theme? GUI use TUI
local background = (Utils.is_day() and auto_switch) and 'light' or 'dark'
local gui_light_theme = 'dayfox'
local gui_dark_theme = 'nightfox'
local tui_light_theme = 'PaperColor'
local tui_dark_theme = 'nordic'

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
    -- vim.o.guifont = 'LigaOperatorMono Nerd Font Mono,OperatorMonoLigaturized Nerd Font:h13'
    -- vim.o.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'
    vim.o.linespace = 1 -- Linespacing for GUI, not all implement this option
    if vim.g.neovide then -- https://neovide.dev/configuration.html
      vim.o.guifont = 'Operator Mono,LigaOperatorMono Nerd Font Mono:h13'
      -- vim.o.guifont = 'Liga Operator Mono Book Nerd Font Complete Mono:h13'
      vim.g.neovide_scale_factor = 1.0
      vim.g.neovide_transparency = 1
      vim.g.transparency = 1
      vim.g.neovide_hide_mouse_when_typing = true
      vim.g.neovide_refresh_rate = 60
      vim.g.neovide_fullscreen = true
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_input_use_logo = true -- true on macOS
      vim.g.neovide_input_macos_alt_is_meta = true
      vim.g.neovide_cursor_antialiasing = true
      vim.cmd.colorscheme('oxocarbon')
    end
  elseif OS == 'linux' then
    vim.o.guifont = 'Jetbrains Nerd Font:h13'
  end
  vim.cmd.colorscheme(gui_theme)
else -- running in terminal
  vim.cmd.colorscheme(tui_theme)
end
