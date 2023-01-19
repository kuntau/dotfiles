return {
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

    { key='h', mods="CTRL", action=wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({ SendKey = { key = 'h', mods = 'CTRL' } }, pane)
      else
        win:perform_action({ ActivatePaneDirection = 'Left' }, pane)
      end
    end) },
    { key='l', mods="CTRL", action=wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({ SendKey = { key = 'l', mods = 'CTRL' } }, pane)
      else
        win:perform_action({ ActivatePaneDirection = 'Right' }, pane)
      end
    end) },
    { key='j', mods="CTRL", action=wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({ SendKey = { key = 'j', mods = 'CTRL' } }, pane)
      else
        win:perform_action({ ActivatePaneDirection = 'Down' }, pane)
      end
    end) },
    { key='k', mods="CTRL", action=wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        win:perform_action({ SendKey = { key = 'k', mods = 'CTRL' } }, pane)
      else
        win:perform_action({ ActivatePaneDirection = 'Up' }, pane)
      end
    end) },

    -- { key="h", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Left"} },
    -- { key="l", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Right"} },
    -- { key="k", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Up"} },
    -- { key="j", mods="CTRL", action=wezterm.action{ActivatePaneDirection="Down"} },

    { key="H", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Left", 5}} },
    { key="J", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Down", 5}} },
    { key="K", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Up", 5}} },
    { key="L", mods="LEADER", action=wezterm.action{AdjustPaneSize={"Right", 5}} },
    { key="z", mods="LEADER", action='TogglePaneZoomState' },
    { key="l", mods="LEADER|CTRL", action=wezterm.action{ClearScrollback='ScrollbackAndViewport'} },
  }
