return function()
  local api = require 'dropbar.api'
  vim.keymap.set('n', '<leader>p', api.pick, { desc = 'open dropbar [p]icker' })
end
