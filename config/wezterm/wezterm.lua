local wezterm = require('wezterm')
local Utils = require('utils')
local action = wezterm.action
local on = wezterm.on
local emit = action.EmitEvent

local hyper_key = 'SHIFT|ALT|CTRL|CMD'

local COLORS = {
	rosewater = "#F4DBD6",
	flamingo = "#F0C6C6",
	pink = "#F5BDE6",
	mauve = "#C6A0F6",
	red = "#ED8796",
	maroon = "#EE99A0",
	peach = "#F5A97F",
	yellow = "#EED49F",
	green = "#A6DA95",
	teal = "#8BD5CA",
	sky = "#91D7E3",
	sapphire = "#7DC4E4",
	blue = "#8AADF4",
	lavender = "#B7BDF8",

	text = "#CAD3F5",
	subtext1 = "#B8C0E0",
	subtext0 = "#A5ADCB",
	overlay2 = "#939AB7",
	overlay1 = "#8087A2",
	overlay0 = "#6E738D",
	surface2 = "#5B6078",
	surface1 = "#494D64",
	surface0 = "#363A4F",

	base = "#24273A",
	mantle = "#1E2030",
	crust = "#181926",
}

local basename = function(s) return string.gsub(s, '(.*[/\\])(.*)', '%2') end

local get_process = function(pane)
  local proc = basename(pane:get_foreground_process_name())
  wezterm.log_info('@foreground_process, proc=' .. proc)
  return proc
end

local is_tmux = function(proc)
  return proc == 'tmux'
end

local is_vim = function(proc)
  return string.match(proc, 'n?vim') or proc == 'hx'
end

local switch_pane = function(win, pane, key)
  local direction = { h = 'Left', l = 'Right', j = 'Down', k = 'Up' }
  local proc = get_process(pane)

  if is_vim(proc) or is_tmux(proc) then
    win:perform_action({ SendKey = { key = key, mods = 'CTRL' } }, pane)
  else
    win:perform_action({ ActivatePaneDirection = direction[key] }, pane)
  end
end

