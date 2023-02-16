local wezterm = require('wezterm')
local action = wezterm.action
local on = wezterm.on
local emit = action.EmitEvent

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

on('ActivatePaneDirectionRight', function(win, pane) switch_pane(win, pane, 'l') end)
on('ActivatePaneDirectionLeft',  function(win, pane) switch_pane(win, pane, 'h') end)
on('ActivatePaneDirectionUp',    function(win, pane) switch_pane(win, pane, 'k') end)
on('ActivatePaneDirectionDown',  function(win, pane) switch_pane(win, pane, 'j') end)

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
  freetype_load_target = 'Light',
  freetype_render_target = 'HorizontalLcd',

  -- Basics
  scrollback_lines = 1000,
  enable_scroll_bar = false,
  term = 'wezterm',

  -- Advanced options
  enable_kitty_graphics = true,
  enable_kitty_keyboard = true,
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  -- GPU
  front_end = 'WebGpu', -- WebGpu make font thicker
  animation_fps = 1,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',

  -- Colors
  color_scheme = 'nordic', -- full list @ wezfurlong.org/wezterm/colorschemes/index.html

  -- Appearance
  initial_cols = 500,
  initial_rows = 300,
  line_height = 1.0,
  enable_tab_bar = true, -- [true]
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true, -- [false] hide the tab bar when there is only a single tab in the window
  window_background_opacity = 1.0, -- [1.0] alpha channel value with floating point numbers in the range 0.0 (meaning completely translucent/transparent) through to 1.0 (meaning completely opaque)
  window_decorations = 'RESIZE', -- 'TITLE', 'RESIZE', 'NONE'
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  foreground_text_hsb = {
    hue = 1.0,
    saturation = 1.0,
    brightness = 1.0,
  },
  inactive_pane_hsb = {
    saturation = 1.0,
    brightness = 0.85,
  },

  -- Behavior
  automatically_reload_config = true,
  clean_exit_codes = { 130 },
  exit_behavior = 'CloseOnCleanExit',
  window_close_confirmation = 'NeverPrompt',
  unzoom_on_switch_pane = false,
  skip_close_confirmation_for_processes_named = { 'bash', 'sh', 'zsh', 'fish', 'tmux', 'nu' },

  -- define leader key, same as tmux
  leader = { key = 's', mods = 'CTRL', timeout_milliseconds = 1000 },
  -- mappings
  keys = {
    { key = 't', mods = hyper_key, action = action({ SpawnTab = 'CurrentPaneDomain' }) },
    { key = 'q', mods = hyper_key, action = 'QuitApplication' },
    { key = 'R', mods = 'LEADER', action = 'ReloadConfiguration' },
    { key = 'Enter', mods = 'CMD', action = 'ToggleFullScreen' },

    -- { key = 'a', mods = 'LEADER|CTRL', action = action { SendString = '\x01' } }, -- can be used with tmux
    { key = 's', mods = 'LEADER|CTRL', action = { SendKey = { key = 's', mods = 'CTRL' } } }, -- more friendly way to send
    { key = 'v', mods = 'LEADER', action = action({ SplitHorizontal = { domain = 'CurrentPaneDomain' } }) },
    { key = 's', mods = 'LEADER', action = action({ SplitVertical = { domain = 'CurrentPaneDomain' } }) },
    { key = 'x', mods = 'LEADER', action = action({ CloseCurrentPane = { confirm = true } }) },

    { key = 'h', mods = 'LEADER', action = action({ ActivatePaneDirection = 'Left' }) },
    { key = 'l', mods = 'LEADER', action = action({ ActivatePaneDirection = 'Right' }) },
    { key = 'k', mods = 'LEADER', action = action({ ActivatePaneDirection = 'Up' }) },
    { key = 'j', mods = 'LEADER', action = action({ ActivatePaneDirection = 'Down' }) },

    { key = 'l', mods = 'CTRL', action = emit('ActivatePaneDirectionRight') },
    { key = 'h', mods = 'CTRL', action = emit('ActivatePaneDirectionLeft') },
    { key = 'k', mods = 'CTRL', action = emit('ActivatePaneDirectionUp') },
    { key = 'j', mods = 'CTRL', action = emit('ActivatePaneDirectionDown') },

    { key = 'H', mods = 'LEADER', action = action({ AdjustPaneSize = { 'Left', 5 } }) },
    { key = 'J', mods = 'LEADER', action = action({ AdjustPaneSize = { 'Down', 5 } }) },
    { key = 'K', mods = 'LEADER', action = action({ AdjustPaneSize = { 'Up', 5 } }) },
    { key = 'L', mods = 'LEADER', action = action({ AdjustPaneSize = { 'Right', 5 } }) },
    { key = 'z', mods = 'LEADER', action = 'TogglePaneZoomState' },
    { key = 'l', mods = 'LEADER|CTRL', action = action({ ClearScrollback = 'ScrollbackAndViewport' }) },

    -- CTRL-SHIFT-l activates the debug overlay
    { key = 'L', mods = 'CTRL', action = action.ShowDebugOverlay },
  },

  hyperlink_rules = {
    -- Handle URLs wrapped with punctuation e.g. 'http://foo' (http://foo) <http://foo> etc
    -- the punctuation will be underlined but excluded when clicked
    {
      regex = '[[:punct:]](\\w+://\\S+)[[:punct:]]',
      format = '$1',
    },

    -- Linkify things that look like URLs and include terminating ), / or - characters, if any
    {
      regex = [[\b\w+://\S+[)/a-zA-Z0-9-]+]],
      format = '$0',
    },

    -- Make username/project paths clickable. This implies paths like the following are for GitHub.
    -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
    -- As long as a full URL hyperlink regex exists above this it should not match a full URL to
    -- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
    {
      regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
      format = 'https://www.github.com/$1/$3',
    },
  },

  mouse_bindings = {
    -- Bind 'Up' event of CMD-Click to open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CMD',
      action = action.OpenLinkAtMouseCursor,
    },
    -- Disable the 'Down' event of CMD-Click to avoid weird program behaviors
    {
      event = { Down = { streak = 1, button = 'Left' } },
      mods = 'CMD',
      action = action.Nop,
    },
  },
}
