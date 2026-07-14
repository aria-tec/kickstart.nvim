-- hlslens.lua
-- https://github.com/kevinhwang91/nvim-hlslens

-- Pemasangan plugin nvim-hlslens
vim.pack.add { 'https://github.com/kevinhwang91/nvim-hlslens' }

require('hlslens').setup {
  calm_down = true, -- Bersihkan highlight pencarian secara cerdas saat kursor berpindah
}

-- Integrasi navigasi pencarian agar kursor tetap di tengah (zzzv) dan menampilkan panel lens
vim.keymap.set('n', 'n', function()
  vim.cmd('normal! ' .. vim.v.count1 .. 'nzzzv')
  require('hlslens').start()
end, { desc = 'Search next, center cursor, and show lens' })

vim.keymap.set('n', 'N', function()
  vim.cmd('normal! ' .. vim.v.count1 .. 'Nzzzv')
  require('hlslens').start()
end, { desc = 'Search previous, center cursor, and show lens' })

vim.keymap.set('n', '*', function()
  vim.cmd('normal! *')
  require('hlslens').start()
end, { desc = 'Search word forward under cursor and show lens' })

vim.keymap.set('n', '#', function()
  vim.cmd('normal! #')
  require('hlslens').start()
end, { desc = 'Search word backward under cursor and show lens' })
