-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
-- exit insert mode with jj
map("i", "jj", "<Esc>")
-- Move and center the cursor
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-f>", "<C-f>zz")
map("v", "<C-d>", "<C-d>zz")
map("v", "<C-u>", "<C-u>zz")
map("v", "<C-f>", "<C-f>zz")
-- Debugging
map("n", "<leader>d5", function()
  require("dap").continue()
end, { desc = "continue" })
map("n", "<leader>d0", function()
  require("dap").step_over()
end, { desc = "step over" })
map("n", "<leader>d-", function()
  require("dap").step_into()
end, { desc = "step into" })
map("n", "<leader>d=", function()
  require("dap").step_out()
end, { desc = "step out" })
-- Paste the last yanked text
map({ "n", "o" }, "<leader>p", '"0p', { desc = "paste last yanked text" })
map({ "n", "o" }, "<leader>P", '"0P', { desc = "paste last yanked text" })
-- Code inlay
if vim.lsp.inlay_hint then
  vim.keymap.set('n', '<leader>ci', function()
    vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
  end, { desc = 'Toggle Inlay Hints' })
end
-- tmux fix
-- vim-tmux-navigator
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end
