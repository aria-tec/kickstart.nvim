-- colorscheme.lua
-- Konfigurasi tema warna kustom menggunakan mini.base16

require('mini.base16').setup {
  -- Palet warna kustom lama (dikomentari):
  -- palette = {
  --   base00 = '#0d0e1c', -- bg-main
  --   base01 = '#1d2235', -- bg-dim
  --   base02 = '#4a4f69', -- bg-active
  --   base03 = '#ef8386', -- red-faint (Semantic: comment)
  --   base04 = '#9d9d9d', -- fg-dim
  --   base05 = '#ffffff', -- fg-main (Teks default putih pekat)
  --   base06 = '#c6daff', -- fg-alt
  --   base07 = '#ffffff', -- fg-main
  --   base08 = '#4ae2f0', -- cyan-warmer (Semantic: variable)
  --   base09 = '#b6a0ff', -- magenta-cooler (Semantic: constant)
  --   base0A = '#11c777', -- green-cooler (Semantic: type)
  --   base0B = '#2fafff', -- blue (Semantic: string)
  --   base0C = '#00d3d0', -- cyan
  --   base0D = '#f78fe7', -- magenta-warmer (Semantic: fnname / fungsi)
  --   base0E = '#79a8ff', -- blue-warmer (Semantic: keyword)
  --   base0F = '#feacd0', -- magenta (Semantic: builtin)
  -- },

  -- Palet warna Zenburn:
  palette = {
    base00 = '#3f3f3f', -- bg-main (Zenburn default background)
    base01 = '#4f4f4f', -- bg-dim / lighter bg (CursorLine, selection)
    base02 = '#5f5f5f', -- bg-active (Selection / Active line)
    base03 = '#7f9f7f', -- comment / green-gray faint
    base04 = '#9fafaf', -- fg-dim (Line numbers, secondary text)
    base05 = '#dcdccc', -- fg-main (Zenburn primary off-white foreground)
    base06 = '#e0e0e0', -- fg-light
    base07 = '#ffffff', -- fg-bright / white
    base08 = '#dca3a3', -- red (Variables, errors, booleans)
    base09 = '#dfaf8f', -- orange (Constants, numbers, preproc)
    base0A = '#f0dfaf', -- yellow (Keywords, statements, types)
    base0B = '#7f9f7f', -- green (Strings, comments)
    base0C = '#93e0e3', -- cyan (Regex, escape chars)
    base0D = '#8cd0d3', -- blue (Functions, identifiers, headings)
    base0E = '#dc8cc3', -- magenta / purple (Keywords, operators)
    base0F = '#d0bf8f', -- brown / sand (Embedded tags, special)
  },
  use_cterm = true,
  plugins = {
    default = true,
  },
}

vim.g.colors_name = 'zenburn'

