return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    config = function()
        -- import nvim-treesitter plugin
        local treesitter = require("nvim-treesitter.configs")

        -- configure treesitter
        treesitter.setup({ -- enable syntax highlighting
            highlight = {
                enable = true,
            },
            -- enable indentation
            indent = { enable = true },
            -- enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            -- ensure these language parsers are installed
            ensure_installed = {
                "bash",
                "python",
                "julia",
                "go",
                "gosum",
                "gomod",
                "gowork",
                "gitignore",
                "dockerfile",
                "yaml",
                "make",
                "markdown",
                "markdown_inline",
                "r",
                "regex",
                "rust",
                "sql",
                "ssh_config",
                "terraform",
                "toml",
                "tsv",
                "php",
                "pem",
                "java",
                "csv",
                "cpp",
                "cmake",
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "vue",
                "svelte",
                "c",
                "zig",
                "c_sharp",
                "cuda",
                "dart",
                "dot",
                "gitcommit",
                "latex",
                "ruby",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>",
                },
            },
        })
    end,
}
