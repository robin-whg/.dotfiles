-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- prevent auto comment next line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- disable tsserver if volar is attached
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspAttachConflicts", { clear = true }),
  desc = "Prevent tsserver and volar conflict",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local active_clients = vim.lsp.get_clients()
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client ~= nil and client.name == "volar" then
      for _, c in ipairs(active_clients) do
        if c.name == "tsserver" then
          c.stop()
        end
      end
    elseif client ~= nil and client.name == "tsserver" then
      for _, c in ipairs(active_clients) do
        if c.name == "volar" then
          client.stop()
        end
      end
    end
  end,
})
