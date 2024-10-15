return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Import necessary plugins
		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- Set up capabilities for autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Customize Diagnostic symbols in the sign column
		local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		local keymap = vim.keymap -- For conciseness

		-- Create an autocmd for LSP attachment to set keybindings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings
				local opts = { buffer = ev.buf, silent = true }

				-- Set keybinds with descriptions
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

				opts.desc = "Go to definition"
				keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- Define on_attach function for Ruff (Python linter)
		local ruff_on_attach = function(client, bufnr)
			if client.name == "ruff" then
				-- Disable hover in favor of Pyright
				client.server_capabilities.hoverProvider = false
			end
		end

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
			automatic_installation = true,
		})
		mason_lspconfig.setup_handlers({
			-- Default handler for all installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = capabilities,
				})
			end,

			-- Specific handler for gopls with custom settings
			["gopls"] = function()
				lspconfig.gopls.setup({
					capabilities = capabilities,
					settings = {
						gopls = {
							gofumpt = true,
							codelenses = {
								gc_details = false,
								generate = true,
								regenerate_cgo = true,
								run_govulncheck = true,
								test = true,
								tidy = true,
								upgrade_dependency = true,
								vendor = true,
							},
							hints = {
								assignVariableTypes = true,
								compositeLiteralFields = true,
								compositeLiteralTypes = true,
								constantValues = true,
								functionTypeParameters = true,
								parameterNames = true,
								rangeVariableTypes = true,
							},
							analyses = {
								fieldalignment = true,
								nilness = true,
								unusedparams = true,
								unusedwrite = true,
								useany = true,
							},
							usePlaceholders = true,
							completeUnimported = true,
							staticcheck = true,
							directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
							semanticTokens = true,
						},
					},
				})
			end,

			-- Handler for graphql language server
			["graphql"] = function()
				lspconfig["graphql"].setup({
					capabilities = capabilities,
					filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
				})
			end,

			-- Handler for emmet language server
			["emmet_ls"] = function()
				lspconfig["emmet_ls"].setup({
					capabilities = capabilities,
					filetypes = {
						"html",
						"typescriptreact",
						"javascriptreact",
						"css",
						"sass",
						"scss",
						"less",
						"svelte",
					},
				})
			end,

			-- Handler for lua_ls with special settings
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- Make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
							hint = {
								enable = true,
							},
						},
					},
				})
			end,

			-- Handler for ruff language server
			["ruff"] = function()
				lspconfig["ruff"].setup({
					capabilities = capabilities,
					on_attach = ruff_on_attach,
					init_options = {
						settings = {
							format = {
								preview = true,
							},
							lint = {
								enable = true,
								preview = true,
								select = { "E", "F", "N" },
								extendSelect = {
									"W",
									"I",
									"UP007",
									"UP015",
									"FAST001",
									"FAST002",
									"FAST003",
									"RUF100",
									"RUF101",
								},
								ignore = {},
								extendIgnore = {},
							},
							codeAction = {
								disableRuleComment = {
									enable = true,
								},
								fixViolation = {
									enable = true,
								},
							},
							showSyntaxErrors = true,
							organizeImports = true,
							fixAll = true,
							lineLength = 120,
							exclude = {
								".git",
								".ipynb_checkpoints",
								".mypy_cache",
								".pyenv",
								".pytest_cache",
								".pytype",
								".ruff_cache",
								".venv",
								".vscode",
								"__pypackages__",
								"_build",
								"build",
								"dist",
								"site-packages",
								"venv",
							},
						},
					},
				})
			end,

			-- Handler for basedpyright (Python language server)
			["basedpyright"] = function()
				lspconfig["basedpyright"].setup({
					capabilities = capabilities,
					settings = {
						disableOrganizeImports = true,
						basedpyright = {
							typeCheckingMode = "standard",
						},
						analysis = {
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							-- ignore = { "*" },
						},
					},
				})
			end,
		})
	end,
}
