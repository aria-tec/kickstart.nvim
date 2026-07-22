-- heirline.lua
-- Configures heirline.nvim statusline for Kickstart Neovim using custom colors.

vim.pack.add { 'https://github.com/rebelot/heirline.nvim' }

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- Definisi Palet Warna Kustom Pengguna
local colors = {
  ["bg-main"] = "#3f3f3f",
  ["bg-dim"] = "#2e3330",
  ["fg-main"] = "#dcdccc",
  ["fg-dim"] = "#9fafaf",
  ["fg-alt"] = "#d0d0b8",
  ["bg-active"] = "#5f5f5f",
  ["bg-inactive"] = "#2b2b2b",
  ["border"] = "#688060",
  ["red"] = "#dca3a3",
  ["red-warmer"] = "#e89393",
  ["red-cooler"] = "#ecbcbc",
  ["red-faint"] = "#bc6c4c",
  ["red-intense"] = "#ff5f5f",
  ["green"] = "#7f9f7f",
  ["green-warmer"] = "#88b090",
  ["green-cooler"] = "#93b3a3",
  ["green-faint"] = "#709080",
  ["green-intense"] = "#8cd0d3",
  ["yellow"] = "#f0dfaf",
  ["yellow-warmer"] = "#ffcfaf",
  ["yellow-cooler"] = "#e3ceab",
  ["yellow-faint"] = "#d2d39b",
  ["yellow-intense"] = "#efef8f",
  ["blue"] = "#8cd0d3",
  ["blue-warmer"] = "#9fafaf",
  ["blue-cooler"] = "#93e0e3",
  ["blue-faint"] = "#82a282",
  ["blue-intense"] = "#385f38",
  ["magenta"] = "#dc8cc3",
  ["magenta-warmer"] = "#cfbfaf",
  ["magenta-cooler"] = "#bca3a3",
  ["magenta-faint"] = "#c3bf9f",
  ["magenta-intense"] = "#ecbcbc",
  ["cyan"] = "#93e0e3",
  ["cyan-warmer"] = "#8cd0d3",
  ["cyan-cooler"] = "#9fafaf",
  ["cyan-faint"] = "#93b3a3",
  ["cyan-intense"] = "#93e0e3",
  ["rust"] = "#dfaf8f",
  ["gold"] = "#d0bf8f",
  ["olive"] = "#7f9f7f",
  ["slate"] = "#9fafaf",
  ["indigo"] = "#8cd0d3",
  ["maroon"] = "#dca3a3",
  ["pink"] = "#dc8cc3",
  ["bg-red-intense"] = "#702020",
  ["bg-green-intense"] = "#313c36",
  ["bg-yellow-intense"] = "#464646",
  ["bg-blue-intense"] = "#3f4040",
  ["bg-magenta-intense"] = "#484848",
  ["bg-cyan-intense"] = "#385f38",
  ["bg-red-subtle"] = "#463838",
  ["bg-green-subtle"] = "#313c36",
  ["bg-yellow-subtle"] = "#444438",
  ["bg-blue-subtle"] = "#33383a",
  ["bg-magenta-subtle"] = "#443844",
  ["bg-cyan-subtle"] = "#384444",
  ["bg-red-nuanced"] = "#3a2a2a",
  ["bg-green-nuanced"] = "#2e3832",
  ["bg-yellow-nuanced"] = "#38362e",
  ["bg-blue-nuanced"] = "#2e3238",
  ["bg-magenta-nuanced"] = "#382e38",
  ["bg-cyan-nuanced"] = "#2e3838",
  ["bg-clay"] = "#49393a",
  ["fg-clay"] = "#f1b090",
  ["bg-ochre"] = "#463f20",
  ["fg-ochre"] = "#e0d09c",
  ["bg-lavender"] = "#38324c",
  ["fg-lavender"] = "#dfc0f0",
  ["bg-sage"] = "#2e3e32",
  ["fg-sage"] = "#c3e7d4",
  ["bg-graph-red-0"] = "#dca3a3",
  ["bg-graph-red-1"] = "#702020",
  ["bg-graph-green-0"] = "#7f9f7f",
  ["bg-graph-green-1"] = "#313c36",
  ["bg-graph-yellow-0"] = "#f0dfaf",
  ["bg-graph-yellow-1"] = "#8f7a30",
  ["bg-graph-blue-0"] = "#8cd0d3",
  ["bg-graph-blue-1"] = "#385f38",
  ["bg-graph-magenta-0"] = "#dc8cc3",
  ["bg-graph-magenta-1"] = "#5f507f",
  ["bg-graph-cyan-0"] = "#93e0e3",
  ["bg-graph-cyan-1"] = "#284f28",
  ["bg-completion"] = "#4f4f4f",
  ["bg-hover"] = "#4f4f4f",
  ["bg-hover-secondary"] = "#4a3f3f",
  ["bg-hl-line"] = "#434443",
  ["bg-region"] = "#5f5f5f",
  ["fg-region"] = "#dcdccc",
  ["bg-mode-line-active"] = "#2e3330",
  ["fg-mode-line-active"] = "#ccdc90",
  ["border-mode-line-active"] = "#688060",
  ["bg-mode-line-inactive"] = "#262626",
  ["fg-mode-line-inactive"] = "#88b090",
  ["border-mode-line-inactive"] = "#3f4040",
  ["modeline-err"] = "#dca3a3",
  ["modeline-warning"] = "#f0dfaf",
  ["modeline-info"] = "#8cd0d3",
  ["bg-tab-bar"] = "#222222",
  ["bg-tab-current"] = "#3f3f3f",
  ["bg-tab-other"] = "#313633",
  ["bg-added"] = "#313c36",
  ["bg-added-faint"] = "#26302a",
  ["bg-added-refine"] = "#384a40",
  ["bg-added-fringe"] = "#709080",
  ["fg-added"] = "#709080",
  ["fg-added-intense"] = "#7f9f7f",
  ["bg-changed"] = "#333333",
  ["bg-changed-faint"] = "#2a2a20",
  ["bg-changed-refine"] = "#4a4a30",
  ["bg-changed-fringe"] = "#8f7a30",
  ["fg-changed"] = "#f0dfaf",
  ["fg-changed-intense"] = "#ffcfaf",
  ["bg-removed"] = "#464646",
  ["bg-removed-faint"] = "#382a2a",
  ["bg-removed-refine"] = "#583a3a",
  ["bg-removed-fringe"] = "#b85a5a",
  ["fg-removed"] = "#dca3a3",
  ["fg-removed-intense"] = "#e89393",
  ["bg-diff-context"] = "#2e3330",
  ["bg-paren-match"] = "#385f38",
  ["bg-paren-expression"] = "#453840",
}

