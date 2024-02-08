vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("c", "ll", function()
  return "/"
  -- return vim.fn.expand("%:h") .. "/"
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ew", ':e <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set("n", "<leader>es", ':sp <C-R>=expand("%:p:h") . "/" <CR>')
vim.keymap.set("n", "<leader>ev", ':vsp <C-R>=expand("%:p:h") . "/" <CR>')

-- Keymaps for commenting
vim.keymap.set("n", "cc", function()
  return vim.v.count == 0 and "<Plug>(comment_toggle_linewise_current)" or "<Plug>(comment_toggle_linewise_count)"
end, { expr = true })

vim.keymap.set("x", "cc", "<Plug>(comment_toggle_linewise_visual)")

-- keymaps for copy / paste
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

