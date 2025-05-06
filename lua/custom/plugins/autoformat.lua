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
      '<leader>ae',
      function()
        local new_state = not vim.b.disable_autoformat
        vim.b.disable_autoformat = new_state
        vim.notify('Autoformat on Save ' .. (new_state and '🔴 Disabled' or '🟢 Enabled'), vim.log.levels.INFO, { timeout = 500 })
      end,
      desc = 'Toggle [A]utoformat on [E]dit',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff_organize_imports', 'ruff_format' },
      c = { 'clang_format' },
      cpp = { 'clang_format' },
      markdown = { 'mdsf', 'mdformat' },
      sh = { 'shellharden' },
      yaml = { 'yamlfmt' },
      tex = { 'latexindent' },
    },
    format_on_save = function(bufnr)
      if vim.b[bufnr].disable_autoformat then
        return nil
      end
      if vim.api.nvim_buf_get_name(bufnr):find('/node_modules/', 1, true) then
        return nil
      end
      return { timeout_ms = 500, lsp_format = 'fallback' }
    end,
    formatters = {
      clang_format = {
        prepend_args = function()
          return vim.b.use_clang_custom_style and { '--style=file:/home/minhaz/Templates/cpp/.clang-format' } or {}
        end,
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    local group = vim.api.nvim_create_augroup('ConformFT', {})
    vim.api.nvim_create_autocmd('FileType', {
      group = group,
      pattern = { 'c', 'cpp', 'sh' },
      callback = function(args)
        vim.b[args.buf].disable_autoformat = true
        vim.b[args.buf].use_clang_custom_style = true

        vim.keymap.set('n', '<leader>ac', function()
          local new_style = not vim.b.use_clang_custom_style
          vim.b.use_clang_custom_style = new_style
          vim.notify('clang-format style: ' .. (new_style and '📜 Using Global Template' or '⚙️ Default'), vim.log.levels.INFO, { timeout = 500 })
        end, {
          buffer = args.buf,
          desc = 'Toggle [A]uto [C]lang-format style',
        })
      end,
    })
  end,
}