-- Aliases dari palet warna
colors.cursor = colors["magenta-intense"]
colors.keybind = colors["magenta-cooler"]
colors.name = colors["magenta"]
colors.identifier = colors["yellow-faint"]
colors.err = colors.red
colors.warning = colors.yellow
colors.info = colors["green-cooler"]
colors["underline-err"] = colors["red-intense"]
colors["underline-warning"] = colors.yellow
colors["underline-note"] = colors.cyan
colors["bg-prominent-err"] = colors["bg-red-intense"]
colors["fg-prominent-err"] = colors["fg-main"]
colors["bg-prominent-warning"] = colors["bg-yellow-intense"]
colors["fg-prominent-warning"] = colors["fg-main"]
colors["bg-prominent-note"] = colors["bg-cyan-intense"]
colors["fg-prominent-note"] = colors["fg-main"]
colors["bg-active-argument"] = colors["bg-yellow-nuanced"]
colors["fg-active-argument"] = colors["yellow-cooler"]
colors["bg-active-value"] = colors["bg-cyan-nuanced"]
colors["fg-active-value"] = colors["cyan-cooler"]
colors.builtin = colors.magenta
colors.comment = colors["red-faint"]
colors.constant = colors["magenta-cooler"]
colors.docstring = colors["cyan-faint"]
colors.fnname = colors["magenta-warmer"]
colors.keyword = colors["blue-warmer"]
colors.preprocessor = colors["red-cooler"]
colors.property = colors["cyan-warmer"]
colors["rx-backslash"] = colors["magenta-warmer"]
colors["rx-construct"] = colors["magenta-cooler"]
colors.string = colors.blue
colors.type = colors["green-cooler"]
colors.variable = colors["cyan-warmer"]
colors["accent-0"] = colors["magenta-cooler"]
colors["accent-1"] = colors.cyan
colors["accent-2"] = colors["magenta-warmer"]
colors["accent-3"] = colors["yellow-warmer"]
colors["fg-button-active"] = colors["fg-main"]
colors["fg-button-inactive"] = colors["fg-dim"]
colors["bg-button-active"] = colors["bg-active"]
colors["bg-button-inactive"] = colors["bg-dim"]
colors["fg-completion-match-0"] = colors["blue-cooler"]
colors["fg-completion-match-1"] = colors["magenta-warmer"]
colors["fg-completion-match-2"] = colors["cyan-cooler"]
colors["fg-completion-match-3"] = colors.yellow
colors["date-common"] = colors.cyan
colors["date-deadline"] = colors["red-cooler"]
colors["date-deadline-subtle"] = colors["red-faint"]
colors["date-event"] = colors["fg-alt"]
colors["date-holiday"] = colors["magenta-warmer"]
colors["date-holiday-other"] = colors.blue
colors["date-now"] = colors["fg-main"]
colors["date-range"] = colors["fg-alt"]
colors["date-scheduled"] = colors["yellow-cooler"]
colors["date-scheduled-subtle"] = colors["yellow-faint"]
colors["date-weekday"] = colors.cyan
colors["date-weekend"] = colors.magenta
colors["fg-link"] = colors["blue-warmer"]
colors["underline-link"] = colors["blue-warmer"]
colors["fg-link-symbolic"] = colors.cyan
colors["underline-link-symbolic"] = colors.cyan
colors["fg-link-visited"] = colors.magenta
colors["underline-link-visited"] = colors.magenta
colors["mail-cite-0"] = colors["blue-faint"]
colors["mail-cite-1"] = colors["yellow-cooler"]
colors["mail-cite-2"] = colors["cyan-cooler"]
colors["mail-cite-3"] = colors["red-cooler"]
colors["mail-part"] = colors.blue
colors["mail-recipient"] = colors["blue-warmer"]
colors["mail-subject"] = colors["magenta-warmer"]
colors["mail-other"] = colors.magenta
colors["bg-mark-delete"] = colors["bg-red-subtle"]
colors["fg-mark-delete"] = colors["red-cooler"]
colors["bg-mark-select"] = colors["bg-cyan-subtle"]
colors["fg-mark-select"] = colors.cyan
colors["bg-mark-other"] = colors["bg-yellow-subtle"]
colors["fg-mark-other"] = colors.yellow
colors["fg-prompt"] = colors["cyan-warmer"]
colors["fg-prose-code"] = colors["cyan-cooler"]
colors["fg-prose-macro"] = colors["magenta-cooler"]
colors["fg-prose-verbatim"] = colors["magenta-warmer"]
colors["prose-done"] = colors.green
colors["prose-todo"] = colors.red
colors["prose-metadata"] = colors["fg-dim"]
colors["prose-metadata-value"] = colors["fg-alt"]
colors["prose-table"] = colors["fg-alt"]
colors["prose-table-formula"] = colors["magenta-warmer"]
colors["prose-tag"] = colors["magenta-faint"]
colors["rainbow-0"] = colors["fg-main"]
colors["rainbow-1"] = colors["magenta-intense"]
colors["rainbow-2"] = colors["cyan-intense"]
colors["rainbow-3"] = colors["red-warmer"]
colors["rainbow-4"] = colors["yellow-intense"]
colors["rainbow-5"] = colors["magenta-cooler"]
colors["rainbow-6"] = colors["green-intense"]
colors["rainbow-7"] = colors["blue-warmer"]
colors["rainbow-8"] = colors["magenta-warmer"]
colors["bg-search-current"] = colors["bg-yellow-intense"]
colors["bg-search-lazy"] = colors["bg-cyan-intense"]
colors["bg-search-replace"] = colors["bg-red-intense"]
colors["bg-search-rx-group-0"] = colors["bg-blue-intense"]
colors["bg-search-rx-group-1"] = colors["bg-green-intense"]
colors["bg-search-rx-group-2"] = colors["bg-red-subtle"]
colors["bg-search-rx-group-3"] = colors["bg-magenta-subtle"]
colors["fg-heading-0"] = colors["cyan-cooler"]
colors["fg-heading-1"] = colors["fg-main"]
colors["fg-heading-2"] = colors["yellow-faint"]
colors["fg-heading-3"] = colors["blue-faint"]
colors["fg-heading-4"] = colors.magenta
colors["fg-heading-5"] = colors["green-faint"]
colors["fg-heading-6"] = colors["red-faint"]
colors["fg-heading-7"] = colors["cyan-faint"]
colors["fg-heading-8"] = colors["fg-dim"]
colors.fringe = colors["bg-dim"]
colors.bracket = colors["fg-main"]
colors.delimiter = colors["fg-main"]
colors.docmarkup = colors["magenta-faint"]
colors.number = colors["fg-main"]
colors.operator = colors["fg-main"]
colors.punctuation = colors["fg-main"]
colors["date-now"] = colors["fg-main"]
colors["fg-line-number-inactive"] = colors["fg-dim"]
colors["fg-line-number-active"] = colors["fg-main"]
colors["bg-line-number-inactive"] = colors["bg-dim"]
colors["bg-line-number-active"] = colors["bg-active"]
colors["fg-paren-match"] = colors["fg-main"]
colors["bg-prose-block-delimiter"] = colors["bg-dim"]
colors["fg-prose-block-delimiter"] = colors["fg-dim"]
colors["bg-prose-block-contents"] = colors["bg-dim"]
colors["fg-space"] = colors.border
colors["bg-space-err"] = colors["bg-red-intense"]

