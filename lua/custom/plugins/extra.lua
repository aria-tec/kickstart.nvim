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

-- 3. inc-rename.nvim
-- Melakukan rename variabel LSP secara interaktif / incremental (real-time preview)
vim.pack.add { 'https://github.com/smjonas/inc-rename.nvim' }

require('inc_rename').setup {}

-- Map grn untuk memicu incremental rename dan mengisi nama lama secara otomatis
vim.keymap.set('n', 'grn', function()
  return ':IncRename ' .. vim.fn.expand('<cword>')
end, { expr = true, desc = '[R]e[n]ame (incremental)' })

-- 4. leetcode.nvim
-- Membantu menyelesaikan soal-soal LeetCode langsung di dalam Neovim
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/kawre/leetcode.nvim',
}

require('leetcode').setup {
  arg = 'leetcode.nvim',
  lang = 'cpp', -- Bahasa pemrograman default (bisa diubah sesuai preferensi)
}

-- 5. mini.operators
-- Operator pengeditan teks pintar (evaluate, exchange, multiply, replace, sort)
require('mini.operators').setup()

-- Keymap untuk menukar argumen bersebelahan (swap adjacent arguments)
-- Memerlukan `a` argument textobject dari 'mini.ai'
vim.keymap.set('n', '(', 'gxiagxila', { remap = true, desc = 'Swap arg left' })
vim.keymap.set('n', ')', 'gxiagxina', { remap = true, desc = 'Swap arg right' })

-- 6. mini.visits
-- Melacak dan menggunakan kembali riwayat kunjungan berkas/direktori secara persisten
require('mini.visits').setup()

-- 7. mini.starter
-- Halaman awal (start screen) Neovim yang interaktif saat dibuka tanpa argumen
require('mini.starter').setup()

