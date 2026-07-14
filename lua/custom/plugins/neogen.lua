-- neogen.lua
-- https://github.com/danymat/neogen

-- Pemasangan plugin neogen
vim.pack.add { 'https://github.com/danymat/neogen' }

require('neogen').setup {
  enabled = true,
  input_after_comment = true, -- Masuk ke mode insert setelah anotasi disisipkan
  snippet_engine = 'luasnip', -- Menggunakan engine snippet LuaSnip yang terpasang di sistem
}

-- [[ Keymaps ]]
local map = vim.keymap.set

map('n', '<leader>dG', '<cmd>Neogen<CR>', { desc = '[D]oc [G]enerate (Auto)' })
map('n', '<leader>df', '<cmd>Neogen func<CR>', { desc = '[D]oc [F]unction' })
map('n', '<leader>dc', '<cmd>Neogen class<CR>', { desc = '[D]oc [C]lass' })
map('n', '<leader>dt', '<cmd>Neogen type<CR>', { desc = '[D]oc [T]ype' })
