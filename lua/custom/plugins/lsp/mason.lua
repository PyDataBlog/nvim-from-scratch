return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig & regular mason tool installer
		local mason_lspconfig = require("mason-lspconfig")
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

		mason_lspconfig.setup({
			-- list of language servers for mason to install
			ensure_installed = {
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
				"autotools_ls",
				"ruff",
				-- "sql_ls",
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
			},
		})

		mason_tool_installer.setup({
			-- list of formatters/debuggers/linters to install
			ensure_installed = {
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
			},
		})
	end,
}
