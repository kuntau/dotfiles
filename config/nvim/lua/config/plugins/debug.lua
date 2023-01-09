-- Debugging plugins & configs

local config = function()
  local dap, dapui = require('dap'), require('dapui')
  require('dapui').setup()

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
  vim.keymap.set('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle Breakpoint' })
  vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = 'Continue' })
  vim.keymap.set('n', '<leader>do', function() require('dap').step_over() end, { desc = 'Step Over' })
  vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { desc = 'Step Into' })
  vim.keymap.set('n', '<leader>dw', function() require('dap.ui.widgets').hover() end, { desc = 'Widgets' })
  vim.keymap.set('n', '<leader>dr', function() require('dap').repl.open() end, { desc = 'Repl' })
  vim.keymap.set('n', '<leader>du', function() require('dapui').toggle({}) end, { desc = 'Dap UI' })
  vim.keymap.set('n', '<leader>ds', function() require('osv').launch({ port = 8086 }) end, { desc = 'Launch Lua Debugger Server' })
  vim.keymap.set('n', '<leader>dd', function() require('osv').run_this() end, { desc = 'Launch Lua Debugger' })
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
    config = { display = 'NvimNotify' },
  }, -- Run line/block in multiple language TODO: Configure
}
