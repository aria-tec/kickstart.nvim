-- extra_typescript.lua
-- Pemasangan plugin tambahan khusus untuk ekosistem TypeScript / React

-- 1. ts-comments.nvim
-- Meningkatkan penanganan komentar multi-konteks (JS vs JSX) secara cerdas
vim.pack.add { 'https://github.com/folke/ts-comments.nvim' }

require('ts-comments').setup {}
