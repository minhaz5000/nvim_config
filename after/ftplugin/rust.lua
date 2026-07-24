local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr }

local function map(key, cmd, desc)
  vim.keymap.set('n', key, function() vim.cmd.RustLsp(cmd) end, vim.tbl_extend('force', opts, { desc = 'Rust: ' .. desc }))
end

-- Register <leader>r group in which-key
require('which-key').add { { '<leader>r', group = '[R]ust', buffer = bufnr } }

-- Override builtins with richer Rust-specific versions
vim.keymap.set('n', 'K', function() vim.cmd.RustLsp { 'hover', 'actions' } end, vim.tbl_extend('force', opts, { desc = 'Rust: Hover actions' }))

-- Rust actions
map('<leader>ra', 'codeAction', 'Code action')
map('<leader>rr', 'runnables', 'Runnables')
map('<leader>rd', 'debuggables', 'Debuggables')
map('<leader>re', 'expandMacro', 'Expand macro')
map('<leader>ro', 'openDocs', 'Open docs.rs')
map('<leader>rp', 'parentModule', 'Parent module')
map('<leader>rx', 'explainError', 'Explain error')
