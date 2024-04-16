return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- create MasonInstallAll command to install all non servers ie. debugger, linters, formatters, etc.
    local others = {
      "prettier",
      "stylua",
      -- Python stuff
      "black",
      "isort",
      "debugpy",
      "flake8",
      -- JSON stuff
      "jsonlint",
      "jq",
      -- Bash stuff
      "shellcheck",
      "beautysh",
      -- YAML stuff
      "yamllint",
      "prettierd",
      -- rust
      "codelldb",
      "eslint_d",
    }

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      vim.cmd("MasonInstall " .. table.concat(others, " "))
    end)

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "tailwindcss",
        "tsserver",
        "html",
        "cssls",
        "lua_ls",
        "graphql",
        "emmet_ls",
        "prismals",
        "pyright",
        "jsonls",
        "bashls",
        "yamlls",
        "julials",
        "autotools_ls",
        "ruff_lsp",
        "sqlls",
        "taplo",
        "terraformls",
        "marksman",
        "helm_ls",
        "gopls",
        "docker_compose_language_service",
        "docker_ls",
        "cypher_ls",
        "clangd",
        "azure_pipelines_ls",
        "cmake",
      },
    })
  end,
}

