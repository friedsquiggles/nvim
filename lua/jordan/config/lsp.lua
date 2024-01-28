return {
  -- LSP Language Server Protocol
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neoconf.nvim",
    "folke/neodev.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "jose-elias-alvarez/typescript.nvim",
  },

  opts = {
    diagnostics = {
      underline = true,
      severity_sort = true,
      autoformat = true,
      virtual_text = { prefix = "icons" },
    },

    servers = {
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            completion = { callSnippet = "Replace" },
            diagnostics = { globals = { "vim" } },
            format = {
              enable = false,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                continuation_indent_size = "2",
              },
            },
            hint = {
              enable = true,
              setType = true,
              arrayIndex = "Disable",
            },
            telemetry = false,
          },
        },
      },

      tsserver = {
        completions = { completeFunctionCalls = true },

        diagnostics = {
          -- "cannot redeclare block-scoped variable" -> useless when applied to JXA
          ignoredCodes = { 2451 },
        },

        typescript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          },
        },

        javascript = {
          inlayHints = {
            includeInlayEnumMemberValueHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayVariableTypeHintsWhenTypeMatchesName = true,
          },
        },
      },

      yamlls = {
        settings = {
          yaml = {
            keyOrdering = false,
          },
        },
      },
    },

    setup = {
      tsserver = function(_, opts)
        require("typescript").setup({ server = opts })
        return true
      end,
      ["*"] = function(server, opts) end,
    },
  },

  config = function(_, opts)
    local servers = opts.servers
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    local function setup(server)
      local server_opts = vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, servers[server] or {})

      if opts.setup[server] then
        if opts.setup[server](server, server_opts) then
          return
        end
      elseif opts.setup["*"] then
        if opts.setup["*"](server, server_opts) then
          return
        end
      end

      require("lspconfig")[server].setup(server_opts)
    end

    local have_mason, mlsp = pcall(require, "mason-lspconfig")
    local all_mlsp_servers = {}

    if have_mason then
      all_mlsp_servers =
        vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
    end

    local ensure_installed = {
      "bashls",
      "docker_compose_language_service",
      "dockerls",
      "marksman",
      "jsonls",
      "html",
      "lua_ls",
      "sqlls",
      "terraformls",
      "tsserver",
      "yamlls",
    } -- string[]

    for server, server_opts in pairs(servers) do
      if server_opts then
        server_opts = server_opts == true and {} or server_opts
        if server_opts.mason == false or not vim.tbl_contains(all_mlsp_servers, server) then
          setup(server)
        else
          ensure_installed[#ensure_installed + 1] = server
        end
      end
    end

    if have_mason then
      mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
    end
  end,
}
