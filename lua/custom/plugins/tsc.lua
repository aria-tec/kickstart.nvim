-- tsc.nvim
-- https://github.com/dmmulroy/tsc.nvim

-- Pemasangan plugin tsc.nvim
vim.pack.add { 'https://github.com/dmmulroy/tsc.nvim' }

require('tsc').setup {
  auto_open_qflist = true,
  enable_progress_notifications = true,
}

-- Keymaps (Notifikasi & Prompt menggunakan Bahasa Inggris)
vim.keymap.set('n', '<leader>tc', '<cmd>TSC<CR>', { desc = '[T]ype [C]heck Project' })
