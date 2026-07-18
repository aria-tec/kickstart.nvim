-- heirline.lua
-- Configures heirline.nvim statusline for Kickstart Neovim using custom colors.

vim.pack.add { 'https://github.com/rebelot/heirline.nvim' }

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

-- Definisi Palet Warna Kustom Pengguna
local colors = {
  ["bg-main"] = "#0d0e1c",
  ["bg-dim"] = "#1d2235",
  ["fg-main"] = "#ffffff",
  ["fg-dim"] = "#989898",
  ["fg-alt"] = "#c6daff",
  ["bg-active"] = "#4a4f69",
  ["bg-inactive"] = "#2b3045",
  ["border"] = "#61647a",
  ["red"] = "#ff5f59",
  ["red-warmer"] = "#ff6b55",
  ["red-cooler"] = "#ff7f86",
  ["red-faint"] = "#ef8386",
  ["red-intense"] = "#ff5f5f",
  ["green"] = "#44bc44",
  ["green-warmer"] = "#75c13e",
  ["green-cooler"] = "#11c777",
  ["green-faint"] = "#88ca9f",
  ["green-intense"] = "#44df44",
  ["yellow"] = "#d0bc00",
  ["yellow-warmer"] = "#fec43f",
  ["yellow-cooler"] = "#dfaf7a",
  ["yellow-faint"] = "#d2b580",
  ["yellow-intense"] = "#efef00",
  ["blue"] = "#2fafff",
  ["blue-warmer"] = "#79a8ff",
  ["blue-cooler"] = "#00bcff",
  ["blue-faint"] = "#82b0ec",
  ["blue-intense"] = "#338fff",
  ["magenta"] = "#feacd0",
  ["magenta-warmer"] = "#f78fe7",
  ["magenta-cooler"] = "#b6a0ff",
  ["magenta-faint"] = "#caa6df",
  ["magenta-intense"] = "#ff66ff",
  ["cyan"] = "#00d3d0",
  ["cyan-warmer"] = "#4ae2f0",
  ["cyan-cooler"] = "#6ae4b9",
  ["cyan-faint"] = "#9ac8e0",
  ["cyan-intense"] = "#00eff0",
  ["rust"] = "#db7b5f",
  ["gold"] = "#c0965b",
  ["olive"] = "#9cbd6f",
  ["slate"] = "#76afbf",
  ["indigo"] = "#9099d9",
  ["maroon"] = "#cf7fa7",
  ["pink"] = "#d09dc0",
  ["bg-red-intense"] = "#9d1f1f",
  ["bg-green-intense"] = "#2f822f",
  ["bg-yellow-intense"] = "#7a6100",
  ["bg-blue-intense"] = "#1640b0",
  ["bg-magenta-intense"] = "#7030af",
  ["bg-cyan-intense"] = "#2266ae",
  ["bg-red-subtle"] = "#620f2a",
  ["bg-green-subtle"] = "#00422a",
  ["bg-yellow-subtle"] = "#4a4000",
  ["bg-blue-subtle"] = "#242679",
  ["bg-magenta-subtle"] = "#552f5f",
  ["bg-cyan-subtle"] = "#004065",
  ["bg-red-nuanced"] = "#3a0c14",
  ["bg-green-nuanced"] = "#092f1f",
  ["bg-yellow-nuanced"] = "#381d0f",
  ["bg-blue-nuanced"] = "#12154a",
  ["bg-magenta-nuanced"] = "#2f0c3f",
  ["bg-cyan-nuanced"] = "#042837",
  ["bg-clay"] = "#49191a",
  ["fg-clay"] = "#f1b090",
  ["bg-ochre"] = "#462f20",
  ["fg-ochre"] = "#e0d09c",
  ["bg-lavender"] = "#38325c",
  ["fg-lavender"] = "#dfc0f0",
  ["bg-sage"] = "#143e32",
  ["fg-sage"] = "#c3e7d4",
  ["bg-graph-red-0"] = "#b52c2c",
  ["bg-graph-red-1"] = "#702020",
  ["bg-graph-green-0"] = "#0fed00",
  ["bg-graph-green-1"] = "#007800",
  ["bg-graph-yellow-0"] = "#f1e00a",
  ["bg-graph-yellow-1"] = "#b08940",
  ["bg-graph-blue-0"] = "#2fafef",
  ["bg-graph-blue-1"] = "#1f2f8f",
  ["bg-graph-magenta-0"] = "#bf94fe",
  ["bg-graph-magenta-1"] = "#5f509f",
  ["bg-graph-cyan-0"] = "#47dfea",
  ["bg-graph-cyan-1"] = "#00808f",
  ["bg-completion"] = "#483d8a",
  ["bg-hover"] = "#45605e",
  ["bg-hover-secondary"] = "#64404f",
  ["bg-hl-line"] = "#303a6f",
  ["bg-region"] = "#555a66",
  ["fg-region"] = "#ffffff",
  ["bg-mode-line-active"] = "#484d67",
  ["fg-mode-line-active"] = "#ffffff",
  ["border-mode-line-active"] = "#979797",
  ["bg-mode-line-inactive"] = "#292d48",
  ["fg-mode-line-inactive"] = "#969696",
  ["border-mode-line-inactive"] = "#606270",
  ["modeline-err"] = "#ffa9bf",
  ["modeline-warning"] = "#dfcf43",
  ["modeline-info"] = "#9fefff",
  ["bg-tab-bar"] = "#2c3045",
  ["bg-tab-current"] = "#0d0e1c",
  ["bg-tab-other"] = "#4a4f6a",
  ["bg-added"] = "#003a2f",
  ["bg-added-faint"] = "#002922",
  ["bg-added-refine"] = "#035542",
  ["bg-added-fringe"] = "#23884f",
  ["fg-added"] = "#a0e0a0",
  ["fg-added-intense"] = "#80e080",
  ["bg-changed"] = "#363300",
  ["bg-changed-faint"] = "#2a1f00",
  ["bg-changed-refine"] = "#4a4a00",
  ["bg-changed-fringe"] = "#8f7a30",
  ["fg-changed"] = "#efef80",
  ["fg-changed-intense"] = "#c0b05f",
  ["bg-removed"] = "#4f1127",
  ["bg-removed-faint"] = "#380a19",
  ["bg-removed-refine"] = "#781a3a",
  ["bg-removed-fringe"] = "#b81a26",
  ["fg-removed"] = "#ffbfbf",
  ["fg-removed-intense"] = "#ff9095",
  ["bg-diff-context"] = "#1a1f30",
  ["bg-paren-match"] = "#4f7f9f",
  ["bg-paren-expression"] = "#453040",
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

-- 5. LSP Active Server Names
local LSPActive = {
  condition = conditions.lsp_attached,
  update = { 'LspAttach', 'LspDetach', 'BufEnter' },
  provider = function()
    local names = {}
    for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
      table.insert(names, server.name)
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
