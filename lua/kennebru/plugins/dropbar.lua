return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
  },
  keys = function(_, keys)
    local api = require 'dropbar.api'
    return {
      { '<leader>p', api.pick, desc = 'open dropbar [p]icker' },
      unpack(keys),
    }
  end,
}
