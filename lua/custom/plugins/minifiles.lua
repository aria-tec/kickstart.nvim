-- mini.files - Penjelajah dan Manipulasi Berkas
-- Dokumentasi referensi: doc/mini-files-2.txt

local minifiles = require 'mini.files'

minifiles.setup {
  windows = {
    -- Aktifkan panel pratinjau konten berkas/direktori di bawah kursor
    preview = true,
  },
}

-- Fungsi toggle untuk membuka/menutup mini.files secara dinamis
local toggle = function()
  if not minifiles.close() then
    -- Buka fokus pada berkas aktif jika valid, jika tidak buka di cwd
    local buf_name = vim.api.nvim_buf_get_name(0)
    if buf_name ~= '' and vim.uv.fs_stat(buf_name) then
      minifiles.open(buf_name)
    else
      minifiles.open()
    end
  end
end

-- Keymap global toggle menggunakan tombol backslash '\'
vim.keymap.set('n', '\\', toggle, { desc = 'Toggle mini.files', silent = true })

