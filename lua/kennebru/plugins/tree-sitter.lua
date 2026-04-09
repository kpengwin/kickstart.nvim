return function()
  -- nvim-treesitter configuration

  -- First check if nvim-treesitter is installed at all
  local ok, _ = pcall(require, 'nvim-treesitter')
  if not ok then
    print("nvim-treesitter not installed yet, skipping configuration")
    return
  end

  -- Check if the configs module exists (newer versions)
  local has_configs = pcall(require, 'nvim-treesitter.configs')

  if has_configs then
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc'
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    }
  else
    -- Fallback for older versions - minimal setup
    require('nvim-treesitter').setup {
      install_dir = vim.fn.stdpath('data') .. '/site',
    }

    local parsers = {
      'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
      'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc'
    }
    require('nvim-treesitter').install(parsers)
  end
end
