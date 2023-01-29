return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' }, -- Optional
    { 'hrsh7th/cmp-path' }, -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' }, -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    require('mason.settings').set({
      ui = {
        border = 'rounded'
      },
    })


    local lsp = require("lsp-zero")

    lsp.preset('recommended')

    local cmp = require('cmp')

    lsp.setup_nvim_cmp({
      documentation = {
        border = 'rounded'
      },
      mapping = lsp.defaults.cmp_mappings({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      })
    })

    local icons = require('config.icons')

    lsp.set_preferences({
      suggest_lsp_servers = true,
      setup_servers_on_start = true,
      set_lsp_keymaps = false,
      configure_diagnostics = true,
      cmp_capabilities = true,
      manage_nvim_cmp = true,
      call_servers = 'local',
      sign_icons = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warning,
        hint = icons.diagnostics.Hint,
        info = icons.diagnostics.Info,
      }
    })

    lsp.on_attach(function(client, bufnr)
      local getOpts = function(desc)
        return {
          buffer = bufnr,
          desc = desc
        }
      end

      local bind = vim.keymap.set

      -- TODO Always show cmd on insert
      -- TODO Show cmp keymaps
      -- TODO <C-k> <C-j> to go through cmp
      -- LspZeroFormat + on save
      -- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.format()

      bind('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', getOpts())
      -- FIXME Not working
      bind('n', '<A-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', getOpts())
      -- FIXME Not working
      bind('n', '<C-.>', '<cmd>lua vim.lsp.buf.code_action()<cr>', getOpts('Code action'))

      bind('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', getOpts('Go to definition'))
      bind('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', getOpts('Go to declaration'))
      bind('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', getOpts('List all implementations'))
      bind('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', getOpts('Go to type definition'))
      bind('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', getOpts('List all references'))

      bind('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', getOpts('Show diagnostics'))
      bind('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', getOpts('Previous diagnostic'))
      bind('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', getOpts('Next diagnostic'))

      bind('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', getOpts('Rename Symbol'))
    end)

    lsp.setup()

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
      },
    })
  end
}
