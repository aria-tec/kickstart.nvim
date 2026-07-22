-- overseer.lua
-- Self-contained configuration for overseer.nvim, resession.nvim, and their Edgy & Heirline integrations.

-- 1. Load Plugins
vim.pack.add { 'https://github.com/stevearc/overseer.nvim' }
vim.pack.add { 'https://github.com/stevearc/resession.nvim' }

-- 2. Overseer Setup
local overseer = require 'overseer'
overseer.setup {
  strategy = 'terminal',
  templates = { 'builtin' },
}

-- 3. Resession Setup (with Overseer Extension integration for task history)
local resession = require 'resession'
resession.setup {
  extensions = {
    overseer = {
      include_ephemeral = true, -- Simpan seluruh riwayat task (selesai, gagal, ephemeral) ke dalam sesi
    },
    quickfix = {},
  },
}

-- Auto save session per working directory on VimLeavePre
local resession_augroup = vim.api.nvim_create_augroup('resession_auto', { clear = true })
vim.api.nvim_create_autocmd('VimLeavePre', {
  group = resession_augroup,
  callback = function() resession.save(vim.fn.getcwd(), { dir = 'dirsession', notify = false }) end,
})

-- 4. Dynamic Edgy Integration (Edgy Panel Layout for OverseerList)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'OverseerList',
  callback = function()
    local ok_edgy, edgy_config = pcall(require, 'edgy.config')
    if ok_edgy and edgy_config and edgy_config.bottom then
      local registered = false
      for _, win in ipairs(edgy_config.bottom) do
        if win.ft == 'OverseerList' then
          registered = true
          break
        end
      end
      if not registered then
        table.insert(edgy_config.bottom, {
          title = 'Overseer Tasks',
          ft = 'OverseerList',
          size = { height = 12 },
        })
      end
    end
  end,
})

-- 5. Keymaps
-- Overseer Keymaps
vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un Task' })
vim.keymap.set('n', '<leader>oc', '<cmd>OverseerShell<cr>', { desc = '[O]verseer Run [C]ustom Command' })
vim.keymap.set('n', '<leader>ob', '<cmd>OverseerBuild<cr>', { desc = '[O]verseer [B]uild Custom Task' })
vim.keymap.set('n', '<leader>oq', '<cmd>OverseerQuickAction<cr>', { desc = '[O]verseer [Q]uick Action' })
vim.keymap.set('n', '<leader>ot', '<cmd>OverseerToggle<cr>', { desc = '[O]verseer [T]oggle UI' })
vim.keymap.set('n', '<leader>oa', '<cmd>OverseerTaskAction<cr>', { desc = '[O]verseer Task [A]ction' })
vim.keymap.set('n', '<leader>oi', '<cmd>OverseerInfo<cr>', { desc = '[O]verseer [I]nfo' })

-- Resession Keymaps (Menggunakan <leader>S kapital untuk menghindari bentrokan dengan Telescope <leader>s [S]earch)
vim.keymap.set('n', '<leader>Ss', resession.save, { desc = '[S]ession [S]ave' })
vim.keymap.set('n', '<leader>Sl', resession.load, { desc = '[S]ession [L]oad' })
vim.keymap.set('n', '<leader>Sd', resession.delete, { desc = '[S]ession [D]elete' })

-- Registrasi grup Which-Key untuk Session & Overseer
local ok_wk, wk = pcall(require, 'which-key')
if ok_wk then
  wk.add {
    { '<leader>S', group = '[S]ession' },
    { '<leader>o', group = '[O]verseer Tasks' },
  }
end
