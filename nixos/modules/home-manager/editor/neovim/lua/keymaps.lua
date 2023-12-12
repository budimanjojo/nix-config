local keymap = vim.keymap
local utils = require("utils")
local g = vim.g

-- Spacebar is <Leader>
keymap.set("", "<Space>", "<Nop>", { silent = true })
g.mapleader = " "
g.maplocalleader = " "

-- Fast save, save quit, force exit
keymap.set("n", "<Leader>w", ":w!<CR>", { desc = "Write!" })
keymap.set("n", "<Leader>x", ":x<CR>", { desc = "Write and exit" })
keymap.set("n", "<Leader>qq", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<Leader>qa", ":qa!<CR>", { desc = "Quit all!" })
keymap.set("n", "<Leader>wq", ":wq!<CR>", { desc = "Write and quit!" })

-- Better cursor movement on wrapped line
keymap.set("n", "k", "gk")
keymap.set("n", "j", "gj")
keymap.set("v", "k", "gk")
keymap.set("v", "j", "gj")
keymap.set("n", "<Up>", "gk")
keymap.set("n", "<Down>", "gj")
keymap.set("v", "<Up>", "gk")
keymap.set("v", "<Down>", "gj")
keymap.set("i", "<Up>", "<C-o>gk")
keymap.set("i", "<Down>", "<C-o>gj")

-- Y to yank from cursor to end of line
keymap.set("n", "Y", "y$", { desc = "Yank to end of line" })

-- Move paragraph
keymap.set("", "K", "{zz", { desc = "Go up a paragraph" })
keymap.set("", "J", "}zz", { desc = "Go down a paragraph" })

-- Move to first and last char
keymap.set("", "H", "^", { desc = "Move cursor to first char" })
keymap.set("", "L", "$", { desc = "Move cursor to last char" })

-- Move selected lines up and down with updated indentation
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Better search movement
keymap.set("n", "n", "nzzzv", { desc = "Go to the next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Go to the previous search result and center" })

-- Move between splits
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to split above" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to split below" })
keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left split" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right split" })

-- Open new split
keymap.set("n", "<Leader>s", ":new<CR>", { desc = "Open new horizontal split" })
keymap.set("n", "<Leader>v", ":vnew<CR>", { desc = "Open new vertical split" })

-- Move cursors in Insert mode
keymap.set("i", "<C-k>", "<Up>")
keymap.set("i", "<C-j>", "<Down>")
keymap.set("i", "<C-h>", "<Left>")
keymap.set("i", "<C-l>", "<Right>")

-- Tab navigation
keymap.set("n", "<Leader>tn", ":tabnew<CR>", { desc = "Create new tab" })
keymap.set("n", "<Leader>tq", ":tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<Leader>th", ":tabprev<CR>", { desc = "Go to the previous tab" })
keymap.set("n", "<Leader>tl", ":tabnext<CR>", { desc = "Go to the next tab" })
keymap.set("n", "<Leader>te", ':tabedit <C-r>=expand("%:p:h")<CR>/', { desc = "Open new tab with current buffer's path" })

-- Indent or de-indent
keymap.set("n", "<Tab>", function() return require('utils').always_working_indent_line() end, { desc = "Add indentation" })
keymap.set("n", "<S-Tab>", "<<", { desc = "De-indentation" })
keymap.set("v", "<Tab>", ">gv", { desc = "Add indentation" })
keymap.set("v", "<S-Tab>", "<gv", { desc = "De-indentation" })

-- Jumping
keymap.set("n", "<Leader>hh", "<C-o>", { desc = "Jump to older cursor position" })
keymap.set("n", "<Leader>ll", "<C-i>", { desc = "Jump to newer cursor position" })

-- lspconfig
keymap.set("n", "<Leader>lr", ":LspRestart<CR>", { desc = "Restart LSP" })

-- FzfLua
keymap.set("n", "<Leader>fz", ":FzfLua<CR>")
keymap.set("n", "<Leader>ff", ":FzfLua files<CR>")
keymap.set("n", "<Leader>fg", ":FzfLua live_grep<CR>")
keymap.set("n", "<Leader>fc", ":FzfLua git_commits<CR>")
keymap.set("n", "<Leader>fb", ":FzfLua buffers<CR>")
keymap.set("n", "<Leader>fh", ":FzfLua help_tags<CR>")
keymap.set("n", "<Leader>fk", ":FzfLua keymaps<CR>")
keymap.set("n", "<Leader>fe", ":FzfLua lsp_document_diagnostics<CR>")
keymap.set("n", "<Leader>fr", ":FzfLua lsp_references<CR>")
keymap.set("n", "<Leader>fd", ":FzfLua lsp_typedefs<CR>")

-- Trouble
keymap.set("n", "<Leader>xx", ":TroubleToggle<CR>")
keymap.set("n", "<Leader>xr", ":TroubleToggle lsp_references<CR>")

-- oil.nvim
keymap.set("n", "<C-f>", function()
  if vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(0), "filetype") == "oil" then
    return require("oil").close()
  else
    return require("oil").open_float(utils.current_path())
  end
end, { desc = "Toggle Oil filemanager" })

-- null-ls
if vim.fn.has("nvim-0.8") == 1 then
  keymap.set("n", "<Leader>pp", function()
    return vim.lsp.buf.format()
  end, { desc = "Fix document formatting" })
else
  keymap.set("n", "<Leader>pp", function()
    return vim.lsp.buf.formatting()
  end, { desc = "Fix document formatting" })
end

keymap.set("v", "<Leader>pp", function()
  return vim.lsp.buf.range_formatting()
end, { desc = "Fix document formatting" })

-- FTermo
keymap.set({ "n", "t" }, "<C-t>", function()
  return require("FTerm").toggle()
end, { desc = "Toggle floating terminal" })

-- hop
keymap.set("n", "<C-g>", function()
  return require("hop").hint_char2({ uppercase_labels = true })
end, { desc = "Hop with 2 characters" })

-- b64.nvim
keymap.set("v", "<leader>be", ":<C-u>lua require('b64').encode()<CR>", { desc = "Encode text with base64" })
keymap.set("v", "<leader>bd", ":<C-u>lua require('b64').decode()<CR>", { desc = "Decode base64 encoded text" })
