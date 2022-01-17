local wezterm = require 'wezterm';

local hyper_key = 'SHIFT|ALT|CTRL|CMD'

return {
  -- option = value , [default] comment

  -- default_prog = {'/usr/local/bin/zsh', '~/dotfiles/bin/tm'},

  -- Fonts
  -- font = wezterm.font("Ligalex Mono")                                , -- [IBM Plex Mono]
  -- font = wezterm.font("BlexMono Nerd Font Mono")                     , -- [IBM Plex Mono]
  font = wezterm.font("OperatorMonoLigaturized Nerd Font")           , -- [Operator Mono]
  -- font = wezterm.font("JetBrains Mono")                              , -- [JetBrains Mono]
  -- font = wezterm.font("JetBrains Mono", {weight="Bold",italic=true}) , -- [JetBrains Mono] Name with parameters

  font_size = 13.0                                                        , -- [12.0]
  font_antialias  = 'Subpixel',
  freetype_load_target = 'HorizontalLcd',

  -- Basics
  scrollback_lines = 1000,
  enable_scroll_bar = false,
  term = 'wezterm',

  -- Advanced options
  enbale_kitty_graphics = true,

  -- Colors
  color_scheme      = 'wezterm_tokyonight_storm'    , -- full list @ wezfurlong.org/wezterm/colorschemes/index.html
  colors            = {           -- color_scheme takes precedence over these
    foreground      = 'silver'  , -- [silver] The default text color
    background      = 'black'   , -- [black]  The default background color
    cursor_bg       = '#52ad70' , -- [#52ad70] Overrides the cell background color when the current cell is occupied by the cursor and the cursor style is set to Block
    cursor_fg       = 'black'   , -- [black]   Overrides the text color when the current cell is occupied by the cursor
    cursor_border   = '#52ad70' , -- [#52ad70] Specifies the border color of the cursor when the cursor style is set to Block, of the color of the vertical or horizontal bar when the cursor style is set to Bar or Underline.
    selection_fg    = 'black'   , -- [black]   The foreground color of selected text
    selection_bg    = '#fffacd' , -- [#fffacd] The background color of selected text
    scrollbar_thumb = '#222222' , -- [#222222] The color of the scrollbar "thumb"; the portion that represents the current viewport
    split           = '#444444' , -- [#444444] The color of the split lines between panes
  --   ansi         = {"black", "maroon", "green", "olive", "navy", "purple", "teal", "silver"},
  --   brights      = {"grey", "red", "lime", "yellow", "blue", "fuchsia", "aqua", "white"},
  --   indexed      = {[136]="#af8700"} , -- Arbitrary colors of the palette in the range from 16 to 255
  },

  -- Appearance
  initial_column = 500,
  initial_row = 300,
  line_height = 1.0,
  window_background_opacity     = 1.0   , -- [1.0] alpha channel value with floating point numbers in the range 0.0 (meaning completely translucent/transparent) through to 1.0 (meaning completely opaque)
  enable_tab_bar                = true  , -- [true]
  hide_tab_bar_if_only_one_tab  = true  , -- [false] hide the tab bar when there is only a single tab in the window
  window_padding = {
    left=0,
    right=0,
    top=0,
    bottom=0
  },

  window_decorations = 'RESIZE', -- 'TITLE', 'RESIZE', 'NONE'
  exit_behavior = 'CloseOnCleanExit',
  window_close_confirmation = 'NeverPrompt',
  skip_close_confirmation_for_processes_named = {
    'bash', 'sh', 'zsh', 'fish', 'tmux', 'nu'
  },

  -- define leader key, same as tmux
  leader = { key='s', mods='CTRL', timeout_miliseconds=1000 },
  -- mappings
  keys = {
    { key='t',   mods=hyper_key, action=wezterm.action{SpawnTab='CurrentPaneDomain'} },
    { key='r',   mods=hyper_key, action='ReloadConfiguration' },
    { key='q',   mods=hyper_key, action='QuitApplication' },
    { key='Enter', mods='CMD', action="ToggleFullScreen" },

    -- { key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"} }, -- can be used with tmux
    { key="s", mods="LEADER|CTRL", action={SendKey={ key='s', mods='CTRL' }} }, -- more friendly way to send
    { key='v', mods='LEADER', action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}} },
    { key='s', mods='LEADER', action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}} },
    { key='x', mods='LEADER', action=wezterm.action{CloseCurrentPane={confirm=true}} },
    { key="h", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Left"} },
    { key="l", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Right"} },
    { key="k", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Up"} },
    { key="j", mods="LEADER", action=wezterm.action{ActivatePaneDirection="Down"} },
    { key="H", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Left", 5}} },
    { key="J", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Down", 5}} },
    { key="K", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Up", 5}} },
    { key="L", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Right", 5}} },
  }
}
