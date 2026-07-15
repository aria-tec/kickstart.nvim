-- livepreview.lua
-- https://github.com/brianhuster/live-preview.nvim

-- Pemasangan plugin live-preview.nvim
vim.pack.add { 'https://github.com/brianhuster/live-preview.nvim' }

require('livepreview.config').set({
  port = 5500,
  browser = 'default',
  dynamic_root = true, -- Gunakan direktori file saat ini sebagai root server (mencegah 404)
  sync_scroll = true,
  picker = 'telescope', -- Gunakan Telescope sebagai pemilih file pratinjau
  address = '127.0.0.1',
})

-- [[ Keymaps ]]
-- Memulai LivePreview di browser default
vim.keymap.set('n', '<leader>tp', '<cmd>LivePreview start<CR>', { desc = '[T]oggle Live [P]review Start' })
-- Menutup server LivePreview
vim.keymap.set('n', '<leader>tP', '<cmd>LivePreview close<CR>', { desc = '[T]oggle Live [P]review Close' })