-- Load colors
require("heirline").load_colors(colors)

-- Common spacer and dividers
local Space = { provider = " " }
local Align = { provider = "%=" }

-- 1. ViMode Indicator
local ViMode = {
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
  static = {
    mode_names = {
      n = "NORMAL",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "NORMAL",
      niR = "NORMAL",
      niV = "NORMAL",
      nt = "NORMAL",
      v = "VISUAL",
      vs = "VISUAL",
      V = "V-LINE",
      Vs = "V-LINE",
      ["\22"] = "V-BLOCK",
      ["\22s"] = "V-BLOCK",
      s = "SELECT",
      S = "S-LINE",
      ["\19"] = "S-BLOCK",
      i = "INSERT",
      ic = "INSERT",
      ix = "INSERT",
      R = "REPLACE",
      Rc = "REPLACE",
      Rx = "REPLACE",
      Rv = "V-REPLACE",
      Rvc = "V-REPLACE",
      Rvx = "V-REPLACE",
      c = "COMMAND",
      cv = "EX",
      r = "PROMPT",
      rm = "MORE",
      ["r?"] = "CONFIRM",
      ["!"] = "SHELL",
      t = "TERMINAL",
    },
    mode_colors = {
      n = "red",
      i = "green",
      v = "cyan",
      V = "cyan",
      ["\22"] = "cyan",
      c = "yellow-warmer",
      s = "magenta-cooler",
      S = "magenta-cooler",
      ["\19"] = "magenta-cooler",
      R = "yellow-warmer",
      r = "yellow-warmer",
      ["!"] = "red",
      t = "red-cooler",
    }
  },
  provider = function(self)
    return "  " .. (self.mode_names[self.mode] or self.mode) .. " "
  end,
  hl = function(self)
    local mode = self.mode:sub(1, 1)
    return { fg = self.mode_colors[mode] or "red", bold = true }
  end,
  update = {
    "ModeChanged",
    pattern = "*:*",
    callback = vim.schedule_wrap(function()
      vim.cmd("redrawstatus")
    end),
  },
}

