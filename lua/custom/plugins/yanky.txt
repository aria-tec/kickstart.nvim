-- yanky.lua
-- https://github.com/gbprod/yanky.nvim

-- Pemasangan plugin yanky.nvim
vim.pack.add { 'https://github.com/gbprod/yanky.nvim' }

require('yanky').setup {
  ring = {
    history_length = 100,
    storage = 'shada', -- Menggunakan shada bawaan Neovim agar tidak memerlukan sqlite
  },
  highlight = {
    on_put = true,
    on_yank = true,
    timer = 200,
  },
  preserve_cursor_position = {
    enabled = true,
  },
}

-- [[ Keymaps ]]
local map = vim.keymap.set

-- Mengganti tombol default yank dan put dengan interseptor Yanky
map({ 'n', 'x' }, 'y', '<Plug>(YankyYank)', { desc = 'Yank text' })
map({ 'n', 'x' }, 'p', '<Plug>(YankyPutAfter)', { desc = 'Put text after' })
map({ 'n', 'x' }, 'P', '<Plug>(YankyPutBefore)', { desc = 'Put text before' })
map({ 'n', 'x' }, 'gp', '<Plug>(YankyGPutAfter)', { desc = 'GPut text after' })
map({ 'n', 'x' }, 'gP', '<Plug>(YankyGPutBefore)', { desc = 'GPut text before' })

-- Siklus riwayat kopian setelah menempelkan teks (paste)
map('n', '<C-p>', '<Plug>(YankyPreviousEntry)', { desc = 'Select previous yank history entry' })
map('n', '<C-n>', '<Plug>(YankyNextEntry)', { desc = 'Select next yank history entry' })

-- Integrasi Telescope
pcall(function()
  require('telescope').load_extension 'yank_history'
  map('n', '<leader>sy', '<cmd>Telescope yank_history<CR>', { desc = '[S]earch [Y]ank history' })
end)
