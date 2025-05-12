require "nvchad.mappings"
-- map("mode", "shotcut", "command", { opts })

local map = vim.keymap.set

-- Insert mode
map("i", "jk", "<ESC>")

-- Normal mode
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "j", "gj", { noremap = true })
map("n", "k", "gk", { noremap = true })

map("n", "<leader>dt", function()
  if vim.diagnostic.is_disabled() then
    vim.diagnostic.enable()
    print("Diagnostics enabled")
  else
    vim.diagnostic.disable()
    print("Diagnostics disabled")
  end
end, { desc = "Toggle diagnostics" })


