-- tmux.lua
-- https://github.com/christoomey/vim-tmux-navigator

-- [[ Konfigurasi Global Opsi Tmux Navigator ]]
vim.g.tmux_navigator_save_on_switch = 1     -- Otomatis simpan buffer saat keluar berpindah pane
vim.g.tmux_navigator_disable_when_zoomed = 1 -- Nonaktifkan pindah pane jika pane sedang di-zoom
vim.g.tmux_navigator_preserve_zoom = 1       -- Pertahankan status zoom jika berpindah pane sesama tmux

-- Pemasangan plugin christoomey/vim-tmux-navigator
vim.pack.add { 'https://github.com/christoomey/vim-tmux-navigator' }
