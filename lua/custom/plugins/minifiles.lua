-- mini.files - Penjelajah dan Manipulasi Berkas
-- Dokumentasi referensi: doc/mini-files-2.txt

local minifiles = require 'mini.files'

minifiles.setup {
  windows = {
    -- Aktifkan panel pratinjau konten berkas/direktori di bawah kursor
    preview = true,
  },
}
