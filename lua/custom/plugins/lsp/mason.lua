return {
	"williamboman/mason.nvim",
	dependencies = {
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_tool_installer = require("mason-tool-installer")

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

		mason_tool_installer.setup({
			ensure_installed = {
				-------- LIST OF FORMATTERS/DEBUGGERS/LINTERS TO INSTALL -------------
				"prettier",
				"stylua",
				-- Python stuff
				"debugpy",
				"flake8",
				"jupytext",
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
				-- eslint
				"eslint_d",
				-- sql
				"sqlfluff",
				-- markdown
				"markdownlint-cli2",
				"markdown-toc",
				-- terraform
				"tflint",
				-- docker
				"hadolint",
				-- go stuff
				"gofumpt",
				"goimports",
				"golines",
				"gomodifytags",
				------- LANGUAGE SERVERS ----------
				"tailwindcss",
				"ts_ls",
				"html",
				"cssls",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"basedpyright",
				"jsonls",
				"bashls",
				"yamlls",
				"julials",
				"ruff",
				"sqls",
				"taplo",
				"terraformls",
				"marksman",
				"helm_ls",
				"gopls",
				"docker_compose_language_service",
				"dockerls",
				"cypher_ls",
				"clangd",
				"azure_pipelines_ls",
				"cmake",
				-- "nil_ls",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
