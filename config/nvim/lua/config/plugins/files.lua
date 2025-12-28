-- files plugins

local opts_fff = {
  prompt = ' ',
  title = 'Fast Fuzzy Finder',
  layout = {
    prompt_position = 'top',
  }
}

local opts_oil = {
  delete_to_trash = true,
  skip_confirm_for_simple_edit = true,
}


return {
  { 
    'dmtrKovalenko/fff.nvim',
    build = function() require('fff.download').download_or_build_binary() end,
    keys = { { '<C-p>', function() require('fff').find_files() end, desc = 'Open file picker', }, },
    lazy = true,
    opts = opts_fff,
  },
  {
    'stevearc/oil.nvim',
    event = 'VeryLazy',
    opts = opts_oil,
  }
}
