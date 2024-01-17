return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdLineEnter" },
  dependencies = {
    -- completion types
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",

    -- snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- icons
    "onsails/lspkind.nvim",
  },
  opts = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local defaults = require("cmp.config.default")()

    local t = function(str)
      return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local border = function(hl)
      return {
        { "┌", hl },
        { "─", hl },
        { "┐", hl },
        { "│", hl },
        { "┘", hl },
        { "─", hl },
        { "└", hl },
        { "│", hl },
      }
    end

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({

      enabled = function()
        -- disable for telescope prompts
        local buftype = vim.api.nvim_buf_get_option(0, "buftype")
        if buftype == "prompt" then
          return false
        end

        -- disable when in comments
        local context = require("cmp.config.context")
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        else
          return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        end
      end,

      completion = {
        completeopt = "menu,menuone,noselect,noinsert",
      },

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-w>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif require("luasnip").expand_or_locally_jumpable() then
            vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"))
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp", max_item_count = 5, priority = 1000 },
        { name = "luasnip", max_item_count = 5, priority = 700 },
        { name = "buffer", max_item_count = 3, priority = 500 },
        { name = "path", max_item_count = 5, priority = 200 },
        { name = "emoji", max_item_count = 5, priority = 100 },
      }),

      sorting = defaults.sorting,

      performance = {
        max_view_entries = 15,
      },

      window = {
        completion = {
          border = border("PmenuBorder"),
          winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
          col_offset = -2,
          side_padding = 2,
        },
      },

      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local fopts = { mode = "symbol_text", maxwidth = 50 }
          local kind = lspkind.cmp_format(fopts)(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })

          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },

      cmp.setup.filetype({ "markdown" }, {
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "buffer" },
        }, {
          { name = "emoji" },
        }),
      }),

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git", priority = 600 },
        }, {
          { name = "emoji", priority = 500 },
        }, {
          { name = "buffer", priority = 400 },
        }),
      }),

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      }),
    })
  end,
}