-- 2. File Name Block (Path, Icon, Flags)
local FileNameBlock = {
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end
}

local FileName = {
  provider = function(self)
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then return "[No Name]" end
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = "fg-main" },
}

local FileFlags = {
  {
    condition = function()
      return vim.bo.modified
    end,
    provider = " [+]",
    hl = { fg = "green" },
  },
  {
    condition = function()
      return not vim.bo.modifiable or vim.bo.readonly
    end,
    provider = " ",
    hl = { fg = "orange" },
  },
}

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      return { fg = "cyan", bold = true, force = true }
    end
  end,
}

FileNameBlock = utils.insert(FileNameBlock,
  FileIcon,
  utils.insert(FileNameModifer, FileName),
  FileFlags,
  { provider = "%<" }
)

-- 3. Git Status
local Git = {
  condition = conditions.is_git_repo,
  init = function(self)
    self.status_dict = vim.b.gitsigns_status_dict
    self.has_changes = self.status_dict and (
      (self.status_dict.added and self.status_dict.added ~= 0) or
      (self.status_dict.removed and self.status_dict.removed ~= 0) or
      (self.status_dict.changed and self.status_dict.changed ~= 0)
    )
  end,
  hl = { fg = "orange" },
  {
    provider = function(self)
      return "  " .. (self.status_dict and self.status_dict.head or "")
    end,
    hl = { bold = true }
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = " ("
  },
  {
    provider = function(self)
      local count = self.status_dict.added or 0
      return count > 0 and ("+" .. count)
    end,
    hl = { fg = "fg-added" },
  },
  {
    provider = function(self)
      local count = self.status_dict.removed or 0
      return count > 0 and ("-" .. count)
    end,
    hl = { fg = "fg-removed" },
  },
  {
    provider = function(self)
      local count = self.status_dict.changed or 0
      return count > 0 and ("~" .. count)
    end,
    hl = { fg = "fg-changed" },
  },
  {
    condition = function(self)
      return self.has_changes
    end,
    provider = ")",
  },
}

