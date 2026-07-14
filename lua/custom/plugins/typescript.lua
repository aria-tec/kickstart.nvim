-- typescript-tools.nvim
-- https://github.com/pmizio/typescript-tools.nvim

vim.pack.add { 'https://github.com/pmizio/typescript-tools.nvim' }

require('typescript-tools').setup {
  settings = {
    -- Memulai server diagnostik terpisah untuk menghitung error di latar belakang (lebih responsif)
    separate_diagnostic_server = true,
    -- Meminta diagnosa ketika keluar dari mode Insert (insert_leave)
    publish_diagnostic_on = 'insert_leave',
    -- Melengkapi kurung fungsi saat autocomplete dipilih (seperti VS Code)
    complete_function_calls = true,
  },
}
