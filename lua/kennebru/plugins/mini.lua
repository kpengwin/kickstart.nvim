return function()
  -- Better Around/Inside textobjects
  require('mini.ai').setup { n_lines = 500 }

  -- Add/delete/replace surroundings
  require('mini.surround').setup()

  -- Statusline
  local statusline = require 'mini.statusline'
  statusline.setup { use_icons = vim.g.have_nerd_font }
  statusline.section_location = function()
    return '%2l:%-2v'
  end
end
