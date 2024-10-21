local keymap = vim.keymap -- for conciseness

--------------------  CMD enter command mode with ; -------------------
keymap.set("n", ";", ":", { desc = "CMD enter command mode" })

--------------------  Movement Keys in Insert Mode -------------------
keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" }) -- move to the beginning of the line
keymap.set("i", "<C-e>", "<End>", { desc = "Move End of line" }) -- move to the end of the line
keymap.set("i", "<C-h>", "<Left>", { desc = "Move Left" }) -- move left
keymap.set("i", "<C-l>", "<Right>", { desc = "Move Right" }) -- move right
keymap.set("i", "<C-j>", "<Down>", { desc = "Move Down" }) -- move down
keymap.set("i", "<C-k>", "<Up>", { desc = "Move Up" }) -- move up

--------------------  use jk to exit insert mode -------------------
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

--------------------  clear search highlights -------------------
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlights and resume normal operations" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

--------------------  File operations -------------------
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "File Save" }) -- save current file
keymap.set("n", "<C-c>", "<cmd>%y+<CR>", { desc = "File Copy whole" }) -- copy the whole file to clipboard

--------------------  Toggle Line numbers -------------------
keymap.set("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle Line number" }) -- toggle line numbers
keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle Relative number" }) -- toggle relative line numbers

--------------------  window management -------------------
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--------------------  find and replace -------------------
keymap.set("n", "<leader>ts", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
keymap.set(
	"n",
	"<leader>sw",
	'<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
	{ desc = "Search current word" }
)
keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
keymap.set(
	"n",
	"<leader>sp",
	'<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
	{ desc = "Search on current file" }
)

--------------------  NvimTree mappings -------------------
keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-------------------- LazyGit mappings -------------------
keymap.set("n", "<leader>lg", ":LazyGit<CR>", { noremap = true, silent = true, desc = "Open LazyGit" })

--------------------  LazyDocker mappings -------------------
keymap.set("n", "<leader>ld", ":Lazydocker<CR>", { noremap = true, silent = true, desc = "Open Lazydocker" })

-------------------- Telescope mappings -------------------
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "Find undo history" })
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
keymap.set("n", "<leader>th", "<cmd>Telescope themes<CR>", { desc = "Switch themes" })
keymap.set("n", "<leader>fM", "<cmd>Telescope media<CR>", { desc = "Files with media support" })
keymap.set("n", "<leader>fh", function()
	toggle_telescope(require("harpoon"):list())
end, { desc = "Open Harpoon window" })

--------------------  Comment Toggle mappings -------------------
keymap.set("v", "<leader>/", "gc", { noremap = true, silent = true, desc = "Comment Toggle" }) -- toggle comment in visual mode
keymap.set("n", "<leader>/", "gcc", { noremap = true, silent = true, desc = "Comment Toggle" }) -- toggle comment in normal mode

--------------------  Substitution commands -------------------
keymap.set("n", "s", "<cmd>lua require('substitute').operator()<CR>", { desc = "Substitute with motion" }) -- substitute using motion
keymap.set("n", "ss", "<cmd>lua require('substitute').line()<CR>", { desc = "Substitute line" }) -- substitute entire line
keymap.set("n", "S", "<cmd>lua require('substitute').eol()<CR>", { desc = "Substitute to end of line" }) -- substitute from cursor to end of line
keymap.set("x", "s", "<cmd>lua require('substitute').visual()<CR>", { desc = "Substitute in visual mode" }) -- substitute within visual selection

--------------------  Formatting via LSP
keymap.set(
	{ "n", "v" },
	"<leader>fm",
	"<cmd>lua require('conform').format({lsp_fallback = true, async = false, timeout_ms = 1000})<CR>",
	{ desc = "Format file or range (in visual mode)" }
) -- format document or selection

--------------------  Fugit mappings -------------------
keymap.set("n", "<leader>F", "<cmd>Fugit2<CR>", { desc = "Trigger Fugit2" })

------------------ Gitsigns mappings  -------------------
-- Navigation
keymap.set("n", "]g", "<cmd>lua require('gitsigns').next_hunk()<CR>", { desc = "Next Hunk" })
keymap.set("n", "[g", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { desc = "Previous Hunk" })

