return function()
  vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { desc = 'Tmux left' })
  vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', { desc = 'Tmux down' })
  vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', { desc = 'Tmux up' })
  vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { desc = 'Tmux right' })
  vim.keymap.set('n', '<c-\\>', '<cmd>TmuxNavigatePrevious<cr>', { desc = 'Tmux prev' })
end
