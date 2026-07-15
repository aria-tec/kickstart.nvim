-- colorscheme.lua
-- Konfigurasi tema warna kustom menggunakan mini.base16

require('mini.base16').setup {
  palette = {
    base00 = '#0d0e1c', -- bg-main
    base01 = '#1d2235', -- bg-dim
    base02 = '#4a4f69', -- bg-active
    base03 = '#ef8386', -- red-faint (Semantic: comment)
    base04 = '#9d9d9d', -- fg-dim
    base05 = '#ffffff', -- fg-main (Teks default putih pekat)
    base06 = '#c6daff', -- fg-alt
    base07 = '#ffffff', -- fg-main
    base08 = '#4ae2f0', -- cyan-warmer (Semantic: variable)
    base09 = '#b6a0ff', -- magenta-cooler (Semantic: constant)
    base0A = '#11c777', -- green-cooler (Semantic: type)
    base0B = '#2fafff', -- blue (Semantic: string)
    base0C = '#00d3d0', -- cyan
    base0D = '#f78fe7', -- magenta-warmer (Semantic: fnname / fungsi)
    base0E = '#79a8ff', -- blue-warmer (Semantic: keyword)
    base0F = '#feacd0', -- magenta (Semantic: builtin)
  },
  plugins = {
    default = true,
  },
}
