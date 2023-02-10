local wezterm = require('wezterm')

local hyper_key = 'SHIFT|ALT|CTRL|CMD'

local basename = function(s) return string.gsub(s, '(.*[/\\])(.*)', '%2') end

local is_vim = function(pane)
  local proc = basename(pane:get_foreground_process_name())
  wezterm.log_info('@is_vim, proc=' .. proc)
  return string.match(proc, 'n?vim') or proc == 'hx'
  -- return string.match(proc, 'nvim')
end

local switch_pane = function(win, pane, key)
  local direction = { h = 'Left', l = 'Right', j = 'Down', k = 'Up' }
  if is_vim(pane) then
    win:perform_action({ SendKey = { key = key, mods = 'CTRL' } }, pane)
  else
    win:perform_action({ ActivatePaneDirection = direction[key] }, pane)
  end
end

wezterm.on('ActivatePaneDirectionRight', function(win, pane) switch_pane(win, pane, 'l') end)
wezterm.on('ActivatePaneDirectionLeft', function(win, pane) switch_pane(win, pane, 'h') end)
wezterm.on('ActivatePaneDirectionUp', function(win, pane) switch_pane(win, pane, 'k') end)
wezterm.on('ActivatePaneDirectionDown', function(win, pane) switch_pane(win, pane, 'j') end)

return {
  default_prog = { '/usr/local/bin/zsh', '-li' },

  font = wezterm.font_with_fallback({
    {
      family = 'LigaOperatorMono Nerd Font Mono',
      weight = 'Book',
    },
    'BlexMono Nerd Font Mono',
  }),

  font_size = 13.0,
  -- font_antialias  = 'Subpixel',
  freetype_load_target = 'HorizontalLcd',

  -- Basics
  scrollback_lines = 1000,
  enable_scroll_bar = false,
  term = 'wezterm',

  -- Advanced options
  enable_kitty_graphics = true,
  enable_kitty_keyboard = true,
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  -- Colors
  color_scheme = 'nordic', -- full list @ wezfurlong.org/wezterm/colorschemes/index.html

  -- Appearance
  initial_cols = 500,
  initial_rows = 300,
  line_height = 1.0,
  window_background_opacity = 1.0, -- [1.0] alpha channel value with floating point numbers in the range 0.0 (meaning completely translucent/transparent) through to 1.0 (meaning completely opaque)
  enable_tab_bar = true, -- [true]
  hide_tab_bar_if_only_one_tab = true, -- [false] hide the tab bar when there is only a single tab in the window
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },

  window_decorations = 'RESIZE', -- 'TITLE', 'RESIZE', 'NONE'
  exit_behavior = 'CloseOnCleanExit',
  window_close_confirmation = 'NeverPrompt',
  unzoom_on_switch_pane = false,
  use_fancy_tab_bar = false,
  skip_close_confirmation_for_processes_named = { 'bash', 'sh', 'zsh', 'fish', 'tmux', 'nu' },

  -- define leader key, same as tmux
  leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 },
  -- mappings
  keys = {
    { key = 't', mods = hyper_key, action = wezterm.action({ SpawnTab = 'CurrentPaneDomain' }) },
    { key = 'r', mods = hyper_key, action = 'ReloadConfiguration' },
    { key = 'q', mods = hyper_key, action = 'QuitApplication' },
    { key = 'Enter', mods = 'CMD', action = 'ToggleFullScreen' },
    { key = 'Enter', mods = 'ALT', action = 'ToggleFullScreen' },

    -- { key="a", mods="LEADER|CTRL", action=wezterm.action{SendString="\x01"} }, -- can be used with tmux
    -- { key="s", mods="LEADER|CTRL", action={SendKey={ key='s', mods='CTRL' }} }, -- more friendly way to send
    { key = 'v', mods = 'LEADER', action = wezterm.action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
    { key = 's', mods = 'LEADER', action = wezterm.action({ SplitVertical = { domain = 'CurrentPaneDomain' } }) },
    { key = 'x', mods = 'LEADER', action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },

    { key = 'h', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Left' }) },
    { key = 'l', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Right' }) },
    { key = 'k', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Up' }) },
    { key = 'j', mods = 'LEADER', action = wezterm.action({ ActivatePaneDirection = 'Down' }) },

    { key = 'l', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirectionRight') },
    { key = 'h', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirectionLeft') },
    { key = 'k', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirectionUp') },
    { key = 'j', mods = 'CTRL', action = wezterm.action.EmitEvent('ActivatePaneDirectionDown') },

    { key = 'H', mods = 'LEADER', action = wezterm.action({ AdjustPaneSize = { 'Left', 5 } }) },
    { key = 'J', mods = 'LEADER', action = wezterm.action({ AdjustPaneSize = { 'Down', 5 } }) },
    { key = 'K', mods = 'LEADER', action = wezterm.action({ AdjustPaneSize = { 'Up', 5 } }) },
    { key = 'L', mods = 'LEADER', action = wezterm.action({ AdjustPaneSize = { 'Right', 5 } }) },
    { key = 'z', mods = 'LEADER', action = 'TogglePaneZoomState' },
    { key = 'l', mods = 'LEADER|CTRL', action = wezterm.action({ ClearScrollback = 'ScrollbackAndViewport' }) },

    -- CTRL-SHIFT-l activates the debug overlay
    { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
  },
}
