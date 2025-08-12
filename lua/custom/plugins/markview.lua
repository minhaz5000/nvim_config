-- Markdown preview plugin
return {
  'OXY2DEV/markview.nvim',
  lazy = false,

  -- For `nvim-treesitter` users.
  priority = 49,

  -- For blink.cmp's completion
  -- source
  dependencies = {
    'saghen/blink.cmp',
  },

  config = function()
    -- local map = vim.keymap.set
    -- map('n', '<Leader>lt', require('neogen').generate, { noremap = true, silent = true, desc = '[N]eogen Annotation Generate' })
    -- map('n', '<Leader>nc', function()
    --   require('neogen').generate { type = 'class' }
    -- end, { noremap = true, silent = true, desc = '[C]lass Annotation Generate' })
    -- map('n', '<Leader>nf', function()
    --   require('neogen').generate { type = 'func' }
    -- end, { noremap = true, silent = true, desc = '[F]unction Annotation Generate' })
    -- map('n', '<Leader>nt', function()
    --   require('neogen').generate { type = 'type' }
    -- end, { noremap = true, silent = true, desc = '[T]ype Annotation Generate' })
    -- map('n', '<Leader>nF', function()
    --   require('neogen').generate { type = 'file' }
    -- end, { noremap = true, silent = true, desc = '[F]ile Annotation Generate' })
  end,
}
