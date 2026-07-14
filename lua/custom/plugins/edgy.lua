-- edgy.lua
-- https://github.com/folke/edgy.nvim

-- Pemasangan plugin edgy.nvim
vim.pack.add { 'https://github.com/folke/edgy.nvim' }

-- Rekomendasi opsi Neovim untuk performa tata letak edgy yang optimal
vim.opt.laststatus = 3 -- Mengaktifkan statusline global tunggal di bawah
vim.opt.splitkeep = 'screen' -- Menjaga posisi teks saat layar terbagi

require('edgy').setup {
  animate = {
    enabled = true,
  },
  left = {
    -- Menaruh panel undotree di sebelah kiri
    {
      title = 'UndoTree',
      ft = 'undotree',
      size = { width = 30 },
    },
  },
  bottom = {
    -- Menaruh berkas dokumentasi bantuan di bagian bawah
    {
      title = 'Help',
      ft = 'help',
      size = { height = 20 },
      -- Filter agar hanya memicu buffer bertipe help
      filter = function(buf)
        return vim.bo[buf].buftype == 'help'
      end,
    },
    -- Menaruh Quickfix list di bagian bawah
    {
      title = 'Quickfix',
      ft = 'qf',
      size = { height = 10 },
    },
  },
}
