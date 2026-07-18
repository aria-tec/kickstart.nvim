# Panduan Lengkap: Fungsi & Peran 46 Plugin Neovim Anda

Dokumen ini berisi panduan terperinci mengenai fungsi, peran, dan cara kerja dari seluruh **46 plugin** yang terpasang pada konfigurasi Neovim Anda berdasarkan berkas `nvim-pack-lock.json`.

---

## Daftar Isi
1. [Core & Infrastruktur Dasar (9 Plugin)](#1-core--infrastruktur-dasar-9-plugin)
2. [Language Server Protocol - LSP (5 Plugin)](#2-language-server-protocol---lsp-5-plugin)
3. [Autocompletion & Snippets (5 Plugin)](#3-autocompletion--snippets-5-plugin)
4. [Formatting & Linting (2 Plugin)](#4-formatting--linting-2-plugin)
5. [Treesitter & Penyorotan Sintaksis (3 Plugin)](#5-treesitter--penyorotan-sintaksis-3-plugin)
6. [Navigasi & Pencarian (8 Plugin)](#6-navigasi--pencarian-8-plugin)
7. [Integrasi TypeScript & Web Dev (6 Plugin)](#7-integrasi-typescript--web-dev-6-plugin)
8. [Perilaku Editor & Utilitas Cerdas (8 Plugin)](#8-perilaku-editor--utilitas-cerdas-8-plugin)
9. [Estetika & Antarmuka UI (5 Plugin)](#9-estetika--antarmuka-ui-5-plugin)

---

## 1. Core & Infrastruktur Dasar (9 Plugin)

Bagian ini memuat library fundamental dan pengelola ekosistem Neovim yang menyokong plugin lainnya.

*   ### [mini.nvim](https://github.com/nvim-mini/mini.nvim)
    *   **Fungsi:** Library modular serbaguna yang sangat cepat. Pada Kickstart Anda, modul ini digunakan untuk:
        *   `mini.ai`: Meningkatkan fungsionalitas seleksi teks objek (`a` dan `i` keys).
        *   `mini.surround`: Menambah/mengubah/menghapus kurung atau kutip penutup secara cepat (`ys`, `ds`, `cs`).
        *   `mini.statusline`: Menyediakan bilah status minimalis di bagian bawah editor.
        *   `mini.files`: Penjelajah berkas berbasis kolom (Miller columns) yang memungkinkan navigasi dan manipulasi sistem file dengan mengedit teks biasa.
        *   `mini.operators`: Menyediakan operator teks tambahan untuk mengevaluasi, menukar, menduplikasi, mengganti, dan mengurutkan teks.
        *   `mini.visits`: Melacak dan menggunakan kembali riwayat kunjungan berkas/direktori secara persisten.
        *   `mini.starter`: Halaman awal (start screen) interaktif saat Neovim dibuka.
*   ### [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
    *   **Fungsi:** Library utilitas fungsi Lua (seperti penanganan file asinkron, pemformatan string, job controller) yang wajib dimiliki untuk menjalankan Telescope, Gitsigns, dan banyak plugin lainnya.
*   ### [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
    *   **Fungsi:** Library UI komponen modular yang digunakan untuk membuat komponen antarmuka Neovim seperti popup, menu input mengambang, dan layout pohon (digunakan oleh Neo-tree dan package-info).
*   ### [which-key.nvim](https://github.com/folke/which-key.nvim)
    *   **Fungsi:** Menampilkan pop-up overlay interaktif yang menjelaskan kombinasi tombol pintas (*keymaps*) saat Anda menekan tombol awalan (seperti `<leader>`). Membantu menghafal shortcut Neovim.
*   ### [mason.nvim](https://github.com/mason-org/mason.nvim)
    *   **Fungsi:** Manajer paket untuk Neovim. Berfungsi mengunduh dan memasang server LSP, linter, dan formatter eksternal secara otomatis ke dalam sistem lokal Anda.
*   ### [mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)
    *   **Fungsi:** Menjadi jembatan integrasi antara `mason.nvim` dan konfigurasi LSP bawaan Neovim (`nvim-lspconfig`) agar server LSP terpasang otomatis dengan setup yang selaras.
*   ### [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)
    *   **Fungsi:** Memastikan seluruh daftar perkakas eksternal (LSP, Formatter, Linter) yang didefinisikan dalam kode konfigurasi Anda otomatis diunduh dan dipasang oleh Mason pada saat startup pertama kali.
*   ### [guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
    *   **Fungsi:** Secara otomatis mendeteksi ukuran tabulator (spasi vs tab, lebar 2 vs 4) dari file yang sedang dibuka, sehingga Anda tidak perlu menyetel `shiftwidth` manual untuk file proyek luar.
*   ### [fidget.nvim](https://github.com/j-hui/fidget.nvim)
    *   **Fungsi:** Menampilkan bar kemajuan (*progress bar*) asinkron di pojok kanan bawah layar saat LSP sedang melakukan loading, indeksasi kode, atau diagnosik proyek.

---

## 2. Language Server Protocol - LSP (5 Plugin)

Plugin yang menyuntikkan kecerdasan IDE seperti auto-import, navigasi definisi, go-to-definition, diagnosik error, dan auto-refactor.

*   ### [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
    *   **Fungsi:** Kumpulan konfigurasi default resmi untuk menghubungkan Neovim dengan puluhan Language Server (LSP) populer di industri.
*   ### [SchemaStore.nvim](https://github.com/b0o/SchemaStore.nvim)
    *   **Fungsi:** Menyediakan katalog JSON Schema lengkap ke dalam server `jsonls`. Membuat Neovim secara ajaib mengerti validasi sintaksis dan autocomplete untuk file konfigurasi seperti `package.json`, `tsconfig.json`, `lerna.json`, dll.
*   ### [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim)
    *   **Fungsi:** Fitur penggantian nama variabel/fungsi LSP secara interaktif di layar. Perubahan teks langsung ter-render di seluruh file secara real-time saat Anda mengetik nama baru pada command line (pemicu: `grn`).
*   ### [neogen](https://github.com/danymat/neogen)
    *   **Fungsi:** Generator anotasi/dokumentasi kode otomatis berbasis Treesitter (menghasilkan struktur JSDoc, PHPDoc, Docstring Python dengan cepat lewat tombol pintas `<leader>df` untuk fungsi atau `<leader>dc` untuk kelas).
*   ### [vim-illuminate](https://github.com/RRethy/vim-illuminate)
    *   **Fungsi:** Secara otomatis menyoroti kata/variabel yang sama di bawah kursor. Dilengkapi dengan navigasi lompat cepat menggunakan `Alt+n` (berikutnya) dan `Alt+p` (sebelumnya) serta fallback Treesitter/Regex jika LSP mati.

---

## 3. Autocompletion & Snippets (5 Plugin)

Ekosistem penyedia rekomendasi autocomplete pengetikan kode dan kerangka potongan kode siap pakai.

*   ### [blink.cmp](https://github.com/saghen/blink.cmp)
    *   **Fungsi:** Mesin autocomplete super cepat yang ditulis menggunakan Rust. Bertugas menampilkan pop-up daftar saran kata saat mengetik (menyatukan sumber data dari LSP, Path file, Buffer, dan Snippet).
*   ### [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
    *   **Fungsi:** Mesin pemroses snippet Lua yang kuat untuk menyisipkan kerangka kode (digunakan bersama blink.cmp untuk melakukan ekspansi potongan kode).
*   ### [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
    *   **Fungsi:** Kumpulan pustaka ribuan kerangka kode (snippets) siap pakai untuk berbagai bahasa pemrograman populer (seperti React, HTML, CSS, PHP, Python, JS, dll.).
*   ### [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
    *   **Fungsi:** Penutup kurung, tanda kutip, dan tag kurung kurawal secara otomatis saat Anda mengetik karakter pembukanya.
*   ### [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
    *   **Fungsi:** Otomatis menutup tag HTML/XML (seperti `<div>` menjadi `<div></div>`) dan mengganti nama tag berpasangan secara simultan saat mengedit tag pembuka di HTML, JSX, dan TSX.

---

## 4. Formatting & Linting (2 Plugin)

Menjaga kerapian standar penulisan kode (*formatting*) serta mendeteksi potensi error/bug secara pasif (*linting*).

*   ### [conform.nvim](https://github.com/stevearc/conform.nvim)
    *   **Fungsi:** Pengelola pemformatan kode terpusat (formatter). Pada setup Anda, ia menjalankan `prettierd`/`prettier` untuk JS/TS/React, `pint` untuk Laravel PHP, dan `blade-formatter` secara asinkron saat Anda menyimpan berkas (*Format on Save*).
*   ### [nvim-lint](https://github.com/mfussenegger/nvim-lint)
    *   **Fungsi:** Pengelola linter asinkron untuk mendeteksi kesalahan sintaksis di latar belakang (menjalankan `phpcs` untuk PHP dan `markdownlint` untuk file dokumentasi).

---

## 5. Treesitter & Penyorotan Sintaksis (3 Plugin)

Ekosistem parser teks canggih yang menganalisis kode sebagai struktur pohon logis, bukan sekadar mencocokkan pola string kasar.

*   ### [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
    *   **Fungsi:** Engine parser sintaksis Neovim utama untuk memberikan pewarnaan kode yang sangat akurat, navigasi cerdas, seleksi blok visual, dan penempatan pelipatan kode (*folds*).
*   ### [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
    *   **Fungsi:** Panel lekat (*sticky header*) di bagian atas editor yang menahan baris deklarasi penting (seperti nama kelas atau fungsi induk) saat Anda melakukan scroll ke bawah file yang panjang (pemicu toggle: `<leader>tc`).
*   ### [ts-comments.nvim](https://github.com/folke/ts-comments.nvim)
    *   **Fungsi:** Penentu pola komentar pintar menggunakan Treesitter. Memungkinkan Anda menulis komentar dengan pintasan `gc` secara dinamis di file multi-sintaksis (misalnya menggunakan `{/* ... */}` saat kursor di dalam JSX React, dan kembali ke `//` saat di luar JSX).

---

## 6. Navigasi & Pencarian (8 Plugin)

Plugin yang mempermudah pergerakan kursor, perpindahan antar berkas, dan pencarian global.

*   ### [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    *   **Fungsi:** Pencari fuzzy (*fuzzy finder*) visual andalan untuk Neovim. Digunakan untuk mencari nama berkas, teks global, buffers, riwayat git, references LSP, dan lainnya.
*   ### [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
    *   **Fungsi:** Algoritma pencarian fuzzy C-porting cepat untuk membuat penyaringan hasil di Telescope berjalan instan tanpa lag.
*   ### [telescope-ui-select.nvim](https://github.com/nvim-telescope/telescope-ui-select.nvim)
    *   **Fungsi:** Mengambil alih antarmuka menu seleksi bawaan Neovim (seperti `vim.ui.select` untuk Code Actions LSP) dan menampilkannya di dalam pop-up visual Telescope yang elegan.
*   ### [mini.files] (Modul dari mini.nvim)
    *   **Fungsi:** Penjelajah berkas berbasis kolom (Miller columns) yang sangat cepat. Memungkinkan Anda melakukan navigasi struktur direktori secara visual serta melakukan manipulasi file (buat, hapus, ganti nama, salin, dan pindahkan) secara langsung dengan mengedit buffer teks, lalu menyinkronkannya menggunakan tombol `=` (pemicu toggle: `\`).
*   ### [mini.visits] (Modul dari mini.nvim)
    *   **Fungsi:** Melacak dan mengumpulkan riwayat kunjungan file/direktori secara persisten di disk. Memudahkan untuk membuka kembali berkas berdasarkan frekuensi atau label kustom.
*   ### [flash.nvim](https://github.com/folke/flash.nvim)
    *   **Fungsi:** Lompatan kursor super cepat di seluruh layar menggunakan penanda huruf unik (pemicu tombol: `s` atau `S`).
*   ### [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
    *   **Fungsi:** Menghubungkan navigasi split jendela Neovim dengan pane **Tmux** menggunakan kombinasi tombol `Ctrl + h/j/k/l`.
*   ### [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens)
    *   **Fungsi:** Memperbaiki visual pencarian bawaan dengan menampilkan gelembung teks melayang berisi posisi kecocokan kata (`[index/total]`, misalnya `[3/12]`) langsung di samping kata yang dituju.

---

## 7. Integrasi TypeScript & Web Dev (6 Plugin)

Perkakas khusus untuk mempercepat penulisan kode ekosistem JavaScript, TypeScript, React, Next.js, dan dotfiles.

*   ### [typescript-tools.nvim](https://github.com/pmizio/typescript-tools.nvim)
    *   **Fungsi:** Pengganti parser LSP `ts_ls` bawaan. Menjalankan compiler TypeScript asinkron yang jauh lebih cepat, hemat RAM, dan kaya fitur (auto-rename import, organizing imports, dll).
*   ### [tsc.nvim](https://github.com/dmmulroy/tsc.nvim)
    *   **Fungsi:** Melakukan pemeriksaan tipe data (*type-checking*) TypeScript untuk seluruh proyek secara asinkron di latar belakang tanpa menutup Neovim (pemicu: `<leader>tc`).
*   ### [package-info.nvim](https://github.com/vuki656/package-info.nvim)
    *   **Fungsi:** Menampilkan visual informasi versi terpasang vs versi terbaru npm di samping baris dependensi file `package.json`, lengkap dengan menu interaktif untuk upgrade/delete/install paket.
*   ### [chezmoi.vim](https://github.com/alker0/chezmoi.vim)
    *   **Fungsi:** Integrasi pengerjaan dotfiles yang dikelola oleh `chezmoi`. Menyelesaikan nama file terenkripsi/terkompresi chezmoi secara otomatis agar Neovim dapat mewarnai file tersebut dengan benar.
*   ### [emmet.lua](file:///home/arias/.config/kickstart.nvim/lua/custom/plugins/emmet.lua) (Modul Setup LSP)
    *   **Fungsi:** Walau dikonfigurasi secara manual, `emmet_language_server` (terpasang via Mason) memotong pengetikan HTML/CSS/JSX dengan singkatan Emmet berkecepatan tinggi.
*   ### [live-preview.nvim](https://github.com/brianhuster/live-preview.nvim)
    *   **Fungsi:** Memungkinkan pratinjau langsung file Markdown dan HTML secara dinamis di peramban (browser) web default, lengkap dengan sinkronisasi gulir layar (*sync scroll*).

---

## 8. Perilaku Editor & Utilitas Cerdas (8 Plugin)

Plugin yang memodifikasi atau menambah fitur penyuntingan standar Neovim agar lebih modern.

*   ### [yanky.nvim](https://github.com/gbprod/yanky.nvim)
    *   **Fungsi:** Pengelola memori klipbor (*yank ring*). Menyimpan riwayat teks yang disalin hingga 100 entri, dapat diputar siklusnya setelah ditempel dengan `<C-p>` / `<C-n>`, serta terintegrasi visual dengan Telescope (`<leader>sy`).
*   ### [undotree](https://github.com/mbbill/undotree)
    *   **Fungsi:** Memvisualisasikan pohon riwayat perubahan buffer (*undo history*) secara non-linear dalam bentuk panel diagram samping layar (pemicu: `<leader>ut`).
*   ### [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
    *   **Fungsi:** Menampilkan tanda garis hijau/kuning/merah di margin samping editor untuk menunjukkan baris kode yang ditambah/diubah/dihapus dibandingkan dengan repositori Git, serta navigasi antar hunk.
*   ### [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
    *   **Fungsi:** Menelusuri seluruh baris komentar bertanda khusus (`TODO`, `FIXME`, `BUG`) dalam proyek dan menampilkannya di panel interaktif Telescope.
*   ### [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim)
    *   **Fungsi:** Melatih memori otot Anda agar menggunakan gerakan Vim yang efisien (seperti melarang penekanan berulang-ulang tombol `h`/`j`/`k`/`l` or menyarankan pemakaian tombol pintas yang lebih optimal).
*   ### [nui.nvim](https://github.com/MunifTanjim/nui.nvim)
    *   **Fungsi:** (Terduplikasi di lockfile sebagai dependensi) Library UI komponen modular yang krusial untuk package-info dan plugin dialog lainnya.
*   ### [leetcode.nvim](https://github.com/kawre/leetcode.nvim)
    *   **Fungsi:** Memungkinkan penyelesaian soal-soal LeetCode langsung di dalam Neovim. Menyediakan dasbor interaktif, pewarnaan deskripsi soal yang rapi (menggunakan Tree-sitter HTML), statistik profil, serta perintah `:Leet` untuk navigasi, pengujian (`:Leet run`), dan pengumpulan jawaban (`:Leet submit`).
*   ### [mini.operators] (Modul dari mini.nvim)
    *   **Fungsi:** Menyediakan operator baru untuk mengedit teks secara efisien: `g=` (evaluate), `gx` (exchange/tukar posisi teks), `gm` (multiply/duplikasi teks), `gr` (replace dengan register), dan `gs` (sort/urutkan teks). Mendukung dot-repeat dan hitungan `[count]`.

---

## 9. Estetika & Antarmuka UI (5 Plugin)

Plugin yang menentukan keindahan visual editor, palet warna, dan tata letak jendela.

*   ### [edgy.nvim](https://github.com/folke/edgy.nvim)
    *   **Fungsi:** Pengatur tata letak jendela tepi (edgebar). Merapikan penempatan panel bantuan `:help`, `undotree`, dan daftar `quickfix` di tepi layar secara konsisten tanpa mengacaukan split editor utama Anda.
*   ### [fidget.nvim](https://github.com/j-hui/fidget.nvim)
    *   **Fungsi:** (Terduplikasi sebagai visualizer kemajuan LSP) Menyajikan notifikasi mengambang yang halus di pojok kanan bawah.
*   ### [mini.icons] (Modul dari mini.nvim)
    *   **Fungsi:** Menyediakan ikon grafis modern untuk file, folder, dan symbol jika Anda menggunakan Nerd Font.
*   ### [mini.indentscope] (Modul dari mini.nvim)
    *   **Fungsi:** Menampilkan garis vertikal dinamis dan animasi penunjuk ruang lingkup indentasi (*indent scope*) aktif saat ini secara cerdas.
*   ### [mini.starter] (Modul dari mini.nvim)
    *   **Fungsi:** Menyediakan halaman awal (start screen) interaktif yang indah saat membuka Neovim kosong tanpa nama file.
*   ### [git-signs-highlights] (Integrasi Gitsigns)
    *   **Fungsi:** Memberikan warna highlight halus pada nomor baris di samping kiri layar yang mengalami perubahan git.

---

## 10. Rekomendasi Modul Masa Depan (Rencana Pemasangan Selanjutnya)

Berikut adalah modul-modul dari pustaka `mini.nvim` (yang sudah terpasang di sistem Anda) yang direkomendasikan untuk diaktifkan di masa depan untuk meningkatkan produktivitas pengeditan teks:

*   ### [mini.splitjoin](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-splitjoin.md)
    *   **Fungsi:** Pemisah dan penggabung argumen, array, objek, atau tag HTML.
    *   **Cara Pakai (Masa Depan):** 
        *   Tekan `gS` pada objek satu baris untuk memisahnya menjadi baris vertikal.
        *   Tekan `gJ` untuk menggabungkannya kembali menjadi baris tunggal horizontal.
    *   **Cara Aktivasi:** Tambahkan `require('mini.splitjoin').setup()` di dalam `init.lua`.
*   ### [mini.align](https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-align.md)
    *   **Fungsi:** Penyelaras teks secara visual berdasarkan karakter tertentu (seperti `=`, `:`, `,`).
    *   **Cara Pakai (Masa Depan):** Blok beberapa baris menggunakan Visual Mode (`v` atau `V`), tekan `ga` lalu ketik karakter perata (misal `=` untuk menyejajarkan tanda sama dengan pada variabel).
    *   **Cara Aktivasi:** Tambahkan `require('mini.align').setup()` di dalam `init.lua`.

---

*Terakhir diperbarui: 15 Juli 2026*
