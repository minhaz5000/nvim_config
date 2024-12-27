-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  keys = {
    {
      -- autopairs toggle
      '<leader>ap',
      function()
        local autopairs = require 'nvim-autopairs'
        autopairs.toggle()
        if autopairs.state.disabled then
          print 'Autopairs: Disabled'
        else
          print 'Autopairs: Enabled'
        end
      end,
      mode = '',
      desc = 'Autopairs Toggle',
    },
  },
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    require('nvim-autopairs').setup {
      fast_wrap = {
        end_key = '0',
      },
      disable_filetype = { 'TelescopePrompt', 'spectre_panel', 'tex' },
    }
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
  end,
}
