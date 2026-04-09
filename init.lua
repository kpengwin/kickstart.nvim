--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html
]]

-- NOTE: must be first so leader is correct
require 'kennebru.remap'

vim.g.have_nerd_font = true

-- See `:help vim.opt`
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a' -- Mouse mode on
vim.opt.showmode = false -- Already have in status line

-- Share clipboard with OS = yes
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Do use case if I use caps
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

vim.opt.termguicolors = true

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Plugin Management with vim.pack ]]
--    See `:help vim.pack` for more info

-- Helper for GitHub URLs
local gh = function(x) return 'https://github.com/' .. x end

-- Set up PackChanged autocmd for build scripts (runs on install/update)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind, path = ev.data.spec.name, ev.data.kind, ev.data.path
    if kind == 'install' or kind == 'update' then
      if name == 'telescope-fzf-native' then
        vim.system({ 'make' }, { cwd = path }):wait()
      end
      if name == 'nvim-web-devicons' then
        vim.system({ 'make' }, { cwd = path }):wait()
      end
      if name == 'luasnip' then
        if vim.fn.executable('make') == 1 then
          vim.system({ 'make', 'install_jsregexp' }, { cwd = path }):wait()
        end
      end
    end
  end,
})

-- Add all plugins with vim.pack
vim.pack.add({
  -- Core utilities
  gh('tpope/vim-sleuth'),

  -- Colorscheme (load first)
  gh('kepano/flexoki-neovim'),

  -- Telescope and deps
  gh('nvim-telescope/telescope.nvim'),
  gh('nvim-lua/plenary.nvim'),
  { src = gh('nvim-telescope/telescope-fzf-native.nvim'), name = 'telescope-fzf-native' },
  gh('nvim-telescope/telescope-ui-select.nvim'),
  gh('nvim-tree/nvim-web-devicons'),

  -- LSP ecosystem
  gh('neovim/nvim-lspconfig'),
  gh('williamboman/mason.nvim'),
  gh('williamboman/mason-lspconfig.nvim'),
  gh('WhoIsSethDaniel/mason-tool-installer.nvim'),
  gh('hrsh7th/cmp-nvim-lsp'),
  gh('hrsh7th/nvim-cmp'),
  { src = gh('L3MON4D3/LuaSnip'), name = 'luasnip' },
  gh('saadparwaiz1/cmp_luasnip'),
  gh('hrsh7th/cmp-path'),

  -- Treesitter
  gh('nvim-treesitter/nvim-treesitter'),

  -- Git
  gh('lewis6991/gitsigns.nvim'),

  -- UI
  gh('folke/which-key.nvim'),
  gh('nvim-neo-tree/neo-tree.nvim'),
  gh('MunifTanjim/nui.nvim'),
  gh('folke/todo-comments.nvim'),

  -- Formatting
  gh('stevearc/conform.nvim'),

  -- Mini suite
  gh('echasnovski/mini.nvim'),

  -- Autopairs
  gh('windwp/nvim-autopairs'),

  -- LSP extras
  gh('ray-x/lsp_signature.nvim'),
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',

  -- Debugging
  gh('mfussenegger/nvim-dap'),
  gh('nvim-neotest/nvim-nio'),
  gh('rcarriga/nvim-dap-ui'),
  gh('mfussenegger/nvim-dap-python'),
  gh('theHamsta/nvim-dap-virtual-text'),

  -- Other utilities
  gh('chentoast/marks.nvim'),
  gh('MeanderingProgrammer/render-markdown.nvim'),
  gh('christoomey/vim-tmux-navigator'),
  gh('Bekaboo/dropbar.nvim'),
})

-- Configure all plugins
require('kennebru.plugins.colorscheme')()
require('kennebru.plugins.which-key')()
require('kennebru.plugins.telescope')()
require('kennebru.plugins.lsp')()
require('kennebru.plugins.gitsigns')()
require('kennebru.plugins.todo-comments')()
require('kennebru.plugins.mini')()
require('kennebru.plugins.tree-sitter')()
require('kennebru.plugins.autopairs')()
require('kennebru.plugins.neo-tree')()
require('kennebru.plugins.marks')()
require('kennebru.plugins.markdown')()
require('kennebru.plugins.vim-tmux-navigator')()
require('kennebru.plugins.dropbar')()
require('kennebru.plugins.nvim-dap')()

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
