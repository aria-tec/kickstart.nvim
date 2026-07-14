-- package-info.nvim
-- https://github.com/vuki656/package-info.nvim

-- Pemasangan plugin dan dependensi UI yang dibutuhkan (nui.nvim)
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/vuki656/package-info.nvim',
}

require('package-info').setup {
  autostart = true,
  hide_up_to_date = false, -- Tampilkan virtual text versi terbaru sekalipun paketnya sudah up-to-date
}

-- Mendaftarkan Keymaps (Semua prompt/notifikasi menggunakan bahasa Inggris secara bawaan)
local map_opts = { silent = true, noremap = true }
vim.keymap.set('n', '<leader>nt', require('package-info').toggle, map_opts)
vim.keymap.set('n', '<leader>nu', require('package-info').update, map_opts)
vim.keymap.set('n', '<leader>nd', require('package-info').delete, map_opts)
vim.keymap.set('n', '<leader>np', require('package-info').change_version, map_opts)
vim.keymap.set('n', '<leader>ni', require('package-info').install, map_opts)

-- Memuat ekstensi Telescope
pcall(function()
  require('telescope').load_extension 'package_info'
end)
