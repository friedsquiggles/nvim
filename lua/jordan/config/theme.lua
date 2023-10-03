local transparent_background = false
local clear = {}

return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
      background = { light = "latte", dark = "mocha" },
      dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
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
        gitgutter = true,
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
        -- telescope = { enabled = true, style = "nvchad" },
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
          local cp = require("jordan.colors")
          return {
            -- For base configs
            NormalFloat = { fg = cp.text, bg = cp.mantle },
            FloatBorder = {
              fg = transparent_background and cp.blue or cp.mantle,
              bg = transparent_background or cp.mantle,
            },
            CursorLineNr = { fg = cp.green, bg = cp.mantle },
            TabLineSel = { bg = cp.pink },

            -- barbar
            -- tabpage
            BufferTabpageFill = { bg = cp.none },

            -- barbar
            -- current
            BufferCurrent = { fg = cp.text, bg = cp.overlay1 },
            BufferCurrentIndex = { fg = cp.text, bg = cp.overlay1 },
            BufferCurrentMod = { fg = cp.peach, bg = cp.overlay1 },
            BufferCurrentSign = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentHINT = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentINFO = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentWARN = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentERROR = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentADDED = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentCHANGED = { fg = cp.subtext0, bg = cp.overlay1 },
            BufferCurrentDELETED = { fg = cp.subtext0, bg = cp.overlay1 },

            -- barbar
            -- inactive
            BufferInactive = { fg = cp.subtext0 },
            BufferInactiveIndex = { fg = cp.subtext0 },
            BufferInactiveMod = { fg = cp.peach },
            BufferInactiveSign = { fg = cp.subtext0 },

            -- barbar
            -- visible
            BufferVisible = { fg = cp.subtext0 },
            BufferVisibleIndex = { fg = cp.subtext0 },
            BufferVisibleMod = { fg = cp.peach },
            BufferVisibleSign = { fg = cp.subtext0 },

            -- LSP
            LspInfoBorder = { link = "FloatBorder" },

            -- For mason
            MasonNormal = { link = "NormalFloat" },

            MiniTrailspace = { bg = cp.yellow },

            -- For nvim-cmp and wilder.nvim
            Pmenu = { fg = cp.overlay2, bg = transparent_background or cp.base },
            PmenuBorder = { fg = cp.surface1, bg = transparent_background or cp.base },
            PmenuSel = { bg = cp.green, fg = cp.base },
            CmpItemAbbr = { fg = cp.overlay2 },
            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            CmpDoc = { link = "NormalFloat" },
            CmpDocBorder = {
              fg = transparent_background and cp.surface1 or cp.mantle,
              bg = transparent_background or cp.mantle,
            },

            -- For fidget
            FidgetTask = { fg = cp.surface2 },
            FidgetTitle = { fg = cp.blue, style = { "bold" } },

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
            TroubleNormal = { bg = transparent_background or cp.base },

            -- For telescope.nvim
            TelescopeMatching = { fg = cp.lavender },
            TelescopeBorder = { fg = cp.peach },
            TelescopePromptBorder = { fg = cp.peach },
            TelescopeResultsDiffAdd = { fg = cp.green },
            TelescopeResultsDiffChange = { fg = cp.yellow },
            TelescopeResultsDiffDelete = { fg = cp.red },
          }
        end,
      },
    })
    vim.cmd([[colorscheme catppuccin]])
  end,
}
