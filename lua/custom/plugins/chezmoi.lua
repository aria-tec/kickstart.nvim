-- chezmoi.lua
-- https://github.com/alker0/chezmoi.vim

-- Wajib disetel sebelum plugin dimuat agar tidak terjadi masalah urutan pemuatan (load order)
vim.g['chezmoi#use_tmp_buffer'] = true

-- Pemasangan plugin chezmoi.vim
vim.pack.add { 'https://github.com/alker0/chezmoi.vim' }

-- [[ Autocommand: Auto-Apply Chezmoi on Save ]]
-- Otomatis menerapkan perubahan ke direktori home ketika menyimpan file di repositori chezmoi
if vim.fn.executable('chezmoi') == 1 then
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = vim.fn.expand('~') .. '/.local/share/chezmoi/*',
    callback = function(ev)
      local file_path = ev.match
      -- Jalankan apply secara asinkron di latar belakang agar editor tidak hang/freeze
      vim.fn.jobstart({ 'chezmoi', 'apply', '--source-path', file_path }, {
        on_exit = function(_, exit_code)
          if exit_code == 0 then
            vim.notify('Chezmoi: Applied successfully', vim.log.levels.INFO)
          else
            vim.notify('Chezmoi: Failed to apply changes', vim.log.levels.ERROR)
          end
        end,
      })
    end,
    desc = 'Auto-apply chezmoi changes on write',
  })
end