local function get_tab_process(tab)
  local process_icons = {
    nvim = {
      { Foreground = { Color = COLORS.green } },
      { Text = wezterm.nerdfonts.custom_vim },
    },
    vim = {
      { Foreground = { Color = COLORS.green } },
      { Text = wezterm.nerdfonts.dev_vim },
    },
    node = {
      { Foreground = { Color = COLORS.green } },
      { Text = wezterm.nerdfonts.mdi_hexagon },
    },
    zsh = {
      { Foreground = { Color = COLORS.peach } },
      { Text = wezterm.nerdfonts.dev_terminal },
    },
    bash = {
      { Foreground = { Color = COLORS.subtext0 } },
      { Text = wezterm.nerdfonts.cod_terminal_bash },
    },
    htop = {
      { Foreground = { Color = COLORS.yellow } },
      { Text = wezterm.nerdfonts.mdi_chart_donut_variant },
    },
    cargo = {
      { Foreground = { Color = COLORS.peach } },
      { Text = wezterm.nerdfonts.dev_rust },
    },
    go = {
      { Foreground = { Color = COLORS.sapphire } },
      { Text = wezterm.nerdfonts.mdi_language_go },
    },
    lazydocker = {
      { Foreground = { Color = COLORS.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    git = {
      { Foreground = { Color = COLORS.peach } },
      { Text = wezterm.nerdfonts.dev_git },
    },
    gitui = {
      { Foreground = { Color = COLORS.peach } },
      { Text = wezterm.nerdfonts.dev_git },
    },
    lua = {
      { Foreground = { Color = COLORS.blue } },
      { Text = wezterm.nerdfonts.seti_lua },
    },
    wget = {
      { Foreground = { Color = COLORS.yellow } },
      { Text = wezterm.nerdfonts.mdi_arrow_down_box },
    },
    curl = {
      { Foreground = { Color = COLORS.yellow } },
      { Text = wezterm.nerdfonts.mdi_flattr },
    },
    gh = {
      { Foreground = { Color = COLORS.mauve } },
      { Text = wezterm.nerdfonts.dev_github_badge },
    },
    docker = {
      { Foreground = { Color = COLORS.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
    ["docker-compose"] = {
      { Foreground = { Color = COLORS.blue } },
      { Text = wezterm.nerdfonts.linux_docker },
    },
  }

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

  if process_name == "" then
    process_name = "zsh"
  end

  return wezterm.format(
    process_icons[process_name]
    or { { Foreground = { Color = COLORS.sky } }, { Text = string.format("[%s]", process_name) } }
  )
end

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir
  local HOME_DIR = string.format('file://%s', os.getenv('HOME'))

  return current_dir == HOME_DIR and '  ~'
    or string.format('  %s', string.gsub(current_dir, '(.*[/\\])(.*)', '%2'))
end

wezterm.on('format-tab-title', function(tab)
    return wezterm.format({
      { Attribute = { Intensity = 'Bold' } },
      { Text = string.format(' %s  ', tab.tab_index + 1) },
      'ResetAttributes',
      { Text = get_tab_process(tab) },
      { Text = ' ' },
      { Text = get_current_working_dir(tab) },
      { Foreground = { Color = COLORS.base } },
      { Text = '  ▕' },
    })
  end
)

wezterm.on('update-status', function(window)
    window:set_right_status(wezterm.format({
      { Attribute = { Intensity = 'Normal' } },
      { Text = wezterm.strftime(' %A, %d %B %Y %I:%M %p ') },
    }))
  end
)

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
  front_end = 'WebGpu', -- Software|OpenGL|WebGpu make font thicker
  animation_fps = 1,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',

  -- Colors
  color_scheme = 'nordic', -- full list @ https://wezfurlong.org/wezterm/colorschemes/index.html
  colors = {
		split = COLORS.surface0,
		foreground = COLORS.text,
		background = COLORS.base,
		cursor_bg = COLORS.rosewater,
		cursor_border = COLORS.rosewater,
		cursor_fg = COLORS.base,
		selection_bg = COLORS.surface2,
		selection_fg = COLORS.text,
		visual_bell = COLORS.surface0,
		indexed = {
			[16] = COLORS.peach,
			[17] = COLORS.rosewater,
		},
		scrollbar_thumb = COLORS.surface2,
		compose_cursor = COLORS.flamingo,
		ansi = {
			COLORS.surface1,
			COLORS.red,
			COLORS.green,
			COLORS.yellow,
			COLORS.blue,
			COLORS.pink,
			COLORS.teal,
			COLORS.subtext0,
		},
		brights = {
			COLORS.subtext0,
			COLORS.red,
			COLORS.green,
			COLORS.yellow,
			COLORS.blue,
			COLORS.pink,
			COLORS.teal,
			COLORS.surface1,
		},
		tab_bar = {
			background = COLORS.crust,
			active_tab = {
				bg_color = "none",
				fg_color = COLORS.subtext1,
				intensity = "Bold",
				underline = "None",
				italic = false,
				strikethrough = false,
			},
			inactive_tab = {
				bg_color = COLORS.crust,
				fg_color = COLORS.surface2,
			},
			inactive_tab_hover = {
				bg_color = COLORS.mantle,
				fg_color = COLORS.subtext0,
			},
			new_tab = {
				bg_color = COLORS.crust,
				fg_color = COLORS.subtext0,
			},
			new_tab_hover = {
				bg_color = COLORS.crust,
				fg_color = COLORS.subtext0,
			},
		},
  },

  -- Appearance
  initial_cols = 500,
  initial_rows = 300,
  line_height = 1.0,
  enable_tab_bar = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  tab_max_width = 50,
  window_background_opacity = 1.0,
  window_decorations = 'RESIZE', -- 'TITLE', 'RESIZE', 'NONE'
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
  inactive_pane_hsb = { saturation = 1.0, brightness = 0.85 },

  -- Behavior
  automatically_reload_config = false,
  clean_exit_codes = { 130 },
  exit_behavior = 'CloseOnCleanExit',
  pane_focus_follows_mouse = true,
  skip_close_confirmation_for_processes_named = { 'bash', 'sh', 'zsh', 'fish', 'tmux', 'nu' },
  unzoom_on_switch_pane = false,
  window_close_confirmation = 'NeverPrompt',

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
    -- Right click to paste
    {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = action.PasteFrom('Clipboard'),
    },

    -- Change the default click behavior so that it only selects text and doesn't open hyperlinks
    {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'NONE',
      action = action.CompleteSelection('ClipboardAndPrimarySelection'),
    },
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
