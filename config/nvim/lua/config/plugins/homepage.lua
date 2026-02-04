-- dashboard configs

local custom_header = {
'    ██████████████████████████  ██████████████████████████',
'    ██                      ██  ██                      ██',
'    ██  ██  ██  ██████████  ██  ██  ██████  ██  ██  ██  ██',
'    ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██  ██  ██  ██████  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██  ██  ██          ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██████  ██████████  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██              ██  ██  ██      ██  ██  ██  ██  ██',
'    ██  ██████  ██████  ██  ██  ██  ██████  ██  ██  ██  ██',
'    ██  ██  ██      ██  ██  ██  ██  ██  ██  ██  ██  ██  ██',
'    ██  ██████████████████  ██  ██  ██████████████  ██  ██',
'    ██                      ██  ██                      ██',
'    ██████████████████████████  ██████████████████████████',
'                                                          ',
}

local picker = function(path)
  if vim.g.is_termux then
    if path ~= nil then
      Snacks.picker.files({ cwd = path })
    else
      Snacks.picker.smart()
    end
  else
    if path ~= nil then
      require('fff').find_files_in_dir(path)
    else
      require('fff').find_files()
    end
  end
end

return {
  {
    'glepnir/dashboard-nvim',
    lazy = false,
    opts = {
      theme = 'hyper',
      shortcut_type = 'letter',
      shuffle_letter = false,
      config = {
        disable_move = false,
        header = custom_header,
        packages = { enable = true },
        week_header = {
          enable = false,
        },
        shortcut = {
          { icon = ' ', key = 'f', group = '@variable', desc = 'Files',   icon_hl = 'Label',           action = function() picker() end },
          { icon = ' ', key = 'g', group = '@variable', desc = 'Neogit',  icon_hl = 'String',          action = 'Neogit'      },
          { icon = ' ', key = 't', group = '@variable', desc = 'Lazygit', icon_hl = 'diff.delta',      action = 'Lazygit'     },
          { icon = ' ', key = 'l', group = '@variable', desc = 'Lazy',    icon_hl = '@property',       action = 'Lazy'        },
          { icon = ' ', key = 'h', group = '@variable', desc = 'Health',  icon_hl = 'Number',          action = 'checkhealth' },
          { icon = '󱌣 ', key = 'm', group = '@variable', desc = 'Mason',   icon_hl = 'DiagnosticInfo',  action = 'Mason'       },
          { icon = '󰩈 ', key = 'q', group = '@variable', desc = 'Exit',    icon_hl = 'DiagnosticError', action = 'quit'        },
        },
        project = {
          limit = 5,
          action = function(path) picker(path) end,
        },
        -- mru = { limit = 10, label = 'MRU' },
        footer = {}, -- footer
      },
    },
  },
}
