-- Kita butuh fungsi helper gh yang sama seperti di init.lua
local function gh(repo) return 'https://github.com/' .. repo end

-- 1. Load dependensi utama Telescope via vim.pack
---@type (string|vim.pack.Spec)[]
local telescope_deps = {
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope-ui-select.nvim',
}
if vim.fn.executable 'make' == 1 then table.insert(telescope_deps, gh 'nvim-telescope/telescope-fzf-native.nvim') end
vim.pack.add(telescope_deps)

-- 2. Registrasikan Telescope ke vim.pack + lz.n
vim.pack.add({
  {
    src = gh 'nvim-telescope/telescope.nvim',
    name = 'telescope.nvim',
    data = {
      cmd = 'Telescope',
      keys = {
        { '<leader>sh', function() require('telescope.builtin').help_tags() end, desc = '[S]earch [H]elp' },
        { '<leader>sk', function() require('telescope.builtin').keymaps() end, desc = '[S]earch [K]eymaps' },
        { '<leader>sf', function() require('telescope.builtin').find_files() end, desc = '[S]earch [F]iles' },
        { '<leader>sF', function() require('telescope.builtin').find_files { hidden = true } end, desc = '[S]earch [F]iles (Hidden)' },
        { '<leader>ss', function() require('telescope.builtin').builtin() end, desc = '[S]earch [S]elect Telescope' },
        { '<leader>sw', function() require('telescope.builtin').grep_string() end, desc = '[S]earch current [W]ord', mode = { 'n', 'v' } },
        { '<leader>sg', function() require('telescope.builtin').live_grep() end, desc = '[S]earch by [G]rep' },
        { '<leader>sd', function() require('telescope.builtin').diagnostics() end, desc = '[S]earch [D]iagnostics' },
        { '<leader>sr', function() require('telescope.builtin').resume() end, desc = '[S]earch [R]esume' },
        { '<leader>s.', function() require('telescope.builtin').oldfiles() end, desc = '[S]earch Recent Files ("." for repeat)' },
        { '<leader>sc', function() require('telescope.builtin').commands() end, desc = '[S]earch [C]ommands' },
        { '<leader><leader>', function() require('telescope.builtin').buffers() end, desc = '[ ] Find existing buffers' },
        { 
          '<leader>/', 
          function() 
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end, 
          desc = '[/] Fuzzily search in current buffer' 
        },
        { 
          '<leader>s/', 
          function() 
            require('telescope.builtin').live_grep {
              grep_open_files = true,
              prompt_title = 'Live Grep in Open Files',
            }
          end, 
          desc = '[S]earch [/] in Open Files' 
        },
        { 
          '<leader>sn', 
          function() 
            require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config', follow = true } 
          end, 
          desc = '[S]earch [N]eovim files' 
        },
      },
      
      after = function()
        require('telescope').setup {
          extensions = {
            ['ui-select'] = { require('telescope.themes').get_dropdown() },
          },
        }

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')
      end
    }
  }
}, {
  load = function(plug_data)
    require('lz.n').load(plug_data)
  end
})
