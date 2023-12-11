return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- Can be one of: latte, frappe, macchiato, mocha
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.2,
      },
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      styles = {
        comments = { "italic" },
        properties = {},
        functions = { "bold" },
        keywords = { "bold", "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        aerial = false,
        alpha = true,
        barbar = true,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dap = { enabled = true, enable_ui = true },
        dashboard = false,
        dropbar = { enabled = false, color_mode = true },
        fern = false,
        fidget = true,
        flash = false,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        headlines = false,
        hop = true,
        illuminate = true,
        indent_blankline = { enabled = false, colored_indent_levels = false },
        leap = false,
        lightspeed = false,
        lsp_saga = true,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        mini = true,
        navic = { enabled = false },
        neogit = false,
        neotest = false,
        neotree = { enabled = false, show_root = true, transparent_panel = false },
        noice = false,
        notify = true,
        nvimtree = true,
        overseer = false,
        pounce = false,
        rainbow_delimiters = true,
        sandwich = false,
        semantic_tokens = true,
        symbols_outline = true,
        telekasten = false,
        telescope = { enabled = true },
        treesitter_context = true,
        ts_rainbow = false,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,
      },
      color_overrides = {},
      highlight_overrides = {
        all = function()
          local mocha = require("catppuccin.palettes").get_palette("mocha")
          local macchiato = require("catppuccin.palettes").get_palette("macchiato")
          local frappe = require("catppuccin.palettes").get_palette("frappe")
          local latte = require("catppuccin.palettes").get_palette("latte")

          local cp = macchiato

          -- todo - clean up manual color definitions
          local dark_green = "#222b36"
          local dark_yellow = "#292d37"
          local dark_red = "#2b273a"

          return {
            -- For base configs
            NormalFloat = { fg = cp.text, bg = cp.mantle },
            FloatBorder = {
              fg = cp.blue or cp.mantle,
              bg = cp.mantle,
            },
            CursorLineNr = { fg = cp.green },
            TabLineSel = { bg = cp.pink },

            -- alpha
            AlphaHeader = { fg = cp.green },
            AlphaButtons = { fg = cp.flamingo },
            AlphaFooter = { fg = cp.blue },

            ColorColumn = { bg = frappe.mantle },

            -- barbar
            -- tabpage
            BufferTabpageFill = { bg = cp.none },

            -- barbar
            -- current buffer
            BufferCurrent = { fg = latte.text, bg = latte.surface2 },
            BufferCurrentIndex = { fg = latte.text, bg = latte.surface2 },
            BufferCurrentMod = { fg = latte.peach, bg = latte.surface2 },
            BufferCurrentSign = { fg = latte.pink, bg = latte.surface2 },
            BufferCurrentSignRight = { fg = latte.pink, bg = latte.surface2 },
            BufferCurrentHINT = { fg = latte.subtext0, bg = latte.surface2 },
            BufferCurrentINFO = { fg = latte.subtext0, bg = latte.surface2 },
            BufferCurrentWARN = { fg = latte.subtext0, bg = latte.surface2 },
            BufferCurrentERROR = { fg = latte.subtext0, bg = latte.surface2 },
            BufferCurrentADDED = { fg = latte.subtext0, bg = latte.surface2 },
            BufferCurrentCHANGED = { fg = latte.subtext0, bg = latte.surface2 },
            BufferCurrentDELETED = { fg = latte.subtext0, bg = latte.surface2 },

            -- barbar
            -- inactive
            BufferInactive = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveIndex = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveMod = { fg = latte.peach, bg = latte.surface0 },
            BufferInactiveSign = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveHINT = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveINFO = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveWARN = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveERROR = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveADDED = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveCHANGED = { fg = latte.subtext0, bg = latte.surface0 },
            BufferInactiveDELETED = { fg = latte.subtext0, bg = latte.surface0 },

            -- barbar
            -- visible
            BufferVisible = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleIndex = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleMod = { fg = latte.peach, bg = latte.surface0 },
            BufferVisibleSign = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleHINT = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleINFO = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleWARN = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleERROR = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleADDED = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleCHANGED = { fg = latte.subtext0, bg = latte.surface0 },
            BufferVisibleDELETED = { fg = latte.subtext0, bg = latte.surface0 },

            -- barbar
            -- alternate
            BufferAlternate = { fg = latte.subtext0 },
            BufferAlternateIndex = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateMod = { fg = latte.peach, bg = latte.surface0 },
            BufferAlternateSign = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateHINT = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateINFO = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateWARN = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateERROR = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateADDED = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateCHANGED = { fg = latte.subtext0, bg = latte.surface0 },
            BufferAlternateDELETED = { fg = latte.subtext0, bg = latte.surface0 },

            -- LSP
            LspInfoBorder = { link = "FloatBorder" },

            -- For mason
            MasonNormal = { link = "NormalFloat" },

            MiniTrailspace = { bg = cp.yellow },

            -- For nvim-cmp and wilder.nvim
            Pmenu = { fg = cp.overlay2, bg = cp.base },
            PmenuBorder = { fg = cp.surface2, bg = cp.base },
            PmenuSel = { bg = frappe.green, fg = cp.base },
            CmpItemAbbr = { fg = cp.overlay2 },
            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            CmpDoc = { link = "NormalFloat" },
            CmpDocBorder = {
              fg = cp.surface1 or cp.mantle,
              bg = cp.mantle,
            },

            CmpItemMenu = { fg = cp.mauve, italic = true },

            CmpItemKindSnippet = { fg = cp.base, bg = cp.mauve },
            CmpItemKindKeyword = { fg = cp.base, bg = cp.red },
            CmpItemKindText = { fg = cp.base, bg = cp.teal },
            CmpItemKindMethod = { fg = cp.base, bg = cp.blue },
            CmpItemKindConstructor = { fg = cp.base, bg = cp.blue },
            CmpItemKindFunction = { fg = cp.base, bg = cp.blue },
            CmpItemKindFolder = { fg = cp.base, bg = cp.blue },
            CmpItemKindModule = { fg = cp.base, bg = cp.blue },
            CmpItemKindConstant = { fg = cp.base, bg = cp.peach },
            CmpItemKindField = { fg = cp.base, bg = cp.green },
            CmpItemKindProperty = { fg = cp.base, bg = cp.green },
            CmpItemKindEnum = { fg = cp.base, bg = cp.green },
            CmpItemKindUnit = { fg = cp.base, bg = cp.green },
            CmpItemKindClass = { fg = cp.base, bg = cp.yellow },
            CmpItemKindVariable = { fg = cp.base, bg = cp.flamingo },
            CmpItemKindFile = { fg = cp.base, bg = cp.blue },
            CmpItemKindInterface = { fg = cp.base, bg = cp.yellow },
            CmpItemKindColor = { fg = cp.base, bg = cp.red },
            CmpItemKindReference = { fg = cp.base, bg = cp.red },
            CmpItemKindEnumMember = { fg = cp.base, bg = cp.red },
            CmpItemKindStruct = { fg = cp.base, bg = cp.blue },
            CmpItemKindValue = { fg = cp.base, bg = cp.peach },
            CmpItemKindEvent = { fg = cp.base, bg = cp.blue },
            CmpItemKindOperator = { fg = cp.base, bg = cp.blue },
            CmpItemKindTypeParameter = { fg = cp.base, bg = cp.blue },
            CmpItemKindCopilot = { fg = cp.base, bg = cp.teal },

            GitSignsAddLn = { bg = dark_green },
            GitSignsChangeLn = { bg = dark_yellow },
            GitSignsDeleteLn = { bg = dark_red },

            -- Mini
            MiniIndentscopeSymbol = { fg = cp.flamingo },
            MiniIndentscopeSymbolOff = { fg = cp.flamingo },

            -- For nvim-tree
            NvimTreeRootFolder = { fg = cp.pink },
            NvimTreeIndentMarker = { fg = cp.surface2 },
            NvimTreeGitDirty = { fg = cp.yellow },
            NvimTreeGitStaged = { fg = cp.green },
            NvimTreeGitMerge = { fg = cp.maroon },
            NvimTreeGitRenamed = { fg = cp.lavender },
            NvimTreeGitNew = { fg = cp.yellow },
            NvimTreeGitDeleted = { fg = cp.rosewater },

            -- For trouble.nvim
            TroubleNormal = { bg = cp.base },

            -- For telescope.nvim
            TelescopeMatching = { fg = cp.mauve },
            TelescopeBorder = { fg = cp.pink },
            TelescopePromptBorder = { fg = cp.flamingo },
            TelescopeResultsDiffAdd = { fg = cp.green },
            TelescopeResultsDiffChange = { fg = cp.yellow },
            TelescopeResultsDiffDelete = { fg = cp.red },

            -- For which-key
            WhichKey = { fg = cp.yellow },
            -- WhichKeyGroup
            -- WhichKeySeparator
            -- WhichKeyDesc
            -- WhichKeyFloat
            WhichKeyBorder = { fg = cp.sapphire },
            -- WhichKeyValue
          }
        end,
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
