-- extra.lua
-- Pemasangan plugin utilitas umum tambahan

-- 1. undotree
-- Visualisasi pohon riwayat perubahan (undo history) secara non-linear
vim.pack.add { 'https://github.com/mbbill/undotree' }

-- Keymap untuk membuka/menutup panel visualisasi undotree
vim.keymap.set('n', '<leader>ut', '<cmd>UndotreeToggle<CR>', { desc = '[U]ndo [T]ree Toggle' })
