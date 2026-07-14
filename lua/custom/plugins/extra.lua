-- extra.lua
-- Pemasangan plugin utilitas umum tambahan

-- 1. undotree
-- Visualisasi pohon riwayat perubahan (undo history) secara non-linear
vim.pack.add { 'https://github.com/mbbill/undotree' }

-- Keymap untuk membuka/menutup panel visualisasi undotree
vim.keymap.set('n', '<leader>ut', '<cmd>UndotreeToggle<CR>', { desc = '[U]ndo [T]ree Toggle' })

-- 2. vim-illuminate
-- Penyorotan otomatis penggunaan kata lain di bawah kursor
vim.pack.add { 'https://github.com/RRethy/vim-illuminate' }

require('illuminate').configure({
  -- Menggunakan LSP, Treesitter, atau Regex sebagai fallback pencocokan kata
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  -- Optimasi performa untuk file besar (> 2000 baris) agar hanya menggunakan LSP
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { 'lsp' },
  },
})
