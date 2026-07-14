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
vim.keymap.set('n', '<leader>nt', require('package-info').toggle, { silent = true, noremap = true, desc = '[T]oggle package versions' })
vim.keymap.set('n', '<leader>nu', require('package-info').update, { silent = true, noremap = true, desc = '[U]pdate dependency on line' })
vim.keymap.set('n', '<leader>nd', require('package-info').delete, { silent = true, noremap = true, desc = '[D]elete dependency on line' })
vim.keymap.set('n', '<leader>np', require('package-info').change_version, { silent = true, noremap = true, desc = '[P]ackage change version' })
vim.keymap.set('n', '<leader>ni', require('package-info').install, { silent = true, noremap = true, desc = '[I]nstall new dependency' })

-- Memuat ekstensi Telescope
pcall(function()
  require('telescope').load_extension 'package_info'
end)