-- 4. Diagnostics
local Diagnostics = {
  condition = conditions.has_diagnostics,
  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  end,
  update = { "DiagnosticChanged", "BufEnter" },
  hl = { fg = "fg-dim" },
  { provider = " (" },
  {
    provider = function(self)
      return self.errors > 0 and (" " .. self.errors .. " ")
    end,
    hl = { fg = "red" },
  },
  {
    provider = function(self)
      return self.warnings > 0 and (" " .. self.warnings .. " ")
    end,
    hl = { fg = "yellow" },
  },
  {
    provider = function(self)
      return self.info > 0 and ("󰋇 " .. self.info .. " ")
    end,
    hl = { fg = "green-cooler" },
  },
  {
    provider = function(self)
      return self.hints > 0 and ("󰌵 " .. self.hints)
    end,
    hl = { fg = "cyan" },
  },
  { provider = ")" },
}

-- 5. Active Tools (LSP, Formatter, Linter)
local LSPActive = {
  update = { 'LspAttach', 'LspDetach', 'BufEnter', 'BufWritePost' },
  provider = function()
    local names = {}
    local seen = {}

    -- 1. LSP servers
    for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      if not seen[server.name] then
        seen[server.name] = true
        table.insert(names, server.name)
      end
      -- Detect Clippy if rust_analyzer uses clippy for checking
      if server.name == 'rust_analyzer' or server.name == 'rust-analyzer' then
        local settings = (server.config and server.config.settings) or server.settings or {}
        local ra = settings['rust-analyzer'] or settings.rust_analyzer or {}
        local check = ra.check or {}
        if check.command == 'clippy' or check == 'clippy' then
          if not seen['clippy'] then
            seen['clippy'] = true
            table.insert(names, 'clippy')
          end
        end
      end
    end

    -- 2. Formatters (conform.nvim)
    local ok_conform, conform = pcall(require, 'conform')
    if ok_conform then
      local formatters = conform.list_formatters(0)
      for _, fmt in ipairs(formatters) do
        if fmt.available and not seen[fmt.name] then
          seen[fmt.name] = true
          table.insert(names, fmt.name)
        end
      end
    end

    -- 3. Linters (nvim-lint)
    local ok_lint, lint = pcall(require, 'lint')
    if ok_lint then
      local linters = lint.linters_by_ft[vim.bo.filetype]
      if type(linters) == 'table' then
        for _, lnt in ipairs(linters) do
          if not seen[lnt] then
            seen[lnt] = true
            table.insert(names, lnt)
          end
        end
      end
    end

    if #names == 0 then
      return ""
    end
    return " [" .. table.concat(names, " ") .. "]"
  end,
  hl = { fg = "green", bold = true },
}

-- 6. FileType
local FileType = {
  provider = function()
    return " " .. string.upper(vim.bo.filetype) .. " "
  end,
  hl = { fg = "cyan", bold = true },
}

-- 7. Ruler
local Ruler = {
  provider = " %2l:%-2v ",
  hl = { fg = "fg-dim", bold = true },
}

-- 8. ScrollBar
local ScrollBar = {
  static = {
    sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    if lines == 0 then return "" end
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = "blue" },
}

-- Assemble different statuslines
local DefaultStatusline = {
  hl = { bg = "bg-mode-line-active", fg = "fg-mode-line-active" },
  ViMode, Space,
  FileNameBlock, Space,
  Git, Space,
  Diagnostics,
  Align,
  LSPActive, Space,
  FileType,
  Ruler,
  ScrollBar
}

local InactiveStatusline = {
  condition = conditions.is_not_active,
  hl = { bg = "bg-mode-line-inactive", fg = "fg-mode-line-inactive" },
  FileType, Space,
  FileNameBlock,
  Align
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches({
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    })
  end,
  hl = { bg = "bg-mode-line-inactive", fg = "fg-mode-line-inactive" },
  FileType, Space,
  FileNameBlock,
  Align
}

local TerminalStatusline = {
  condition = function()
    return conditions.buffer_matches({ buftype = { "terminal" } })
  end,
  hl = { bg = "dark-red", fg = "fg-main" },
  { condition = conditions.is_active, ViMode, Space },
  FileType, Space,
  FileNameBlock,
  Align
}

local StatusLines = {
  fallthrough = false,
  SpecialStatusline,
  TerminalStatusline,
  InactiveStatusline,
  DefaultStatusline,
}

-- Initialize Heirline
require("heirline").setup({ statusline = StatusLines })
