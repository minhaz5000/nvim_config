-- " Use `dsm` to delete surrounding math (replacing the default shortcut `ds$`)
vim.keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)", { silent = true })

-- For item text objects
vim.keymap.set({ "o", "x" }, "ai", "<Plug>(vimtex-am)", { silent = true })
vim.keymap.set({ "o", "x" }, "ii", "<Plug>(vimtex-im)", { silent = true })

-- For inline math text objects
vim.keymap.set({ "o", "x" }, "am", "<Plug>(vimtex-a$)", { silent = true })
vim.keymap.set({ "o", "x" }, "im", "<Plug>(vimtex-i$)", { silent = true })

