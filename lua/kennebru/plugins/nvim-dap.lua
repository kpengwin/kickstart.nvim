return function()
  local dap = require 'dap'
  local dapui = require 'dapui'
  local dap_python = require 'dap-python'

  require('dapui').setup {}
  require('nvim-dap-virtual-text').setup {
    commented = true,
  }

  dap_python.setup 'python3'

  vim.fn.sign_define('DapBreakpoint', {
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = '',
    numhl = '',
  })

  vim.fn.sign_define('DapBreakpointRejected', {
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = '',
    numhl = '',
  })

  vim.fn.sign_define('DapStopped', {
    text = '',
    texthl = 'DiagnosticSignWarn',
    linehl = 'Visual',
    numhl = 'DiagnosticSignWarn',
  })

  dap.listeners.after.event_initialized['dapui_config'] = function()
    dapui.open()
  end

  local opts = { noremap = true, silent = true }

  vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
  vim.keymap.set('n', '<leader>dc', function() dap.continue() end, { desc = 'Continue / Start' })
  vim.keymap.set('n', '<leader>do', function() dap.step_over() end, { desc = 'Step Over' })
  vim.keymap.set('n', '<leader>di', function() dap.step_into() end, { desc = 'Step Into' })
  vim.keymap.set('n', '<leader>dO', function() dap.step_out() end, { desc = 'Step Out' })
  vim.keymap.set('n', '<leader>dq', function() dap.terminate() end, { desc = 'Terminate debug' })
  vim.keymap.set('n', '<leader>du', function() dapui.toggle() end, { desc = 'Toggle DAP UI' })
end
