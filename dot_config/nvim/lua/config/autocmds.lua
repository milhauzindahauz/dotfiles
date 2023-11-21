-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local util = require("lazyvim.util")
local group_name = "p_group_lazyvim"

local cmd_group = vim.api.nvim_create_augroup(group_name, { clear = true })

local chezmoi_source = "~/.local/share/chezmoi"

local is_tracked_by_chezmoi = function(buff_path)
  local filepath = vim.fn.expand(buff_path)
  local str_f, _ = string.find(filepath, vim.env.HOME)
  if str_f then
    filepath = string.gsub(filepath, vim.env.HOME, "")
    filepath = string.gsub(filepath, "/%.", "/dot_")
  end
  local filepath_to_check = vim.fn.expand(chezmoi_source .. filepath)
  if io.open(filepath_to_check, "r") then
    return true, filepath_to_check
  end

  return false, nil
end

vim.api.nvim_create_autocmd({ "BufReadPost", "VimEnter" }, {
  group = cmd_group,
  callback = function(event)
    local is_tracked, filepath = is_tracked_by_chezmoi("%")
    if is_tracked and filepath ~= nil then
      vim.notify("Configuring file tracked by chezmoi.")
      vim.api.nvim_buf_set_name(event.buf, filepath)
      vim.api.nvim_buf_call(event.buf, vim.cmd.edit)
    end
  end,
  desc = "Injects dotfile tracked by chezmoi to opened buffer.",
})
--- vim.api.nvim_create_autocmd({ "BufLeave", "VimLeave" }, {
---   group = cmd_group,
---   callback = function(event)
---     local buf_name = vim.api.nvim_buf_get_name(event.buf)
---     local is_tracked, filepath = is_tracked_by_chezmoi("%")
---     if is_tracked and filepath ~= nil then
---       print(filepath)
---       print(string.format("name of closing %s", buf_name))
---       io.popen("chezmoi apply")
---     end
---   end,
--- })
