-- oil.nvim
-- https://github.com/stevearc/oil.nvim

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

local detail = false
require('oil').setup {
  default_file_explorer = true,
  columns = {
    'icon',
  },
  keymaps = {
    ['g?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = { 'actions.select', opts = { vertical = true }, desc = 'Open the selection in a vertical split' },
    ['<C-h>'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open the selection in a horizontal split' },
    ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the selection in a new tab' },
    ['<C-p>'] = 'actions.preview',
    ['<C-c>'] = 'actions.close',
    ['<C-l>'] = 'actions.refresh',
    ['-'] = 'actions.parent',
    ['_'] = 'actions.open_cwd',
    ['`'] = 'actions.cd',
    ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = 'Change the directory of the current tab to cwd' },
    ['gs'] = 'actions.change_sort',
    ['gx'] = 'actions.open_external',
    ['g.'] = 'actions.toggle_hidden',
    ['g\\'] = 'actions.toggle_trash',
    ['gd'] = {
      desc = 'Toggle file detail view',
      callback = function()
        detail = not detail
        if detail then
          require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
        else
          require('oil').set_columns { 'icon' }
        end
      end,
    },
  },
}

-- Open parent directory with -
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory in Oil' })
