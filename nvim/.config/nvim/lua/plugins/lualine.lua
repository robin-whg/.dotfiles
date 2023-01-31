return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    { "kyazdani42/nvim-web-devicons" }
  },
  config = function()
    local branch = {
      "branch",
      icons_enabled = true,
      icon = "",
    }
    local lsp = {
      function(msg)
        msg = msg or "LS Inactive"
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
          if type(msg) == "boolean" or #msg == 0 then
            return "[LS Inactive]"
          end
          return msg
        end
        -- local buf_ft = vim.bo.filetype
        local buf_client_names = {}

        -- add client
        for _, client in pairs(buf_clients) do
          if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
          end
        end

        -- add formatter
        -- local formatters = require "lvim.lsp.null-ls.formatters"
        -- local supported_formatters = formatters.list_registered(buf_ft)
        -- vim.list_extend(buf_client_names, supported_formatters)

        -- add linter
        -- local linters = require "lvim.lsp.null-ls.linters"
        -- local supported_linters = linters.list_registered(buf_ft)
        -- vim.list_extend(buf_client_names, supported_linters)

        local unique_client_names = vim.fn.uniq(buf_client_names)

        local language_servers = "[" .. table.concat(unique_client_names, ", ") .. "]"

        return language_servers
      end,
    }

    require("lualine").setup({
      options = {
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'mode', branch, 'filename', 'diff', 'diagnostics' },

        lualine_x = { lsp, 'filetype', 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
    })
  end
}
