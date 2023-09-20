return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local gen_lspkind_hl = function()
      local colors = require("jordan.colors")
      local dat = {
        Class = colors.yellow,
        Constant = colors.peach,
        Constructor = colors.sapphire,
        Enum = colors.yellow,
        EnumMember = colors.teal,
        Event = colors.yellow,
        Field = colors.teal,
        File = colors.rosewater,
        Function = colors.blue,
        Interface = colors.yellow,
        Key = colors.red,
        Method = colors.blue,
        Module = colors.blue,
        Namespace = colors.blue,
        Number = colors.peach,
        Operator = colors.sky,
        Package = colors.blue,
        Property = colors.teal,
        Struct = colors.yellow,
        TypeParameter = colors.blue,
        Variable = colors.peach,
        Array = colors.peach,
        Boolean = colors.peach,
        Null = colors.yellow,
        Object = colors.yellow,
        String = colors.green,
        TypeAlias = colors.green,
        Parameter = colors.blue,
        StaticMethod = colors.peach,
        Text = colors.green,
        Snippet = colors.mauve,
        Folder = colors.blue,
        Unit = colors.green,
        Value = colors.peach,
      }

      for kind, color in pairs(dat) do
        vim.api.nvim_set_hl(0, "LspKind" .. kind, { fg = color, default = true })
      end
    end

    local icons = {
      diagnostics = require("jordan.icons").get("diagnostics", true),
      kind = require("jordan.icons").get("kind", true),
      type = require("jordan.icons").get("type", true),
      ui = require("jordan.icons").get("ui", true),
    }

    local function set_sidebar_icons()
      -- Set icons for sidebar.
      local diagnostic_icons = {
        Error = icons.diagnostics.Error_alt,
        Warn = icons.diagnostics.Warning_alt,
        Info = icons.diagnostics.Information_alt,
        Hint = icons.diagnostics.Hint_alt,
      }
      for type, icon in pairs(diagnostic_icons) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end
    end

    gen_lspkind_hl()
    set_sidebar_icons()

    require("lspsaga").setup({
      breadcrumbs = {
        enable = true,
        hide_keyword = true,
      },
      symbol_in_winbar = {
        enable = true,
        separator = " " .. icons.ui.DoubleSeparator,
        hide_keyword = false,
        show_file = false,
        folder_level = 1,
        color_mode = true,
        delay = 100,
      },
      code_action = {
        num_shortcut = true,
        only_in_cursor = false,
        show_server_name = true,
        extend_gitsigns = false,
        keys = {
          quit = "q",
          exec = "<CR>",
        },
      },
      lightbulb = {
        enable = false,
        enable_in_insert = true,
        sign = true,
        sign_priority = 40,
        virtual_text = true,
      },
      diagnostic = {
        show_code_action = true,
        jump_num_shortcut = true,
        max_width = 0.5,
        max_height = 0.6,
        text_hl_follow = true,
        border_follow = true,
        extend_relatedInformation = true,
        show_layout = "float",
        show_normal_height = 10,
        max_show_width = 0.9,
        max_show_height = 0.6,
        diagnostic_only_current = false,
        keys = {
          exec_action = "r",
          quit = "q",
          toggle_or_jump = "<CR>",
          quit_in_show = { "q", "<Esc>" },
        },
      },
      ui = {
        border = "single", -- Can be single, double, rounded, solid, shadow.
        devicon = true,
        title = true,
        expand = icons.ui.ArrowClosed,
        collapse = icons.ui.ArrowOpen,
        code_action = icons.ui.CodeAction,
        actionfix = icons.ui.Spell,
        lines = { "┗", "┣", "┃", "━", "┏" },
        imp_sign = icons.kind.Implementation,
        kind = {
          -- Kind
          Class = { icons.kind.Class, "LspKindClass" },
          Constant = { icons.kind.Constant, "LspKindConstant" },
          Constructor = { icons.kind.Constructor, "LspKindConstructor" },
          Enum = { icons.kind.Enum, "LspKindEnum" },
          EnumMember = { icons.kind.EnumMember, "LspKindEnumMember" },
          Event = { icons.kind.Event, "LspKindEvent" },
          Field = { icons.kind.Field, "LspKindField" },
          File = { icons.kind.File, "LspKindFile" },
          Function = { icons.kind.Function, "LspKindFunction" },
          Interface = { icons.kind.Interface, "LspKindInterface" },
          Key = { icons.kind.Keyword, "LspKindKey" },
          Method = { icons.kind.Method, "LspKindMethod" },
          Module = { icons.kind.Module, "LspKindModule" },
          Namespace = { icons.kind.Namespace, "LspKindNamespace" },
          Number = { icons.kind.Number, "LspKindNumber" },
          Operator = { icons.kind.Operator, "LspKindOperator" },
          Package = { icons.kind.Package, "LspKindPackage" },
          Property = { icons.kind.Property, "LspKindProperty" },
          Struct = { icons.kind.Struct, "LspKindStruct" },
          TypeParameter = { icons.kind.TypeParameter, "LspKindTypeParameter" },
          Variable = { icons.kind.Variable, "LspKindVariable" },
          -- Type
          Array = { icons.type.Array, "LspKindArray" },
          Boolean = { icons.type.Boolean, "LspKindBoolean" },
          Null = { icons.type.Null, "LspKindNull" },
          Object = { icons.type.Object, "LspKindObject" },
          String = { icons.type.String, "LspKindString" },
          -- ccls-specific icons.
          TypeAlias = { icons.kind.TypeAlias, "LspKindTypeAlias" },
          Parameter = { icons.kind.Parameter, "LspKindParameter" },
          StaticMethod = { icons.kind.StaticMethod, "LspKindStaticMethod" },
          -- Microsoft-specific icons.
          Text = { icons.kind.Text, "LspKindText" },
          Snippet = { icons.kind.Snippet, "LspKindSnippet" },
          Folder = { icons.kind.Folder, "LspKindFolder" },
          Unit = { icons.kind.Unit, "LspKindUnit" },
          Value = { icons.kind.Value, "LspKindValue" },
        },
      },
      callhierarchy = {
        layout = "float",
        show_detail = false,
        keys = {
          edit = "e",
          vsplit = "v",
          split = "s",
          tabe = "t",
          jump = "o",
          quit = ";",
          expand_collaspe = "u",
        },
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
