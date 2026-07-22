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

-- 5. Dynamic Heirline Integration Helpers (Exposed for Statusline)
_G.OverseerStatus = function()
  if not package.loaded.overseer then return '' end
  local tasks = require('overseer.task_list').list_tasks { unique = true, include_ephemeral = true }
  local tasks_by_status = require('overseer.util').tbl_group_by(tasks, 'status')
  local symbols = {
    ['CANCELED'] = ' ',
    ['FAILURE'] = '󰅚 ',
    ['SUCCESS'] = '󰄴 ',
    ['RUNNING'] = '󰑮 ',
  }
  local parts = {}
  for status, symbol in pairs(symbols) do
    local t = tasks_by_status[status]
    if t and #t > 0 then table.insert(parts, string.format('%s%d', symbol, #t)) end
  end
  if #parts == 0 then return '' end
  return ' ' .. table.concat(parts, ' ') .. ' '
end

_G.ResessionStatus = function()
  if not package.loaded.resession then return '' end
  local name = require('resession').get_current()
  if not name or name == '' then return '' end
  return ' 󰆓 [' .. name .. '] '
end

-- 6. Keymaps
-- Overseer Keymaps
vim.keymap.set('n', '<leader>or', '<cmd>OverseerRun<cr>', { desc = '[O]verseer [R]un Task' })
vim.keymap.set('n', '<leader>oc', '<cmd>OverseerShell<cr>', { desc = '[O]verseer Run [C]ustom Command' })
vim.keymap.set('n', '<leader>ob', '<cmd>OverseerBuild<cr>', { desc = '[O]verseer [B]uild Custom Task' })
vim.keymap.set('n', '<leader>oq', '<cmd>OverseerQuickAction<cr>', { desc = '[O]verseer [Q]uick Action' })
vim.keymap.set('n', '<leader>ot', '<cmd>OverseerToggle<cr>', { desc = '[O]verseer [T]oggle UI' })
vim.keymap.set('n', '<leader>oa', '<cmd>OverseerTaskAction<cr>', { desc = '[O]verseer Task [A]ction' })
vim.keymap.set('n', '<leader>oi', '<cmd>OverseerInfo<cr>', { desc = '[O]verseer [I]nfo' })

-- Resession Keymaps
vim.keymap.set('n', '<leader>ss', resession.save, { desc = '[S]ession [S]ave' })
vim.keymap.set('n', '<leader>sl', resession.load, { desc = '[S]ession [L]oad' })
vim.keymap.set('n', '<leader>sd', resession.delete, { desc = '[S]ession [D]elete' })
