-- lua/utils/helpers.lua

-- Buat tabel kosong. 'M' adalah singkatan dari 'Module' (konvensi standar Lua)
local M = {}

-- Masukkan fungsi Anda ke dalam tabel tersebut
-- Perhatikan: Kita TIDAK menggunakan kata 'local' di depan nama fungsinya
function M.gh(repo)
  return 'https://github.com/' .. repo
end

-- Anda bisa menambahkan fungsi pembantu lain di sini nantinya
function M.cek_os()
  -- contoh fungsi lain...
end

-- Wajib: Kembalikan (return) tabel tersebut di akhir file
return M
