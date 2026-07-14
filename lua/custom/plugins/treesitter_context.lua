-- treesitter_context.lua
-- https://github.com/nvim-treesitter/nvim-treesitter-context

-- Pemasangan plugin nvim-treesitter-context
vim.pack.add { 'https://github.com/nvim-treesitter/nvim-treesitter-context' }

require('treesitter-context').setup {
  enable = true, -- Nyalakan secara default
  max_lines = 4, -- Batas maksimal 4 baris konteks agar tidak memenuhi layar
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 20, -- Baris maksimum untuk satu blok konteks tunggal
  trim_scope = 'outer',
  mode = 'cursor',
  separator = nil, -- Karakter pemisah garis (diabaikan secara default)
}

-- Keymap untuk menyalakan/mematikan fitur treesitter context secara interaktif
vim.keymap.set('n', '<leader>tc', '<cmd>TSContextToggle<CR>', { desc = '[T]oggle Treesitter [C]ontext' })
