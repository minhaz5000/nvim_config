return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Format the buffer and print confirmation
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
        print 'Buffer Formatted'
      end,
      mode = '',
      desc = 'Format buffer',
    },
    {
      -- Toggle autoformat on save
      '<leader>ae',
      function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        print('Autoformat on Save:', vim.g.disable_autoformat and 'Disabled' or 'Enabled')
      end,
      mode = '',
      desc = 'Toggle autoformat-on-save',
    },
    {
      -- Toggle clang-format style (global template vs default)
      '<leader>ac',
      function()
        vim.g.use_clang_custom_style = not vim.g.use_clang_custom_style
        print('clang-format style:', vim.g.use_clang_custom_style and 'Using Global Template' or 'Disabled')
      end,
      mode = '',
      desc = 'Toggle clang-format style',
    },
  },

  opts = {
    notify_on_error = false,
    notify_no_formatters = true,
    formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      python = { 'isort', 'black' },
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      -- cmake = { 'cmakelang' },
    },
    formatters = {
      clang_format = {
        prepend_args = function()
          if vim.g.use_clang_custom_style then
            return { '--style=file:/home/minhaz/Templates/cpp/.clang-format' }
          else
            return {} -- No args when the toggle is off
          end
        end,
      },
    },
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes
      -- local ignore_filetypes = { 'sql', 'java', 'c', 'cpp' }
      -- if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      --   return
      -- end
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match '/node_modules/' then
        return
      end

      -- Run the formatting if enabled
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
  },

  init = function()
    -- Initialize clang-format toggle globally at the start
    vim.g.use_clang_custom_style = true -- Set global style as default

    -- Disable autoformat on save by default
    vim.g.disable_autoformat = true

    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
