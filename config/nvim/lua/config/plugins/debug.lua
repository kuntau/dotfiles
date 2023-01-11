-- Debugging plugins & configs

local config = function()
  local dap, dapui = require('dap'), require('dapui')

  dapui.setup()
  dap.configurations.lua = {
    {
      type = 'nlua',
      request = 'attach',
      name = 'Attach to running Neovim instance',
    },
  }

  dap.adapters.nlua = function(callback, config)
    callback({ type = 'server', host = config.host or '127.0.0.1', port = config.port or 8086 })
  end

  dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open({}) end
  dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close({}) end
  dap.listeners.before.event_exited['dapui_config'] = function() dapui.close({}) end
end

local init = function()
  vim.keymap.set('n', '<leader>ddb', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
  vim.keymap.set('n', '<leader>ddc', function() require('dap').continue() end, { desc = 'Continue' })
  vim.keymap.set('n', '<leader>ddo', function() require('dap').step_over() end, { desc = 'Step Over' })
  vim.keymap.set('n', '<leader>ddi', function() require('dap').step_into() end, { desc = 'Step Into' })
  vim.keymap.set('n', '<leader>ddw', function() require('dap.ui.widgets').hover() end, { desc = 'Widgets' })
  vim.keymap.set('n', '<leader>ddr', function() require('dap').repl.open() end, { desc = 'Repl' })
  vim.keymap.set('n', '<leader>ddu', function() require('dapui').toggle({}) end, { desc = 'Dap UI' })
  vim.keymap.set('n', '<leader>dds', function() require('osv').launch({ port = 8086 }) end, { desc = 'Launch Lua Debugger Server' })
  vim.keymap.set('n', '<leader>ddd', function() require('osv').run_this() end, { desc = 'Launch Lua Debugger' })
end

return {
  {
    'rcarriga/nvim-dap-ui',
    init = init,
    config = config,
    dependencies = {
      { 'mfussenegger/nvim-dap' },
      { 'jbyuki/one-small-step-for-vimkind', ft = 'lua' },
    },
  },
  {
    'michaelb/sniprun',
    build = 'bash ./install.sh',
    cmd = { 'SnipRun', 'SnipInfo' },
    opts = { display = 'NvimNotify' },
  }, -- Run line/block in multiple language TODO: Configure
}
