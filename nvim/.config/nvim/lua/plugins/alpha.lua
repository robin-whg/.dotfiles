return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local icons = require('config.icons')
    dashboard.section.header.val = {
      [[                               __                ]],
      [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
      [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
      [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
      [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
      [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", icons.NewFile .. " New file", ":ene <BAR> startinsert <cr>"),
      dashboard.button("f", icons.FindFile .. " Find File", "<cmd>Telescope find_files<cr>"),
      dashboard.button("r", icons.History .. " Recent Files", "<cmd>Telescope oldfiles<cr>"),
      -- dashboard.button("r", icons.Project .. " Projects", "<CMD>Telescope projects<CR>"),
      dashboard.button("t", icons.FindText .. " Find Text", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("q", icons.Quit .. " Quit NVIM", ":qa<cr>"),
    }

    local handle = io.popen('fortune')
    if(handle == nil) then
      return
    end

    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune

    dashboard.config.opts.noautocmd = true

    vim.cmd [[autocmd User AlphaReady echo 'ready']]

    alpha.setup(dashboard.config)
  end
}

