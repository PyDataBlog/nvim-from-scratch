-- set leader key to space
vim.g.mapleader = " "

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


-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

--------------------  increment/decrement numbers -------------------
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

--------------------  window management -------------------
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })                   -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })                 -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })                    -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })               -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })                     -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

--------------------  Tmux and Vim window navigation -------------------
keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate to the left pane" }) -- navigate to the left pane (Vim or tmux)
keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate to the bottom pane" }) -- navigate to the bottom pane (Vim or tmux)
keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate to the top pane" }) -- navigate to the top pane (Vim or tmux)
keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate to the right pane" }) -- navigate to the right pane (Vim or tmux)

--------------------  find and replace -------------------
keymap.set("n", "<leader>ts", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
keymap.set("n", "<leader>sw", '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', { desc = "Search current word" })
keymap.set("v", "<leader>sw", '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
keymap.set("n", "<leader>sp", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = "Search on current file" })

--------------------  NvimTree mappings -------------------
keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
keymap.set("n","<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })                                                                                             -- toggle file explorer on current file
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

-------------------- Todo Comments mappings -------------------
keymap.set("n", "]t", "<cmd>lua require('todo-comments').jump_next()<CR>", { desc = "Next todo comment" }) -- next todo comment
keymap.set("n", "[t", "<cmd>lua require('todo-comments').jump_prev()<CR>", { desc = "Previous todo comment" }) -- previous todo comment

--------------------  Comment Toggle mappings -------------------
keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { desc = "Comment Toggle" }) -- toggle comment

--------------------  Substitution commands -------------------
keymap.set("n", "s", "<cmd>lua require('substitute').operator()<CR>", { desc = "Substitute with motion" }) -- substitute using motion
keymap.set("n", "ss", "<cmd>lua require('substitute').line()<CR>", { desc = "Substitute line" }) -- substitute entire line
keymap.set("n", "S", "<cmd>lua require('substitute').eol()<CR>", { desc = "Substitute to end of line" }) -- substitute from cursor to end of line
keymap.set("x", "s", "<cmd>lua require('substitute').visual()<CR>", { desc = "Substitute in visual mode" }) -- substitute within visual selection

--------------------  Formatting via LSP
keymap.set({ "n", "v" }, "<leader>fm", "<cmd>lua require('conform').format({lsp_fallback = true, async = false, timeout_ms = 1000})<CR>", { desc = "Format file or range (in visual mode)" }) -- format document or selection

--------------------  Fugit mappings -------------------
keymap.set("n", "<leader>F", "<cmd>Fugit2<CR>", { desc = "Trigger Fugit2" })


------------------ Gitsigns mappings  -------------------
-- Navigation
keymap.set("n", "]h", "<cmd>lua require('gitsigns').next_hunk()<CR>", { desc = "Next Hunk" })
keymap.set("n", "[h", "<cmd>lua require('gitsigns').prev_hunk()<CR>", { desc = "Previous Hunk" })

-- Actions
keymap.set("n", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk()<CR>", { desc = "Stage Hunk" })
keymap.set("n", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk()<CR>", { desc = "Reset Hunk" })
keymap.set("v", "<leader>hs", "<cmd>lua require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })<CR>", { desc = "Stage Selected Hunk" })
keymap.set("v", "<leader>hr", "<cmd>lua require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })<CR>", { desc = "Reset Selected Hunk" })

keymap.set("n", "<leader>hS", "<cmd>lua require('gitsigns').stage_buffer()<CR>", { desc = "Stage Buffer" })
keymap.set("n", "<leader>hR", "<cmd>lua require('gitsigns').reset_buffer()<CR>", { desc = "Reset Buffer" })

keymap.set("n", "<leader>hu", "<cmd>lua require('gitsigns').undo_stage_hunk()<CR>", { desc = "Undo Stage Hunk" })
keymap.set("n", "<leader>hp", "<cmd>lua require('gitsigns').preview_hunk()<CR>", { desc = "Preview Hunk" })

keymap.set("n", "<leader>hb", "<cmd>lua require('gitsigns').blame_line({ full = true })<CR>", { desc = "Blame Line" })
keymap.set("n", "<leader>hB", "<cmd>lua require('gitsigns').toggle_current_line_blame()<CR>", { desc = "Toggle Line Blame" })

keymap.set("n", "<leader>hd", "<cmd>lua require('gitsigns').diffthis()<CR>", { desc = "Diff This" })
keymap.set("n", "<leader>hD", "<cmd>lua require('gitsigns').diffthis('~')<CR>", { desc = "Diff This ~" })

-- Text object
keymap.set({ "o", "x" }, "ih", "<cmd>lua require('gitsigns').select_hunk()<CR>", { desc = "Select Hunk" })

------------------------------ Which Key mappings ------------------------------
keymap.set("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "Display All Keymaps" })
keymap.set("n", "<leader>wk", "<cmd>lua vim.cmd('WhichKey ' .. vim.fn.input('WhichKey: '))<CR>", { desc = "Whichkey Query Lookup" })


------------------------------  Trouble mappings ------------------------------
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { desc = "Open/close trouble list" })
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", { desc = "Open trouble workspace diagnostics" })
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { desc = "Open trouble document diagnostics" })
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Open trouble quickfix list" })
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { desc = "Open trouble location list" })
keymap.set("n", "<leader>xt", "<cmd>TodoTrouble<CR>", { desc = "Open todos in trouble" })