-- Actions
keymap.set("n", "<leader>gs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", { desc = "Stage Hunk" })
keymap.set("n", "<leader>gr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { desc = "Reset Hunk" })
keymap.set(
	"v",
	"<leader>gs",
	"<cmd>lua require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })<CR>",
	{ desc = "Stage Selected Hunk" }
)
keymap.set(
	"v",
	"<leader>gr",
	"<cmd>lua require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })<CR>",
	{ desc = "Reset Selected Hunk" }
)

keymap.set("n", "<leader>gS", "<cmd>lua require('gitsigns').stage_buffer()<CR>", { desc = "Stage Buffer" })
keymap.set("n", "<leader>gR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", { desc = "Reset Buffer" })

keymap.set("n", "<leader>gu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { desc = "Undo Stage Hunk" })
keymap.set("n", "<leader>gp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", { desc = "Preview Hunk" })

keymap.set("n", "<leader>gb", "<cmd>lua require('gitsigns').blame_line({ full = true })<CR>", { desc = "Blame Line" })
keymap.set(
	"n",
	"<leader>gB",
	"<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>",
	{ desc = "Toggle Line Blame" }
)

keymap.set("n", "<leader>gd", "<cmd>lua require('gitsigns').diffthis()<CR>", { desc = "Diff This" })
keymap.set("n", "<leader>gD", "<cmd>lua require('gitsigns').diffthis('~')<CR>", { desc = "Diff This ~" })

-- Text object
keymap.set({ "o", "x" }, "ih", "<cmd>lua require('gitsigns').select_hunk()<CR>", { desc = "Select Hunk" })

------------------------------ Which Key mappings ------------------------------
keymap.set("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "Display All Keymaps" })
keymap.set(
	"n",
	"<leader>wk",
	"<cmd>lua vim.cmd('WhichKey ' .. vim.fn.input('WhichKey: '))<CR>",
	{ desc = "Whichkey Query Lookup" }
)

------------------------------  Trouble mappings ------------------------------
keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
keymap.set(
	"n",
	"<leader>tT",
	"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
	{ desc = "Buffer Diagnostics (Trouble)" }
)
keymap.set("n", "<leader>tS", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
keymap.set(
	"n",
	"<leader>tl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
keymap.set("n", "<leader>tL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
keymap.set("n", "<leader>tQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })

------------------------------ Nvterm mappings ------------------------------
keymap.set({ "n", "t" }, "<A-h>", function()
	require("nvterm.terminal").toggle("horizontal")
end, { noremap = true, silent = true, desc = "Toggle horizontal terminal" })

keymap.set({ "n", "t" }, "<A-v>", function()
	require("nvterm.terminal").toggle("vertical")
end, { noremap = true, silent = true, desc = "Toggle vertical terminal" })

keymap.set({ "n", "t" }, "<A-i>", function()
	require("nvterm.terminal").toggle("float")
end, { noremap = true, silent = true, desc = "Toggle floating terminal" })

keymap.set("t", "<C-x>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

------------------------------ Bufferline mappings ------------------------------
keymap.set("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bD", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close all buffers except current" })
keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin buffer" })
keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick buffer" })

------------------------------ Molten mappings ------------------------------
keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { desc = "[m]olten [i]nit" })
keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>", { desc = "Molten eval visual" })
keymap.set("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Molten re-eval cell" })

------------------------------ Quarto mappings ------------------------------
keymap.set(
	"n",
	"<leader>qp",
	'<cmd>lua require("quarto").quartoPreview()<CR>',
	{ silent = true, noremap = true, desc = "Preview Quarto document" }
)

------------------------------ Inlay hints ------------------------------
keymap.set("n", "<leader>he", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

------------------------------ Lazy plugin manager mappings ------------------------------
keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy Plugin Manager" })

------------------------------ Mason mappings ------------------------------
keymap.set("n", "<leader>ms", "<cmd>Mason<CR>", { desc = "Mason Config" })

------------------------------ Debugging (DAP) mappings ------------------------------------
keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })
keymap.set("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Continue" })
keymap.set("n", "<leader>di", "<cmd> DapStepInto <CR>", { desc = "Step into" })
keymap.set("n", "<leader>do", "<cmd> DapStepOut <CR>", { desc = "Step out" })
keymap.set("n", "<leader>ds", "<cmd> DapStepOver <CR>", { desc = "Step over" })
keymap.set("n", "<leader>df", "<cmd> lua require('dap').continue()<CR>", { desc = "Start a debugging session" })
keymap.set("n", "<leader>dq", "<cmd> DapTerminate <CR>", { desc = "Stop debugging" })

------------------------------ Neotest mappings --------------------------------------------
keymap.set("n", "<leader>tm", "<cmd>lua require('neotest').run.run()<cr>", { desc = "Test Method" })
keymap.set(
	"n",
	"<leader>tM",
	"<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>",
	{ desc = "Test Method DAP" }
)
keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = "Test Class" })
keymap.set(
	"n",
	"<leader>tF",
	"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
	{ desc = "Test Class DAP" }
)
keymap.set("n", "<leader>ts", "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = "Test Summary" })

------------------------------- Trim whitespace mappings -----------------------------------
keymap.set("n", "<leader>tw", "<cmd>lua MiniTrailspace.trim()<cr>", { desc = "Trim trailing whitespace" })

------------------------------- Harpoon keymaps -----------------------------------
keymap.set("n", "<leader>ha", "<cmd>lua require('harpoon'):list():add()<cr>", { desc = "Harpoon Add File" })
keymap.set(
	"n",
	"<leader>hh",
	"<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<cr>",
	{ desc = "Harpoon Toggle Menu" }
)
keymap.set("n", "<leader>hn", "<cmd>lua require('harpoon'):list():next()<cr>", { desc = "Harpoon Next" })
keymap.set("n", "<leader>hp", "<cmd>lua require('harpoon'):list():prev()<cr>", { desc = "Harpoon Previous" })

-- Keymaps for navigating to specific marks (up to 5 files)
keymap.set("n", "<leader>h1", "<cmd>lua require('harpoon'):list():select(1)<cr>", { desc = "Harpoon File 1" })
keymap.set("n", "<leader>h2", "<cmd>lua require('harpoon'):list():select(2)<cr>", { desc = "Harpoon File 2" })
keymap.set("n", "<leader>h3", "<cmd>lua require('harpoon'):list():select(3)<cr>", { desc = "Harpoon File 3" })
keymap.set("n", "<leader>h4", "<cmd>lua require('harpoon'):list():select(4)<cr>", { desc = "Harpoon File 4" })
keymap.set("n", "<leader>h5", "<cmd>lua require('harpoon'):list():select(5)<cr>", { desc = "Harpoon File 5" })

------------------------------- NvChad Menu mappings -----------------------------------
-- Keyboard users
keymap.set("n", "<leader>mo", "<cmd> lua require('menu').open('default')<cr>", { desc = "Open NvChad Menu" })

-- mouse users + nvimtree users!
keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})

------------------------------- Mini-files mappings -----------------------------------
keymap.set("n", "<leader>mf", "<cmd>lua MiniFiles.open()<cr>", { desc = "Toggle Mini Files" })
------------------------------ Kulala mappings -----------------------------------
keymap.set("n", "<leader>kr", "<cmd>lua require('kulala').run()<CR>", { desc = "Run the current request" })
keymap.set("n", "<leader>kp", "<cmd>lua require('kulala').jump_prev()<CR>", { desc = "Jump to the previous request" })
keymap.set("n", "<leader>kn", "<cmd>lua require('kulala').jump_next()<CR>", { desc = "Jump to the next request" })
keymap.set("n", "<leader>ki", "<cmd>lua require('kulala').inspect()<CR>", { desc = "Inspect the current request" })

------------------------------ Kubectl mappings -----------------------------------
keymap.set("n", "<leader>kk", '<cmd>lua require("kubectl").toggle()<cr>', { noremap = true, silent = true })

------------------------------- Overseer mappings -----------------------------------
keymap.set("n", "<leader>ow", "<cmd>OverseerToggle<CR>", { desc = "Task list" })
keymap.set("n", "<leader>oo", "<cmd>OverseerRun<CR>", { desc = "Run task" })
keymap.set("n", "<leader>oq", "<cmd>OverseerQuickAction<CR>", { desc = "Action recent task" })
keymap.set("n", "<leader>oi", "<cmd>OverseerInfo<CR>", { desc = "Overseer Info" })
keymap.set("n", "<leader>ob", "<cmd>OverseerBuild<CR>", { desc = "Task builder" })
keymap.set("n", "<leader>ot", "<cmd>OverseerTaskAction<CR>", { desc = "Task action" })
keymap.set("n", "<leader>oc", "<cmd>OverseerClearCache<CR>", { desc = "Clear cache" })

------------------------------- Toggle Term mappings ---------------------------------
-- ToggleTerm keymaps (normal mode)
keymap.set("n", "<leader>\\l", ":ToggleTermSendCurrentLine<CR>", { desc = "Send current line to terminal" })
keymap.set("n", "<leader>\\t", ":lua _HTOP()<CR>", { desc = "Toggle htop terminal" })
keymap.set("n", "<leader>\\i", ":lua _IPYTHON()<CR>", { desc = "Toggle IPython terminal" })
keymap.set("n", "<leader>\\j", ":lua _JULIA()<CR>", { desc = "Toggle Julia terminal" })
-- ToggleTerm keymaps (visual mode)
keymap.set("v", "<leader>\\b", ":'<,'>ToggleTermSendVisualLines<CR>", { desc = "Send selected lines to terminal" })
keymap.set(
	"v",
	"<leader>\\s",
	":'<,'>ToggleTermSendVisualSelection<CR>",
	{ desc = "Send visual selection to terminal" }
)
------------------------------- Oil mappings -----------------------------------
keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open Oil" })
