-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        local conform = require 'conform'
        local ok, err = pcall(conform.format, { async = true })
        vim.notify(ok and '✅ Buffer Formatted' or '❌ Formatting failed: ' .. err, ok and vim.log.levels.INFO or vim.log.levels.ERROR, { timeout = 1000 })
      end,
      desc = '[F]ormat buffer',
    },
    {
      '<leader>ta',
      function()
        local buf = vim.api.nvim_get_current_buf()
        local new_state = not vim.b[buf].disable_autoformat
        vim.b[buf].disable_autoformat = new_state
        vim.notify('Autoformat on Save ' .. (new_state and '🔴 Disabled' or '🟢 Enabled'), vim.log.levels.INFO, { timeout = 500 })
      end,
      desc = '[T]oggle [A]utoformat on Save',
    },
  },
  opts = {
    -- Configure formatters by filetype
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_organize_imports', 'ruff_format' },
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      markdown = { 'mdsf', 'mdformat' },
      sh = { 'shfmt' },
      yaml = { 'yamlfmt' },
      tex = { 'latexindent' },
    },

    -- Control format on save per buffer
    format_on_save = function(bufnr)
      local buf_disable = vim.b[bufnr] and vim.b[bufnr].disable_autoformat
      if buf_disable then
        return nil
      end
      local name = vim.api.nvim_buf_get_name(bufnr)
      if name:find('/node_modules/', 1, true) then
        return nil
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,

    -- Additional formatter-specific args
    formatters = {
      shfmt = {
        prepend_args = { '-x', '-i', '2', '-ci' },
      },
      clang_format = {
        prepend_args = function()
          local buf = vim.api.nvim_get_current_buf()
          local use_custom = vim.b[buf] and vim.b[buf].use_clang_custom_style
          if use_custom then
            local home = vim.fn.expand '~'
            return { '--style=file:' .. home .. '/Templates/cpp/.clang-format' }
          else
            return {}
          end
        end,
      },
    },
  },

  -- Setup on plugin load
  init = function()
    -- Use conform's formatexpr for gq and related commands
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    -- Create augroup for filetype autocmds
    local group = vim.api.nvim_create_augroup('ConformFT', {})

    -- Autocmd to disable autoformat and toggle clang format style for some filetypes
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = { 'c', 'cpp', 'sh' },
      callback = function(args)
        local buf = args.buf
        vim.b[buf].disable_autoformat = true
        vim.b[buf].use_clang_custom_style = true

        vim.keymap.set('n', '<leader>tc', function()
          local new_style = not vim.b[buf].use_clang_custom_style
          vim.b[buf].use_clang_custom_style = new_style
          vim.notify('clang-format style: ' .. (new_style and '📜 Using Global Template' or '⚙️ Default'), vim.log.levels.INFO, { timeout = 500 })
        end, { buffer = buf, desc = '[T]oggle [C]lang-format Autoformat style' })
      end,
    })
  end,
}
